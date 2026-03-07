import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/core/theme/app_text_styles.dart';

class RestaurantPhotoPicker extends StatelessWidget {
  const RestaurantPhotoPicker({
    required this.onTap,
    required this.placeholderText,
    super.key,
    this.imageBytes,
    this.size = 196,
  });

  final VoidCallback onTap;
  final String placeholderText;
  final Uint8List? imageBytes;
  final double size;

  @override
  Widget build(BuildContext context) {
    final hasImage = imageBytes != null;

    return Center(
      child: Material(
        color: AppColors.surface,
        shape: CircleBorder(
          side: BorderSide(
            color: hasImage ? AppColors.primaryLight : AppColors.divider,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          customBorder: const CircleBorder(),
          child: SizedBox(
            width: size,
            height: size,
            child: hasImage
                ? Ink.image(
                    image: MemoryImage(imageBytes!),
                    fit: BoxFit.cover,
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.lg,
                      vertical: AppSpacing.xl,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.add_a_photo_rounded,
                          size: 42,
                          color: AppColors.textPrimary,
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        Text(
                          placeholderText,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
