import 'package:flutter/material.dart';
import 'package:sum3/data/data.dart';
import 'package:sum3/domain/globals.dart';
import 'package:sum3_uikit/sum3_uikit.dart';

// Губайдуллина Камилла, 24.01.2026 18:00, главный экран в приложении
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              CustomSearch(
                controller: SearchController(),
                colorSearch: input_bg,
                colorCursor: accent,
                hintText: 'Поиск',
                pathIcon: 'assets/search.svg',
                pathIcon2: 'assets/search.svg',
                borderColor: input_stroke,
                borderRadius: 10,
                onPressed: () {},
                widthIcon: 20,
                heightIcon: 20,
                onPressed2: () {},
                widthIcon2: 20,
                heightIcon2: 20,
                padding: 20,
              ),
              SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      'Акции и новости',
                      style: title3Semibold.copyWith(color: caption),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                height: 160,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Image.asset(actionsImage[index]),
                    );
                  },
                  itemCount: actionsImage.length,
                ),
              ),
              SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      'Каталог описаний',
                      style: title3Semibold.copyWith(color: caption),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 48,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: CustomButton(
                          textButton: sectionsName[index],
                          widthButton: sectionsWidth[index],
                          selectedText: white,
                          selectedButton: accent,
                          heightButton: 48,
                          colorButton: input_bg,
                          isSelected: currentSection == index,
                          colorText:  desc,
                          borderRadius: 10,
                          onPressed: () {
                            setState(() {
                              currentSection = index;
                            });
                        animatePage(index);
                          },
                          padding: 10,
                          type: ButtonType.chips,
                        ),
                      );
                    },
                    itemCount: sectionsName.length,
                  ),
                ),
              ),
              SizedBox(
                height: 550,
                child: PageView.builder(
                  itemCount: sectionsName.length,
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentSection = index;
                    });
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        CustomCard(
                          type: CardType.primary,
                          colorCard: Colors.white,
                          title: 'Рубашка Воскресенье для машинного вязания',
                          widthTitle: 300,
                          borderRadius: 10,
                          text: 'Мужская одежда',
                          price: '300 ₽',
                          padding: 20,
                          margin: 20,
                          inCart: cartStatus[0],
                          textButton: 'Добавить',
                          textButton2: 'Убрать',
                          widthButton: 150,
                          heightButton: 40,
                          radiusButton: 10,
                          paddingButton: 0,
                          heightIcon: 50,
                          colorText: white,
                          colorText2: accent,
                          colorButton: accent,
                          colorButton2: white,
                          colorBorder: accent,
                          onPressed: () {
                            setState(() {
                              cartStatus[0] = !cartStatus[0];
                            });
                          },
                        ),
                        CustomCard(
                          type: CardType.primary,
                          colorCard: Colors.white,
                          title: 'Рубашка Воскресенье для машинного вязания',
                          widthTitle: 300,
                          borderRadius: 10,
                          text: 'Мужская одежда',
                          price: '300 ₽',
                          padding: 20,
                          margin: 20,
                          inCart: cartStatus[1],
                          textButton: 'Добавить',
                          textButton2: 'Убрать',
                          widthButton: 150,
                          heightButton: 40,
                          radiusButton: 10,
                          paddingButton: 0,
                          heightIcon: 50,
                          colorText: white,
                          colorText2: accent,
                          colorButton: accent,
                          colorButton2: white,
                          colorBorder: accent,
                          onPressed: () {
                            setState(() {
                              cartStatus[1] = !cartStatus[1];
                            });
                          },
                        ),
                        CustomCard(
                          type: CardType.primary,
                          colorCard: Colors.white,
                          title: 'Рубашка Воскресенье для машинного вязания',
                          widthTitle: 300,
                          borderRadius: 10,
                          text: 'Мужская одежда',
                          price: '300 ₽',
                          padding: 20,
                          margin: 20,
                          inCart: cartStatus[2],
                          textButton: 'Добавить',
                          textButton2: 'Убрать',
                          widthButton: 150,
                          heightButton: 40,
                          radiusButton: 10,
                          paddingButton: 0,
                          heightIcon: 50,
                          colorText: white,
                          colorText2: accent,
                          colorButton: accent,
                          colorButton2: white,
                          colorBorder: accent,
                          onPressed: () {
                            setState(() {
                              cartStatus[2] = !cartStatus[2];
                            });
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
