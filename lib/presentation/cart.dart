import 'package:flutter/material.dart';
import 'package:sum3/data/data.dart';
import 'package:sum3_uikit/sum3_uikit.dart';
import 'package:sum3_uikit/widget/custom_snackbar.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            CustomHeader(
              type: HeaderType.big,
              title: 'Корзина',
              onBubble: () {
                navigatorCatalog(context);
              },
              widthBubble: 32,
              heightBubble: 32,
              pathBubble: 'assets/chevron-left.svg',
              borderRadius: 10,
              colorBubble: input_bg,
              onIcon: () {},
              widthIcon: 20,
              heightIcon: 20,
              pathIcon: 'assets/delete.svg',
              padding: 20,
            ),
            SizedBox(height: 20),
            CustomCard(
              type: CardType.cart,
              colorCard: white,
              title: 'Рубашка Воскресенье для машинного вязания',
              widthTitle: 270,
              borderRadius: 10,
              text: '1 штук',
              padding: 20,
              margin: 20,
              colorCounter: input_bg,
              radiusCounter: 10,
              widthMinus: 20,
              widthPlus: 20,
              heightMinus: 20,
              heightPlus: 20,
              price: '300 ₽',
              pathMinus: 'assets/minus.svg',
              pathPlus: 'assets/plus.svg',
              onPlus: () {},
              onMinus: () {},
              onIcon: () {},
              widthIcon: 20,
              heightIcon: 20,
              pathIcon: 'assets/close.svg',
              heightCounter: 32,
              widthCounter: 100,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text('Сумма', style: title2Semibold),
                  Spacer(),
                  Text('2490 ₽', style: title2Semibold),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: CustomButton(
                textButton: 'Перейти к оформлению заказа',
                widthButton: 335,
                heightButton: 56,
                colorButton: accent,
                colorText: white,
                borderRadius: 10,
                onPressed: () {
                  CustomSnackBar.show(
                    context: context,
                    pathIcon: 'assets/dismiss.svg',
                    title: 'Заказ',
                    text: 'Успешно подтвержден!',
                    colorSnackBar: white,
                    radius: 10,
                  );
                },
                padding: 0,
                type: ButtonType.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

