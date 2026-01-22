// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sum3/data/data.dart';

import 'package:sum3/presentation/main.dart';
import 'package:sum3_uikit/sum3_uikit.dart';
import 'package:sum3_uikit/widget/custom_dropdown.dart';

void main() {
  // // Test 1
  // testWidgets('Work TextField', (WidgetTester tester) async {
  //   await tester.pumpWidget(const MyApp());
  //
  //   // Нажатие на кнопку
  //   await tester.tap(find.text('Проверить'));
  //   await tester.pump();
  //
  //   // Проверка, что видны ошибки
  //   expect(find.text('Введите имя!'), findsOneWidget);
  //   expect(find.text('Введите пароль!'), findsOneWidget);
  //
  // });

  // Test 2
  testWidgets('Work Dropdown', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Проверка, что виден только hintText
    expect(find.text('Пол'), findsOneWidget);
    expect(find.text('Женский'), findsNothing);
    expect(find.text('Мужской'), findsNothing);

    // Нажатие на выпадающий список
    await tester.tap(find.byType(DropdownButton<String>).first);
    await tester.pump();

    // Проверка, что виден bottomsheet
    expect(find.text('Женский'), findsOneWidget);
    expect(find.text('Мужской'), findsOneWidget);
  });

  // Test 3
  testWidgets('Work Button Chips', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Популярные'), findsOneWidget);


  });
}
