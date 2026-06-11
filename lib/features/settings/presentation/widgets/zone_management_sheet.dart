import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/core/theme/app_text_styles.dart';
import 'package:mehmon/core/widgets/app_text_field.dart';
import 'package:mehmon/core/widgets/primary_button.dart';
import 'package:mehmon/features/settings/presentation/controllers/profile_controller.dart';
import 'package:mehmon/l10n/app_localizations.dart';

class ZoneManagementSheet extends ConsumerStatefulWidget {
  const ZoneManagementSheet({super.key});

  @override
  ConsumerState<ZoneManagementSheet> createState() =>
      _ZoneManagementSheetState();
}

class _ZoneManagementSheetState extends ConsumerState<ZoneManagementSheet> {
  final ValueNotifier<List<String>> _zones = ValueNotifier(const []);
  final TextEditingController _zoneCtrl = TextEditingController();
  final ValueNotifier<bool> _isLoading = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    final existing = ref.read(profileControllerProvider).valueOrNull?.zones;
    if (existing != null && existing.isNotEmpty) {
      _zones.value = List<String>.from(existing);
    }
  }

  @override
  void dispose() {
    _zones.dispose();
    _zoneCtrl.dispose();
    _isLoading.dispose();
    super.dispose();
  }

  void _addZone() {
    final text = _zoneCtrl.text.trim();
    if (text.isEmpty) return;
    if (_zones.value.contains(text)) {
      _zoneCtrl.clear();
      return;
    }
    _zones.value = [..._zones.value, text];
    _zoneCtrl.clear();
  }

  void _removeZone(String zone) {
    _zones.value = [..._zones.value]..remove(zone);
  }

  Future<void> _submit() async {
    if (_zones.value.isEmpty) return;
    _isLoading.value = true;

    final ok = await ref
        .read(profileControllerProvider.notifier)
        .updateZones(_zones.value);

    if (!mounted) return;
    _isLoading.value = false;

    if (ok) {
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.zonesSaveError)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;
    return AnimatedPadding(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOutCubic,
      padding: EdgeInsets.only(bottom: bottomInset),
      child: DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.7,
        minChildSize: 0.4,
        maxChildSize: 0.95,
        builder: (context, scrollController) {
          return DecoratedBox(
            decoration: const BoxDecoration(
              color: AppColors.card,
              borderRadius:
                  BorderRadius.vertical(top: Radius.circular(28)),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.lg,
                AppSpacing.sm,
                AppSpacing.lg,
                AppSpacing.lg,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Container(
                      width: 48,
                      height: 4,
                      decoration: BoxDecoration(
                        color: AppColors.divider,
                        borderRadius:
                            BorderRadius.circular(AppSpacing.radiusFull),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Text(
                    loc.zoneManagementTitle,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.titleLarge,
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    loc.zoneManagementSubtitle,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bodyMedium,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Expanded(
                    child: ListView(
                      controller: scrollController,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: AppTextField(
                                controller: _zoneCtrl,
                                hint: loc.zoneNameHint,
                              ),
                            ),
                            const SizedBox(width: AppSpacing.sm),
                            Material(
                              color: AppColors.primary,
                              shape: const CircleBorder(),
                              child: InkWell(
                                customBorder: const CircleBorder(),
                                onTap: _addZone,
                                child: const Padding(
                                  padding: EdgeInsets.all(AppSpacing.sm),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.md),
                        ValueListenableBuilder<List<String>>(
                          valueListenable: _zones,
                          builder: (_, zones, __) {
                            if (zones.isEmpty) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: AppSpacing.sm,
                                ),
                                child: Text(
                                  loc.noZonesYet,
                                  style: AppTextStyles.bodySmall,
                                ),
                              );
                            }
                            return Wrap(
                              spacing: AppSpacing.sm,
                              runSpacing: AppSpacing.sm,
                              children: [
                                for (final z in zones)
                                  Chip(
                                    label: Text(z),
                                    labelStyle: const TextStyle(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    backgroundColor: AppColors.primary
                                        .withValues(alpha: 0.12),
                                    side: BorderSide(
                                      color: AppColors.primary
                                          .withValues(alpha: 0.3),
                                    ),
                                    deleteIcon: const Icon(
                                      Icons.close,
                                      size: 16,
                                      color: AppColors.primary,
                                    ),
                                    onDeleted: () => _removeZone(z),
                                  ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  ValueListenableBuilder<List<String>>(
                    valueListenable: _zones,
                    builder: (_, zones, __) {
                      return ValueListenableBuilder<bool>(
                        valueListenable: _isLoading,
                        builder: (_, loading, __) => PrimaryButton(
                          label: loc.saveBtn,
                          isLoading: loading,
                          onPressed: zones.isEmpty ? null : _submit,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
