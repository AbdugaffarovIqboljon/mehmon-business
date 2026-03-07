import 'package:flutter/material.dart';
import 'package:mehmon/core/theme/app_colors.dart';
import 'package:mehmon/features/shell/presentation/models/shell_tab_item.dart';

class MainBottomNavigationBar extends StatelessWidget {
  const MainBottomNavigationBar({
    required this.items,
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  final List<ShellTabItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    const mutedColor = Color(0xFF8895B0);
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Color(0xFFF7F7F8),
        border: Border(top: BorderSide(color: Color(0xFFE3E5EA))),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          10,
          8,
          10,
          bottomInset > 0 ? bottomInset : 8,
        ),
        child: Row(
          children: List.generate(items.length, (index) {
            final item = items[index];
            final isSelected = index == currentIndex;
            final itemColor = isSelected ? AppColors.primary : mutedColor;

            return Expanded(
              child: Semantics(
                button: true,
                selected: isSelected,
                label: item.label,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => onTap(index),
                    borderRadius: BorderRadius.circular(14),
                    splashFactory: InkRipple.splashFactory,
                    overlayColor: WidgetStateProperty.resolveWith<Color?>((
                      states,
                    ) {
                      if (states.contains(WidgetState.pressed)) {
                        return AppColors.primary.withValues(alpha: 0.08);
                      }
                      if (states.contains(WidgetState.hovered) ||
                          states.contains(WidgetState.focused)) {
                        return AppColors.primary.withValues(alpha: 0.04);
                      }
                      return Colors.transparent;
                    }),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AnimatedScale(
                            duration: const Duration(milliseconds: 180),
                            curve: Curves.easeOutCubic,
                            scale: isSelected ? 1 : 0.97,
                            child: ImageIcon(
                              AssetImage(item.iconAsset),
                              color: itemColor,
                              size: 32,
                            ),
                          ),
                          const SizedBox(height: 4),
                          AnimatedDefaultTextStyle(
                            duration: const Duration(milliseconds: 180),
                            curve: Curves.easeOutCubic,
                            style: TextStyle(
                              fontSize: 43 / 3,
                              height: 1.1,
                              fontWeight: FontWeight.w400,
                              color: itemColor,
                            ),
                            child: Text(item.label),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
