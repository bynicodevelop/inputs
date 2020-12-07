import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inputs/MainButton.dart';

void main() {
  testWidgets('Should see à label', (WidgetTester tester) async {
    final String testValue = 'Main button';

    await tester.pumpWidget(
      MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          body: MainButton(
            label: testValue,
            onPressed: () {},
          ),
        ),
      ),
    );

    final testerValue = find.text(testValue.toUpperCase());

    expect(testerValue, findsOneWidget);
  });

  testWidgets('Should be enabled', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          body: MainButton(
            label: 'label',
            onPressed: () {},
          ),
        ),
      ),
    );

    final valueFinder = find.byType(RaisedButton);

    expect((valueFinder.evaluate().first.widget as RaisedButton).enabled, true);
  });

  testWidgets('Should be loading when button clicked',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          body: MainButton(
            label: 'label',
            onPressed: () {},
          ),
        ),
      ),
    );

    final valueFinder = find.byType(RaisedButton);

    expect((valueFinder.evaluate().first.widget as RaisedButton).enabled, true);

    await tester.tap(valueFinder);
    await tester.pump();

    expect(
        (valueFinder.evaluate().first.widget as RaisedButton).enabled, false);
  });

  testWidgets('Should run onPressed method', (WidgetTester tester) async {
    bool testValue = false;

    await tester.pumpWidget(
      MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          body: MainButton(
            onPressed: () => testValue = true,
            label: 'label',
          ),
        ),
      ),
    );

    final valueFinder = find.byType(MainButton);

    await tester.tap(valueFinder);
    await tester.pump();

    expect(testValue, true);
  });
}
