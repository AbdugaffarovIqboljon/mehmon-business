import 'package:flutter/material.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/features/floor/presentation/widgets/chronology_event_card.dart';
import 'package:mehmon/features/floor/presentation/widgets/chronology_event_icon.dart';
import 'package:mehmon/features/floor/presentation/widgets/chronology_filter_tabs.dart';
import 'package:mehmon/features/floor/presentation/widgets/chronology_section_header.dart';

enum ChronologyFilterType {
  all,
  reservations,
  updates,
  cancellations,
}

extension ChronologyFilterTypeX on ChronologyFilterType {
  String get label => switch (this) {
        ChronologyFilterType.all => 'All',
        ChronologyFilterType.reservations => 'Reservations',
        ChronologyFilterType.updates => 'Updates',
        ChronologyFilterType.cancellations => 'Cancellations',
      };
}

class ChronologyPage extends StatefulWidget {
  const ChronologyPage({super.key});

  @override
  State<ChronologyPage> createState() => _ChronologyPageState();
}

class _ChronologyPageState extends State<ChronologyPage> {
  static const _scrollPhysics = BouncingScrollPhysics(
    parent: AlwaysScrollableScrollPhysics(),
  );

  late final ValueNotifier<ChronologyFilterType> _selectedFilter;
  late final List<_ChronologyEvent> _events;
  late final Map<ChronologyFilterType, List<_ChronologyListItem>>
      _itemsByFilter;

  @override
  void initState() {
    super.initState();
    _selectedFilter = ValueNotifier(ChronologyFilterType.all);
    _events = _buildMockEvents()..sort(_compareEvents);
    _itemsByFilter = {
      for (final filter in ChronologyFilterType.values)
        filter: _buildItems(filter),
    };
  }

  @override
  void dispose() {
    _selectedFilter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final labels =
        ChronologyFilterType.values.map((item) => item.label).toList();

    return Scaffold(
      backgroundColor: AppColors.scaffold,
      appBar: AppBar(
        backgroundColor: AppColors.scaffold,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).maybePop(),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        title: Text(
          'Хронология',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        child: Column(
          children: [
            const SizedBox(height: AppSpacing.xs),
            ValueListenableBuilder<ChronologyFilterType>(
              valueListenable: _selectedFilter,
              builder: (context, selectedFilter, _) {
                return ChronologyFilterTabs(
                  tabs: labels,
                  selectedTab: selectedFilter.label,
                  onSelected: (label) {
                    final matchedFilter =
                        ChronologyFilterType.values.firstWhere(
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
              child: ValueListenableBuilder<ChronologyFilterType>(
                valueListenable: _selectedFilter,
                builder: (context, selectedFilter, _) {
                  final items = _itemsByFilter[selectedFilter] ?? const [];
                  if (items.isEmpty) {
                    return Center(
                      child: Text(
                        'Активности пока нет',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 14,
                              color: AppColors.textSecondary,
                            ),
                      ),
                    );
                  }

                  return ListView.builder(
                    physics: _scrollPhysics,
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

                      final event = item.event!;
                      return Padding(
                        padding: const EdgeInsets.only(top: AppSpacing.sm + 2),
                        child: ChronologyEventCard(
                          type: event.type,
                          title: event.type.title,
                          guestName: event.guestName,
                          table: event.table,
                          guestCount: event.guestCount,
                          reservationNumber: event.reservationNumber,
                          time: event.time,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  int _compareEvents(_ChronologyEvent a, _ChronologyEvent b) {
    final dateCompare = b.date.compareTo(a.date);
    if (dateCompare != 0) {
      return dateCompare;
    }
    return _timeToMinutes(b.time).compareTo(_timeToMinutes(a.time));
  }

  List<_ChronologyListItem> _buildItems(ChronologyFilterType filter) {
    final filteredEvents =
        _events.where((event) => _matchesFilter(filter, event));
    final items = <_ChronologyListItem>[];
    String? currentDateTitle;

    for (final event in filteredEvents) {
      final dateTitle = _dateLabel(event.date);
      if (currentDateTitle != dateTitle) {
        currentDateTitle = dateTitle;
        items.add(_ChronologyListItem.header(dateTitle));
      }
      items.add(_ChronologyListItem.event(event));
    }

    return items;
  }

  bool _matchesFilter(ChronologyFilterType filter, _ChronologyEvent event) {
    if (filter == ChronologyFilterType.all) {
      return true;
    }
    if (filter == ChronologyFilterType.reservations) {
      return event.type == ChronologyEventType.reservationCreated ||
          event.type == ChronologyEventType.guestArrived;
    }
    if (filter == ChronologyFilterType.updates) {
      return event.type == ChronologyEventType.reservationUpdated;
    }
    return event.type == ChronologyEventType.reservationCancelled;
  }

  String _dateLabel(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    if (DateUtils.isSameDay(date, today)) {
      return 'Сегодня';
    }
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    return '$day.$month.${date.year}';
  }

  int _timeToMinutes(String time) {
    final parts = time.split(':');
    if (parts.length != 2) {
      return 0;
    }
    final hours = int.tryParse(parts[0]) ?? 0;
    final minutes = int.tryParse(parts[1]) ?? 0;
    return (hours * 60) + minutes;
  }

  List<_ChronologyEvent> _buildMockEvents() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final previousDate = DateTime(2026, 2, 17);

    return [
      _ChronologyEvent(
        type: ChronologyEventType.reservationCreated,
        guestName: 'Mina Cooper',
        table: 4,
        guestCount: 2,
        reservationNumber: 14,
        time: '19:00',
        date: today,
      ),
      _ChronologyEvent(
        type: ChronologyEventType.guestArrived,
        guestName: 'Mina Cooper',
        table: 4,
        guestCount: 2,
        reservationNumber: 14,
        time: '17:00',
        date: today,
      ),
      _ChronologyEvent(
        type: ChronologyEventType.reservationCancelled,
        guestName: 'Mina Cooper',
        table: 4,
        guestCount: 2,
        reservationNumber: 14,
        time: '17:00',
        date: previousDate,
      ),
      _ChronologyEvent(
        type: ChronologyEventType.reservationUpdated,
        guestName: 'Mina Cooper',
        table: 4,
        guestCount: 2,
        reservationNumber: 14,
        time: '16:00',
        date: previousDate,
      ),
      _ChronologyEvent(
        type: ChronologyEventType.reservationUpdated,
        guestName: 'Mina Cooper',
        table: 4,
        guestCount: 2,
        reservationNumber: 14,
        time: '13:00',
        date: previousDate,
      ),
      _ChronologyEvent(
        type: ChronologyEventType.reservationUpdated,
        guestName: 'Mina Cooper',
        table: 4,
        guestCount: 2,
        reservationNumber: 14,
        time: '12:00',
        date: previousDate,
      ),
      _ChronologyEvent(
        type: ChronologyEventType.reservationCreated,
        guestName: 'Emma Johnson',
        table: 7,
        guestCount: 4,
        reservationNumber: 19,
        time: '11:20',
        date: previousDate,
      ),
    ];
  }
}

class _ChronologyEvent {
  const _ChronologyEvent({
    required this.type,
    required this.guestName,
    required this.table,
    required this.guestCount,
    required this.reservationNumber,
    required this.time,
    required this.date,
  });

  final ChronologyEventType type;
  final String guestName;
  final int table;
  final int guestCount;
  final int reservationNumber;
  final String time;
  final DateTime date;
}

class _ChronologyListItem {
  const _ChronologyListItem.header(this.header) : event = null;

  const _ChronologyListItem.event(this.event) : header = null;

  final String? header;
  final _ChronologyEvent? event;
}
