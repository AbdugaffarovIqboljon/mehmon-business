import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/services/image_upload_service.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/core/theme/app_text_styles.dart';

/// Circular avatar picker. Taps open a source sheet (gallery/camera),
/// the chosen image is compressed by [ImagePicker] and uploaded via
/// [ImageUploadService]; the resulting URL is reported via [onUrlUploaded].
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
  static const double _radius = 50;
  static const double _diameter = _radius * 2;

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
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 75,
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

    return SizedBox(
      width: _diameter,
      height: _diameter,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomRight,
        children: [
          GestureDetector(
            onTap: _handleTap,
            behavior: HitTestBehavior.opaque,
            child: ValueListenableBuilder<bool>(
              valueListenable: _uploading,
              builder: (_, uploading, __) {
                return CircleAvatar(
                  radius: _radius,
                  backgroundColor: AppColors.surfaceVariant,
                  backgroundImage: !uploading && hasPreview
                      ? NetworkImage(currentUrl)
                      : null,
                  child: uploading
                      ? const SizedBox(
                          width: 28,
                          height: 28,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                            color: AppColors.primary,
                          ),
                        )
                      : (hasPreview
                          ? null
                          : const Icon(
                              Icons.person_outline,
                              size: 40,
                              color: AppColors.textHint,
                            )),
                );
              },
            ),
          ),
          IgnorePointer(
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.surface, width: 2),
              ),
              child: const Icon(
                Icons.camera_alt,
                size: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
