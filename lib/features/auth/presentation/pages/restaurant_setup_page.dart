import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/routing/route_names.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/core/theme/app_text_styles.dart';
import 'package:mehmon/core/widgets/app_text_field.dart';
import 'package:mehmon/core/widgets/primary_button.dart';
import 'package:mehmon/features/settings/presentation/controllers/profile_controller.dart';

class RestaurantSetupPage extends ConsumerStatefulWidget {
  const RestaurantSetupPage({super.key});

  @override
  ConsumerState<RestaurantSetupPage> createState() =>
      _RestaurantSetupPageState();
}

class _RestaurantSetupPageState extends ConsumerState<RestaurantSetupPage> {
  final ValueNotifier<List<String>> _zones = ValueNotifier(const []);
  final TextEditingController _zoneCtrl = TextEditingController();
  final ValueNotifier<bool> _isLoading = ValueNotifier(false);

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

    final controller = ref.read(profileControllerProvider.notifier);

    final zonesOk = await controller.updateZones(_zones.value);
    if (!mounted) return;
    if (!zonesOk) {
      _isLoading.value = false;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Zonalarni saqlashda xatolik')),
      );
      return;
    }

    final setupOk = await controller.completeSetup();
    if (!mounted) return;
    _isLoading.value = false;

    if (setupOk) {
      context.goNamed(RouteNames.floor);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sozlamani yakunlashda xatolik')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      appBar: AppBar(
        title: const Text('Restoran sozlamasi'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Restoran zonalarini yarating',
                style: AppTextStyles.titleLarge,
              ),
              const SizedBox(height: AppSpacing.xs),
              const Text(
                'Masalan: Asosiy zal, Terassa, VIP. Stol yaratish uchun '
                'kamida bitta zona kerak.',
                style: AppTextStyles.bodyMedium,
              ),
              const SizedBox(height: AppSpacing.lg),
              Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      controller: _zoneCtrl,
                      hint: 'Zona nomi (masalan: Terassa)',
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
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: AppSpacing.sm),
                      child: Text(
                        "Hali zonalar qo'shilmagan",
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
                          backgroundColor:
                              AppColors.primary.withValues(alpha: 0.12),
                          side: BorderSide(
                            color: AppColors.primary.withValues(alpha: 0.3),
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
              const Spacer(),
              ValueListenableBuilder<List<String>>(
                valueListenable: _zones,
                builder: (_, zones, __) {
                  return ValueListenableBuilder<bool>(
                    valueListenable: _isLoading,
                    builder: (_, loading, __) => PrimaryButton(
                      label: 'Sozlamani yakunlash',
                      isLoading: loading,
                      onPressed: zones.isEmpty ? null : _submit,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
