import 'package:flutter/material.dart';
import 'package:mehmon/core/constants/app_spacing.dart';
import 'package:mehmon/core/theme/app_colors.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    required this.body,
    super.key,
    this.title,
    this.actions,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.showAppBar = true,
    this.backgroundColor,
    this.usePadding = true,
    this.resizeToAvoidBottomInset = true,
  });

  final Widget body;
  final String? title;
  final List<Widget>? actions;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final bool showAppBar;
  final Color? backgroundColor;
  final bool usePadding;
  final bool resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    final content = usePadding
        ? Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppSpacing.md,
              horizontal: AppSpacing.lg,
            ),
            child: body,
          )
        : body;

    return Scaffold(
      backgroundColor: backgroundColor ?? AppColors.scaffold,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: showAppBar
          ? AppBar(
              title: title != null
                  ? Text(
                      title!,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    )
                  : null,
              actions: actions,
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              elevation: 0,
            )
          : null,
      body: SafeArea(child: content),
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
