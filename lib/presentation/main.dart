import 'package:flutter/material.dart';
import 'package:sum3/domain/globals.dart';
import 'package:sum3_uikit/sum3_uikit.dart';

// Губайдуллина Камилла, 21.01.2026 12:00, точка входа в приложение
void main() {
  runApp(const MyApp());
}

// Губайдуллина Камилла, 21.01.2026 12:00, корневой виджет в приложение
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Test());
  }
}

// Губайдуллина Камилла, 21.01.2026 12:00, виджет Test в приложение
class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  int currentValue = 0; // Переменная для навигации
  bool isSelected = false; // Переменная для button chips
  String? errorName; // Переменная для textfield
  String? errorPassword; // Переменная для textfield
  bool inCart = true; // Переменная для card primary

  validator() {
    setState(() {
      if (nameController.text.isEmpty) {
        errorName = 'Введите имя!';
      } else {
        errorName = null;
      }
      if (passwordController.text.isEmpty) {
        errorPassword = 'Введите пароль!';
      } else {
        errorPassword = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F7F7),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(titles[index], style: styles[index]),
                    );
                  },
                  itemCount: titles.length,
                ),
              ),
              CustomDivider(
                colorDivider: input_stroke,
                thicknessDivider: 1,
                paddingDivider: 0,
                heightDivider: 20,
              ),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        width: 50,
                        decoration: BoxDecoration(
                          color: colors[index],
                          border: Border.all(color: black),
                        ),
                      ),
                    );
                  },
                  itemCount: colors.length,
                ),
              ),
              SizedBox(height: 20),
              CustomDropDown(
                type: DropDownType.no_smiles,
                hint: 'Пол',
                title: ['Женский', 'Мужской'],
                borderRadius: 10,
                color: white,
                padding: 20,
                margin: 10,
              ),
              SizedBox(height: 20),
              CustomDropDown(
                type: DropDownType.smiles,
                hint: 'Настроение',
                title: ['Отличное', 'Плохое'],
                smile: ['☺️', '😔'],
                borderRadius: 10,
                color: white,
                padding: 20,
                margin: 10,
              ),
              SizedBox(height: 20),
              CustomSearch(
                controller: searchController,
                padding: 10,
                colorSearch: input_bg,
                colorCursor: accent,
                hintText: 'Поиск',
                pathIcon: 'assets/search.svg',
                pathIcon2: 'assets/close.svg',
                borderColor: input_stroke,
                borderRadius: 10,
                onPressed: () {},
                widthIcon: 20,
                heightIcon: 20,
                onPressed2: () {
                  setState(() {
                    searchController.clear();
                  });
                },
                widthIcon2: 20,
                heightIcon2: 20,
              ),
              SizedBox(height: 20),
              CustomTextField(
                type: TextFieldType.text,
                isTitle: true,
                title: 'Имя',
                controller: nameController,
                colorTextField: input_bg,
                colorCursor: accent,
                hintText: 'Введите имя',
                borderColor: icons,
                borderRadius: 10,
                onPressed: () {},
                widthIcon: 20,
                heightIcon: 20,
                pathIcon: 'assets/eye-on.svg',
                pathIcon2: 'assets/eye-off.svg',
                padding: 10,
                errorColor: error,
                focusColor: accent,
                error: errorName,
              ),
              SizedBox(height: 20),
              CustomTextField(
                type: TextFieldType.password,
                isTitle: true,
                title: 'Пароль',
                controller: passwordController,
                colorTextField: input_bg,
                colorCursor: accent,
                hintText: 'Введите пароль',
                borderColor: icons,
                borderRadius: 10,
                onPressed: () {},
                widthIcon: 20,
                heightIcon: 20,
                pathIcon: 'assets/eye-off.svg',
                pathIcon2: 'assets/eye-on.svg',
                padding: 10,
                errorColor: error,
                error: errorPassword,
                focusColor: accent,
              ),
              SizedBox(height: 20),
              CustomButton(
                textButton: 'Проверить',
                widthButton: 335,
                heightButton: 56,
                colorButton: accent,
                colorText: white,
                borderRadius: 10,
                onPressed: validator,
                padding: 0,
                type: ButtonType.primary,
              ),
              SizedBox(height: 20),
              CustomButton(
                textButton: 'Отправить',
                widthButton: 335,
                heightButton: 56,
                colorButton: accent_inactive,
                colorText: white,
                borderRadius: 10,
                onPressed: () {},
                padding: 0,
                type: ButtonType.inactive,
              ),
              SizedBox(height: 20),
              CustomButton(
                textButton: 'Открыть модальное окно',
                widthButton: 335,
                heightButton: 56,
                colorButton: white,
                colorText: accent,
                borderRadius: 10,
                onPressed: () {
                  CustomModal.show(
                    context: context,
                    onIcon: () {
                      Navigator.of(context).pop();
                    },
                    colorModal: white,
                    borderRadiusModal: 10,
                    widthIcon: 24,
                    heightIcon: 24,
                    pathIcon: 'assets/close.svg',
                    title: 'Рубашка Воскресенье для машинного вязания',
                    widthTitle: 270,
                    hasButton: true,
                    type: ButtonType.primary,
                    textButton: 'Добавить за 690 ₽',
                    widthButton: 335,
                    heightButton: 56,
                    colorButton: accent,
                    colorText: white,
                    borderRadius: 10,
                    onPressed: () {},
                    paddingButton: 0,
                    text1: 'Описание',
                    text2:
                        'Мой выбор для этих шапок – кардные составы, которые раскрываются деликатным пушком. Кашемиры, мериносы, смесовки с ними отлично подойдут на шапку. Кардные составы берите в большое количество сложений, вязать будем резинку 1х1, плотненько. Пряжу 1400-1500м в 100г в 4 сложения, пряжу 700м в 2 сложения. Ориентир для конечной толщины – 300-350м в 100г. Артикулы, из которых мы вязали эту модель: Zermatt Zegna Baruffa, Cashfive, Baby Cashmere Loro Piana, Soft Donegal и другие. Примерный расход на шапку с подгибом 70-90г.',
                    text3: 'Примерный расход:',
                    text4: '80-90 г',
                    padding: 20,
                  );
                },
                padding: 0,
                colorBorder: accent,
                type: ButtonType.secondary,
              ),
              SizedBox(height: 20),
              CustomButton(
                textButton: 'Отправить',
                widthButton: 335,
                heightButton: 56,
                colorButton: input_bg,
                colorText: black,
                borderRadius: 10,
                onPressed: () {},
                padding: 0,
                type: ButtonType.tetriary,
              ),
              SizedBox(height: 20),
              CustomButton(
                textButton: 'В корзину',
                price: '500 ₽',
                pathIcon: 'assets/cart.svg',
                widthIcon: 20,
                heightIcon: 20,
                onIcon: () {},
                widthButton: 335,
                heightButton: 56,
                colorButton: accent,
                colorText: white,
                borderRadius: 10,
                onPressed: () {},
                padding: 0,
                type: ButtonType.cart,
              ),
              SizedBox(height: 20),
              CustomButton(
                textButton: 'Войти с VK',
                widthButton: 335,
                heightButton: 56,
                colorButton: white,
                colorText: black,
                colorBorder: input_stroke,
                pathIcon: 'assets/vk.svg',
                widthIcon: 32,
                heightIcon: 32,
                onIcon: () {},
                borderRadius: 10,
                onPressed: () {},
                padding: 0,
                type: ButtonType.login,
              ),
              SizedBox(height: 20),
              CustomButton(
                textButton: 'Популярные',
                widthButton: 335,
                heightButton: 56,
                colorButton: input_bg,
                colorText: desc,
                borderRadius: 10,
                onPressed: () {
                  setState(() {
                    isSelected = !isSelected;
                  });
                },
                padding: 0,
                type: ButtonType.chips,
                isSelected: isSelected,
              ),
              SizedBox(height: 20),
              CustomHeader(
                type: HeaderType.big,
                padding: 30,
                title: 'Корзина',
                onBubble: () {},
                widthBubble: 32,
                heightBubble: 32,
                pathBubble: 'assets/chevron-left.svg',
                borderRadius: 10,
                colorBubble: input_bg,
                onIcon: () {},
                widthIcon: 22,
                heightIcon: 22,
                pathIcon: 'assets/delete.svg',
              ),
              SizedBox(height: 20),
              CustomHeader(
                type: HeaderType.small,
                padding: 30,
                title: 'Корзина',
                onBubble: () {},
                widthBubble: 32,
                heightBubble: 32,
                pathBubble: 'assets/chevron-left.svg',
                borderRadius: 10,
                colorBubble: input_bg,
                onIcon: () {},
                widthIcon: 22,
                heightIcon: 22,
                pathIcon: 'assets/delete.svg',
              ),
              SizedBox(height: 20),
              CustomCard(
                colorCard: white,
                title: 'Рубашка воскресенье для машинного вязания',
                widthTitle: 275,
                borderRadius: 10,
                text: '1 штук',
                price: '300 ₽',
                onIcon: () {},
                widthIcon: 20,
                heightIcon: 20,
                pathIcon: 'assets/close.svg',
                type: CardType.cart,
                padding: 20,
                colorCounter: counter,
                radiusCounter: 10,
                onPlus: () {},
                widthPlus: 20,
                heightPlus: 20,
                pathPlus: 'assets/plus.svg',
                onMinus: () {},
                widthMinus: 20,
                heightMinus: 20,
                pathMinus: 'assets/minus.svg',
                margin: 20,
              ),
              CustomCard(
                colorCard: white,
                title: 'Рубашка воскресенье для машинного вязания',
                widthTitle: 300,
                borderRadius: 10,
                text: 'Мужская одежда',
                price: '300 ₽',
                type: CardType.primary,
                inCart: inCart,
                onPressed: () {
                  setState(() {
                    inCart = !inCart;
                  });
                },
                widthButton: 130,
                heightButton: 40,
                radiusButton: 10,
                paddingButton: 0,
                textButton: 'Добавить',
                textButton2: 'Убрать',
                colorBorder: accent,
                colorText: white,
                colorText2: accent,
                colorButton: accent,
                colorButton2: white,
                padding: 20,
                margin: 20,
              ),
              CustomCard(
                colorCard: white,
                title: 'Мой первый проект',
                widthTitle: 300,
                borderRadius: 10,
                text: 'Прошло 2 дня',
                type: CardType.project,
                onPressed: () {},
                widthButton: 130,
                heightButton: 40,
                radiusButton: 10,
                paddingButton: 0,
                textButton: 'Открыть',
                colorText: white,
                colorButton: accent,
                padding: 20,
                margin: 20,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomTabBar(
        color: white,
        image: [
          'assets/images/home.png',
          'assets/images/catalog.png',
          'assets/images/project.png',
          'assets/images/profile.png',
        ],
        title: ['Главная', 'Каталог', 'Проекты', 'Профиль'],
        selectedValue: currentValue,
        onPressed: (index) {
          setState(() {
            currentValue = index;
          });
        },
      ),
    );
  }
}
