import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mehmon/main.dart';

void main() {
  testWidgets('App renders without errors', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: MehmonApp()));

    // Verify the app renders — login page should be shown by default.
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
