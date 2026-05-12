import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/services/image_upload_service.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/core/theme/app_text_styles.dart';

/// Tappable row that lets the user pick an image (gallery or camera),
/// uploads it via [ImageUploadService] and yields the resulting URL via
/// [onUrlUploaded]. Renders a small preview when [currentUrl] is non-null.
class ImagePickerButton extends ConsumerStatefulWidget {
  const ImagePickerButton({
    required this.onUrlUploaded,
    super.key,
    this.currentUrl,
  });

  final ValueChanged<String> onUrlUploaded;
  final String? currentUrl;

  @override
  ConsumerState<ImagePickerButton> createState() => _ImagePickerButtonState();
}

class _ImagePickerButtonState extends ConsumerState<ImagePickerButton> {
  final ValueNotifier<bool> _uploading = ValueNotifier<bool>(false);
  final ImagePicker _picker = ImagePicker();

  @override
  void dispose() {
    _uploading.dispose();
    super.dispose();
  }

  Future<ImageSource?> _chooseSource() {
    return showModalBottomSheet<ImageSource>(
      context: context,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSpacing.radiusLg),
        ),
      ),
      builder: (sheetContext) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library_outlined,
                    color: AppColors.primary),
                title: const Text('Galereya', style: AppTextStyles.bodyLarge),
                onTap: () =>
                    Navigator.of(sheetContext).pop(ImageSource.gallery),
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera_outlined,
                    color: AppColors.primary),
                title: const Text('Kamera', style: AppTextStyles.bodyLarge),
                onTap: () =>
                    Navigator.of(sheetContext).pop(ImageSource.camera),
              ),
              const SizedBox(height: AppSpacing.sm),
            ],
          ),
        );
      },
    );
  }

  Future<void> _handleTap() async {
    if (_uploading.value) return;

    final messenger = ScaffoldMessenger.of(context);
    final source = await _chooseSource();
    if (source == null) return;

    final XFile? file;
    try {
      file = await _picker.pickImage(
        source: source,
        maxWidth: 2048,
        imageQuality: 85,
      );
    } on Exception {
      messenger.showSnackBar(
        const SnackBar(content: Text('Rasm tanlanmadi')),
      );
      return;
    }
    if (file == null) return;

    _uploading.value = true;
    try {
      final url = await ref
          .read(imageUploadServiceProvider)
          .uploadImage(file);
      if (!mounted) return;
      widget.onUrlUploaded(url);
    } on Object {
      if (!mounted) return;
      messenger.showSnackBar(
        const SnackBar(content: Text('Yuklashda xato')),
      );
    } finally {
      if (mounted) _uploading.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentUrl = widget.currentUrl;
    final hasPreview = currentUrl != null && currentUrl.isNotEmpty;

    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        onTap: _handleTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.divider),
            borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
          ),
          child: Row(
            children: [
              ValueListenableBuilder<bool>(
                valueListenable: _uploading,
                builder: (_, uploading, __) {
                  if (uploading) {
                    return const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors.primary,
                      ),
                    );
                  }
                  return const Icon(
                    Icons.photo_camera_outlined,
                    color: AppColors.primary,
                  );
                },
              ),
              const SizedBox(width: AppSpacing.md),
              const Expanded(
                child: Text('Rasm yuklash', style: AppTextStyles.titleMedium),
              ),
              if (hasPreview) ...[
                const SizedBox(width: AppSpacing.md),
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                  child: Image.network(
                    currentUrl,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      width: 60,
                      height: 60,
                      color: AppColors.surfaceVariant,
                      child: const Icon(
                        Icons.broken_image_outlined,
                        color: AppColors.textHint,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
