// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'package:flutter_test/flutter_test.dart';
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

   final dropdown = find.byType(CustomDropDown);
   expect(dropdown.first, findsOneWidget);

   final dropdownWidget = tester.widget<CustomDropDown>(dropdown.first);

   expect(find.text(dropdownWidget.hint), findsOneWidget);

  });



}
