import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/core/widgets/app_error_view.dart';
import 'package:mehmon/core/widgets/app_scaffold.dart';
import 'package:mehmon/features/floor/domain/entities/activity_log_entity.dart';
import 'package:mehmon/features/floor/presentation/controllers/floor_controller.dart';
import 'package:mehmon/features/floor/presentation/widgets/activity_event_card.dart';
import 'package:mehmon/features/floor/presentation/widgets/chronology_event_icon.dart';
import 'package:mehmon/features/floor/presentation/widgets/chronology_filter_tabs.dart';
import 'package:mehmon/features/floor/presentation/widgets/chronology_section_header.dart';
import 'package:mehmon/l10n/app_localizations.dart';

enum ChronologyFilterType { all, reservations, updates, cancellations }

extension ChronologyFilterTypeX on ChronologyFilterType {
  String get label => switch (this) {
    ChronologyFilterType.all => 'All',
    ChronologyFilterType.reservations => 'Reservations',
    ChronologyFilterType.updates => 'Updates',
    ChronologyFilterType.cancellations => 'Cancellations',
  };
}

ChronologyEventType _typeFromType(String type) {
  return switch (type) {
    'booking_cancelled' => ChronologyEventType.reservationCancelled,
    'booking_updated' => ChronologyEventType.reservationUpdated,
    'check_in' => ChronologyEventType.guestArrived,
    _ => ChronologyEventType.reservationCreated,
  };
}

class ChronologyPage extends ConsumerStatefulWidget {
  const ChronologyPage({super.key});

  @override
  ConsumerState<ChronologyPage> createState() => _ChronologyPageState();
}

class _ChronologyPageState extends ConsumerState<ChronologyPage> {
  static const _scrollPhysics = BouncingScrollPhysics(
    parent: AlwaysScrollableScrollPhysics(),
  );

  late final ValueNotifier<ChronologyFilterType> _selectedFilter;

  @override
  void initState() {
    super.initState();
    _selectedFilter = ValueNotifier(ChronologyFilterType.all);
  }

  @override
  void dispose() {
    _selectedFilter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final labels = ChronologyFilterType.values
        .map((item) => item.label)
        .toList();
    final asyncLogs = ref.watch(activityLogControllerProvider);

    return AppScaffold(
      title: AppLocalizations.of(context)!.chronologyTitle,
      body: Column(
        children: [
          const SizedBox(height: AppSpacing.xs),
          ValueListenableBuilder<ChronologyFilterType>(
            valueListenable: _selectedFilter,
            builder: (context, selectedFilter, _) {
              return ChronologyFilterTabs(
                tabs: labels,
                selectedTab: selectedFilter.label,
                onSelected: (label) {
                  final matchedFilter = ChronologyFilterType.values.firstWhere(
                    (item) => item.label == label,
                    orElse: () => ChronologyFilterType.all,
                  );
                  if (matchedFilter == selectedFilter) {
                    return;
                  }
                  _selectedFilter.value = matchedFilter;
                },
              );
            },
          ),
          const SizedBox(height: AppSpacing.md),
          Expanded(
            child: asyncLogs.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, _) => AppErrorView(
                error: error,
                onRetry: () {
                  ref.read(activityLogControllerProvider.notifier).fetchActivityLog();
                },
              ),
              data: (logs) => _ChronologyList(
                logs: logs,
                selectedFilter: _selectedFilter,
                scrollPhysics: _scrollPhysics,
                onRefresh: () =>
                    ref.read(activityLogControllerProvider.notifier).fetchActivityLog(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChronologyList extends StatelessWidget {
  const _ChronologyList({
    required this.logs,
    required this.selectedFilter,
    required this.scrollPhysics,
    required this.onRefresh,
  });

  final List<ActivityLogEntity> logs;
  final ValueNotifier<ChronologyFilterType> selectedFilter;
  final ScrollPhysics scrollPhysics;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    final sorted = [...logs]..sort((a, b) {
      final aDate = a.createdAtDateTime ?? DateTime.fromMillisecondsSinceEpoch(0);
      final bDate = b.createdAtDateTime ?? DateTime.fromMillisecondsSinceEpoch(0);
      return bDate.compareTo(aDate);
    });

    return ValueListenableBuilder<ChronologyFilterType>(
      valueListenable: selectedFilter,
      builder: (context, filter, _) {
        final items = _buildItems(filter, sorted, context);
        if (items.isEmpty) {
          return RefreshIndicator(
            onRefresh: onRefresh,
            child: ListView(
              physics: scrollPhysics,
              children: [
                const SizedBox(height: 120),
                Center(
                  child: Text(
                    AppLocalizations.of(context)!.noActivityYet,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: onRefresh,
          child: ListView.builder(
            physics: scrollPhysics,
            itemCount: items.length,
            cacheExtent: 720,
            padding: const EdgeInsets.only(bottom: AppSpacing.xl),
            itemBuilder: (context, index) {
              final item = items[index];
              if (item.header != null) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: index == 0 ? AppSpacing.sm : AppSpacing.lg,
                    bottom: AppSpacing.xs,
                  ),
                  child: ChronologySectionHeader(title: item.header!),
                );
              }

              final log = item.log!;
              return Padding(
                padding: const EdgeInsets.only(top: AppSpacing.sm + 2),
                child: ActivityEventCard(entity: log),
              );
            },
          ),
        );
      },
    );
  }

  List<_ChronologyListItem> _buildItems(
    ChronologyFilterType filter,
    List<ActivityLogEntity> sorted,
    BuildContext context,
  ) {
    final filtered = sorted.where((log) => _matchesFilter(filter, log));
    final items = <_ChronologyListItem>[];
    String? currentDateTitle;

    for (final log in filtered) {
      final date = log.createdAtDateTime ?? DateTime.now();
      final dateTitle = _dateLabel(date, context);
      if (currentDateTitle != dateTitle) {
        currentDateTitle = dateTitle;
        items.add(_ChronologyListItem.header(dateTitle));
      }
      items.add(_ChronologyListItem.log(log));
    }
    return items;
  }

  bool _matchesFilter(ChronologyFilterType filter, ActivityLogEntity log) {
    if (filter == ChronologyFilterType.all) {
      return true;
    }
    final type = _typeFromType(log.type);
    if (filter == ChronologyFilterType.reservations) {
      return type == ChronologyEventType.reservationCreated ||
          type == ChronologyEventType.guestArrived;
    }
    if (filter == ChronologyFilterType.updates) {
      return type == ChronologyEventType.reservationUpdated;
    }
    return type == ChronologyEventType.reservationCancelled;
  }

  String _dateLabel(DateTime date, BuildContext context) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final dayOnly = DateTime(date.year, date.month, date.day);
    if (DateUtils.isSameDay(dayOnly, today)) {
      return AppLocalizations.of(context)!.todayLabel;
    }
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    return '$day.$month.${date.year}';
  }
}

class _ChronologyListItem {
  const _ChronologyListItem.header(this.header) : log = null;
  const _ChronologyListItem.log(this.log) : header = null;

  final String? header;
  final ActivityLogEntity? log;
}
