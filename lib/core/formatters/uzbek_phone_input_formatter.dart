import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Shared Uzbek phone helpers for input formatting and validation.
abstract final class UzbekPhoneInput {
  static const String countryCode = '+998';
  static const int localNumberLength = 9;

  static const List<TextInputFormatter> inputFormatters = [
    UzbekPhoneTextInputFormatter(),
  ];

  /// Initializes a controller with the protected `+998` prefix.
  static void seedController(TextEditingController controller) {
    controller.value = const TextEditingValue(
      text: countryCode,
      selection: TextSelection.collapsed(offset: countryCode.length),
    );
  }

  static bool isValid(String? value) {
    if (value == null) return false;
    return extractLocalDigits(value).length == localNumberLength;
  }

  /// Returns true only when input reaches full local length for the first time.
  static bool justCompleted({
    required String previousValue,
    required String currentValue,
  }) {
    final previousLength = extractLocalDigits(previousValue).length;
    final currentLength = extractLocalDigits(currentValue).length;
    return previousLength < localNumberLength &&
        currentLength == localNumberLength;
  }

  /// Converts any formatted value to a normalized E.164 value.
  static String toE164(String value) {
    return '$countryCode${extractLocalDigits(value)}';
  }

  static String extractLocalDigits(String value) {
    final digits = _digitsOnly(value);
    final withoutCountry = digits.startsWith('998')
        ? digits.substring(3)
        : digits;
    return withoutCountry.substring(
      0,
      math.min(withoutCountry.length, localNumberLength),
    );
  }

  static String formatLocalDigits(String localDigits) {
    final sanitized = localDigits.substring(
      0,
      math.min(localDigits.length, localNumberLength),
    );
    if (sanitized.isEmpty) return countryCode;

    final parts = <String>[
      sanitized.substring(0, math.min(2, sanitized.length)),
    ];
    if (sanitized.length > 2) {
      parts.add(sanitized.substring(2, math.min(5, sanitized.length)));
    }
    if (sanitized.length > 5) {
      parts.add(sanitized.substring(5, math.min(7, sanitized.length)));
    }
    if (sanitized.length > 7) {
      parts.add(sanitized.substring(7, math.min(9, sanitized.length)));
    }

    return '$countryCode ${parts.join(' ')}'.trimRight();
  }

  static int cursorOffsetForLocalDigits({
    required String formattedValue,
    required int localDigitsBeforeCursor,
  }) {
    if (localDigitsBeforeCursor <= 0) return countryCode.length;

    var countryDigitsSeen = 0;
    var localDigitsSeen = 0;

    for (var i = 0; i < formattedValue.length; i++) {
      final ch = formattedValue[i];
      if (!_isDigit(ch)) continue;

      if (countryDigitsSeen < 3) {
        countryDigitsSeen++;
        continue;
      }

      localDigitsSeen++;
      if (localDigitsSeen >= localDigitsBeforeCursor) {
        return i + 1;
      }
    }

    return formattedValue.length;
  }

  static String _digitsOnly(String value) {
    return value.replaceAll(RegExp(r'\D'), '');
  }

  static bool _isDigit(String ch) {
    return ch.codeUnitAt(0) >= 48 && ch.codeUnitAt(0) <= 57;
  }
}

class UzbekPhoneTextInputFormatter extends TextInputFormatter {
  const UzbekPhoneTextInputFormatter();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final localDigits = UzbekPhoneInput.extractLocalDigits(newValue.text);
    final formatted = UzbekPhoneInput.formatLocalDigits(localDigits);

    final safeCursorEnd = newValue.selection.isValid
        ? math.min(math.max(newValue.selection.end, 0), newValue.text.length)
        : newValue.text.length;
    final beforeCursor = newValue.text.substring(0, safeCursorEnd);
    final localDigitsBeforeCursor = UzbekPhoneInput.extractLocalDigits(
      beforeCursor,
    );
    final targetOffset = UzbekPhoneInput.cursorOffsetForLocalDigits(
      formattedValue: formatted,
      localDigitsBeforeCursor: math.min(
        localDigitsBeforeCursor.length,
        localDigits.length,
      ),
    );

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: targetOffset),
    );
  }
}
