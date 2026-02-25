import 'package:flutter/material.dart';
import 'package:sum3/data/data.dart';
import 'package:sum3/domain/globals.dart';
import 'package:sum3_uikit/sum3_uikit.dart';
import 'package:sum3_uikit/widget/custom_search.dart';

// Губайдуллина Камилла, 27.01.2026 18:00, каталог в приложении
class Catalog extends StatefulWidget {
  const Catalog({super.key});

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: CustomSearch(
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
                  ),
                  CustomIcon(
                    padding: 0,
                    onIcon: () {},
                    widthIcon: 32,
                    heightIcon: 32,
                    pathIcon: 'assets/profile.svg',
                  ),
                ],
              ),
              SizedBox(height: 32),
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
                          colorText: desc,
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
                height: 650,
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
                        GestureDetector(
                          onTap: () {
                            CustomModal.show(
                              typeModal: ModalType.origin,
                              context: context,
                              onIcon: () {
                              navigatorBack(context);
                              },
                              colorModal: white,
                              borderRadiusModal: 10,
                              widthIcon: 24,
                              heightIcon: 24,
                              pathIcon: 'assets/close.svg',
                              title:
                                  'Рубашка Воскресенье для машинного вязания',
                              widthTitle: 270,
                              hasButton: true,
                              type: ButtonType.primary,
                              textButton: 'Добавить за 690 ₽',
                              widthButton: 335,
                              heightButton: 56,
                              colorButton: accent,
                              colorText: white,
                              borderRadius: 10,
                              onPressed: () {
                                Navigator.of(context).pop();
                                setState(() {
                                  cartStatus[3] = !cartStatus[3];
                                });
                              },
                              paddingButton: 0,
                              text1: 'Описание',
                              text2:
                                  'Мой выбор для этих шапок – кардные составы, которые раскрываются деликатным пушком. Кашемиры, мериносы, смесовки с ними отлично подойдут на шапку.\nКардные составы берите в большое количество сложений, вязать будем резинку 1х1, плотненько.\nПряжу 1400-1500м в 100г в 4 сложения, пряжу 700м в 2 сложения. Ориентир для конечной толщины – 300-350м в 100г.\nАртикулы, из которых мы вязали эту модель: Zermatt Zegna Baruffa, Cashfive, Baby Cashmere Loro Piana, Soft Donegal и другие. Примерный расход на шапку с подгибом 70-90г.',
                              text3: 'Примерный расход:',
                              text4: '80-90 г',
                              padding: 20,
                            );
                          },
                          child: CustomCard(
                            type: CardType.primary,
                            colorCard: Colors.white,
                            title: 'Рубашка Воскресенье для машинного вязания',
                            widthTitle: 300,
                            borderRadius: 10,
                            text: 'Мужская одежда',
                            price: '300 ₽',
                            padding: 20,
                            margin: 20,
                            inCart: cartStatus[3],
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
                                cartStatus[3] = !cartStatus[3];
                              });
                            },
                          ),
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
                          inCart: cartStatus[4],
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
                              cartStatus[4] = !cartStatus[4];
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
                          inCart: cartStatus[5],
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
                              cartStatus[5] = !cartStatus[5];
                            });
                          },
                        ),
                        if (cartStatus[3] == false ||
                            cartStatus[4] == false ||
                            cartStatus[5] == false)
                          CustomButton(
                            textButton: 'В корзину',
                            widthButton: 335,
                            heightButton: 50,
                            colorButton: accent,
                            colorText: white,
                            borderRadius: 10,
                            onPressed: () {
                              navigatorCart(context);
                            },
                            widthIcon: 20,
                            heightIcon: 20,
                            onIcon: () {},
                            pathIcon: 'assets/cart.svg',
                            price: '500 ₽',
                            padding: 0,
                            type: ButtonType.cart,
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
