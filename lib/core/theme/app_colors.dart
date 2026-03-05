import 'package:flutter/material.dart';

/// Centralized color palette for the MEHMON design system.
///
/// Never use raw hex values in UI code — always reference [AppColors].
abstract final class AppColors {
  // ── Brand ─────────────────────────────────────────────────────────────
  static const Color primary = Color(0xFFF49B33);
  static const Color primaryLight = Color(0xFFFFC170);
  static const Color primaryDark = Color(0xFFD07E1E);

  // ── Surfaces ──────────────────────────────────────────────────────────
  static const Color scaffold = Color(0xFFF5F6F7);
  static const Color surface = Colors.white;
  static const Color surfaceVariant = Color(0xFFEDEEF0);
  static const Color card = Colors.white;

  // ── Text ──────────────────────────────────────────────────────────────
  static const Color textPrimary = Color(0xFF1A1A2E);
  static const Color textSecondary = Color(0xFF6C6C80);
  static const Color textHint = Color(0xFFA0A0B0);

  // ── Feedback ──────────────────────────────────────────────────────────
  static const Color success = Color(0xFF2ECC71);
  static const Color error = Color(0xFFE74C3C);
  static const Color warning = Color(0xFFF39C12);
  static const Color info = Color(0xFF3498DB);

  // ── Misc ──────────────────────────────────────────────────────────────
  static const Color divider = Color(0xFFE0E0E0);
  static const Color disabled = Color(0xFFBDBDBD);
  static const Color shadow = Color(0x1A000000);
}
