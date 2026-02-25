// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter_test/flutter_test.dart';
import 'package:sum3/presentation/test_uikit.dart';
import 'package:sum3_uikit/sum3_uikit.dart';
import 'package:sum3_uikit/widget/custom_dropdown.dart';

void main() {
  // Test 1
  testWidgets('Work TextField', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Проверка, что текстовое поле существует
    final textField = find.byType(CustomTextField).first;
    expect(textField, findsOneWidget);
    final textFieldWidget = tester.widget<CustomTextField>(textField);

    // Соответсвие макету (до нажатия)
    expect(textFieldWidget.colorTextField, input_bg);
    expect(textFieldWidget.borderColor, icons);
    expect(find.text('Введите имя!'), findsNothing);

    // Скролл до кнопки проверки валидации
    await tester.ensureVisible(find.widgetWithText(CustomButton, 'Проверить'));

    // Нажатие на кнопку
    await tester.tap(find.widgetWithText(CustomButton, 'Проверить'));
    await tester.pumpAndSettle();

    // Соответсвие макету (после нажатия)
    expect(find.text('Введите имя!'), findsOneWidget);
    expect(textFieldWidget.colorErrorTextField, error_textfield);
    // По макету: цвет текста и границ при ошибке один и тот же
    expect(textFieldWidget.errorColor, error);
  });

  // Тест 2
  testWidgets('Work Dropdown', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Проверка, что выпадающий список существует
    final dropdown = find.byType(CustomDropDown).first;
    expect(dropdown, findsOneWidget);

    // Проверка, что изначально виден только заголовок списка (например, "Пол")
    final dropdownWidget = tester.widget<CustomDropDown>(dropdown);
    expect(find.text(dropdownWidget.hint), findsOneWidget);

    // Нажатие на выпадающий список
    await tester.tap(dropdown);
    await tester.pumpAndSettle();

    // Проверка, что видны только варианты списка (например, "Женский" или "Мужской")
    expect(find.text(dropdownWidget.title[0]), findsOneWidget);
    expect(find.text(dropdownWidget.title[1]), findsOneWidget);
    expect(find.text(dropdownWidget.hint).first, findsNWidgets(1));
  });

  // Test 3
  testWidgets('Work Button Chips', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Получение кнопки chips по определенным условия
    final chips = find.byWidgetPredicate(
      (w) =>
          w is CustomButton &&
          w.type == ButtonType.chips &&
          w.textButton == 'Популярные',
    );
    expect(chips, findsOneWidget);
    CustomButton chipsWidget = tester.widget<CustomButton>(chips);

    // Проверка, что кнопка статуса off соотвествует макету
    expect(chipsWidget.isSelected, false);
    expect(chipsWidget.colorButton, input_bg);
    expect(chipsWidget.colorText, desc);

    // Скролл до кнопки chips
    await tester.ensureVisible(find.widgetWithText(CustomButton, 'Популярные'));

    // Нажатие на кнопку
    await tester.tap(find.widgetWithText(CustomButton, 'Популярные'));
    await tester.pump();

    // Проверка, что кнопка статуса on соотвествует макету
    expect(tester.widget<CustomButton>(chips).isSelected, true);
    expect(tester.widget<CustomButton>(chips).selectedButton, accent);
    expect(tester.widget<CustomButton>(chips).selectedText, white);
  });

  // Test 4
  testWidgets('Work card primary', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Получение карточки primary по определенным условия
    final cardPrimary = find.byWidgetPredicate(
      (w) => w is CustomCard && w.type == CardType.primary,
    );
    expect(cardPrimary, findsOneWidget);
    final cardWidget = tester.widget<CustomCard>(cardPrimary);

    // Соответсвие макету (до нажатия)
    expect(cardWidget.inCart, false);
    expect(cardWidget.textButton, 'Добавить');
    expect(cardWidget.colorButton, accent);
    expect(cardWidget.colorText, white);

    // Скролл до кнопки
    await tester.ensureVisible(find.widgetWithText(CustomButton, 'Добавить'));

    //
    final addButton = find.descendant(
      of: cardPrimary,
      matching: find.text('Добавить'),
    );
    expect(addButton, findsOneWidget);

    // Нажатие на кнопку
    await tester.tap(addButton);
    await tester.pumpAndSettle();

    // Соответсвие макету (после нажатия)
    // expect(cardWidget.inCart, true);
    expect(cardWidget.textButton, 'Убрать');
    expect(cardWidget.colorButton, white);
    expect(cardWidget.colorText, accent);
    expect(cardWidget.colorBorder, accent);

    expect(find.text('Убрать'), findsOneWidget);
    expect(find.text('Добавить'), findsNothing);
  });
}
