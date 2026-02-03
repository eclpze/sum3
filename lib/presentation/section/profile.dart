import 'package:flutter/material.dart';
import 'package:sum3/data/data.dart';
import 'package:sum3_uikit/styles.dart';
import 'package:sum3_uikit/sum3_uikit.dart';
import 'package:sum3_uikit/widget/custom_toggle.dart';

// Губайдуллина Камилла, 24.01.2026 18:00, профиль в приложении
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Text('Эдуард', style: title1ExtraBold),
                  Spacer(),
                ],
              ),
              Row(
                children: [
                  Text(
                    'afersfsr@dsfsr.ru',
                    style: headlineRegular.copyWith(color: caption),
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  CustomIcon(
                    padding: 0,
                    onIcon: () {},
                    widthIcon: 32,
                    heightIcon: 32,
                    pathIcon: 'assets/order.svg',
                  ),
                  SizedBox(width: 20),
                  Text('Мои заказы', style: title3Semibold),
                ],
              ),
              Row(
                children: [
                  CustomIcon(
                    padding: 0,
                    onIcon: () {},
                    widthIcon: 32,
                    heightIcon: 32,
                    pathIcon: 'assets/notification.svg',
                  ),
                  SizedBox(width: 20),
                  Text('Уведомления', style: title3Semibold),
                  Spacer(),
                  CustomToggleButton(
                    widthToggle: 48,
                    heightToggle: 28,
                    sizeToggle: 10,
                    colorToggle: white,
                    colorActive: accent,
                    colorInactive: input_stroke,
                  ),
                ],
              ),
              Spacer(),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      openPDF(
                        context,
                        'assets/pdf/Privacy-Policy.pdf',
                        'Политика конфиденциальности',
                      );
                    },
                    child: Text(
                      'Политика конфиденциальности',
                      style: textMedium.copyWith(color: caption),
                    ),
                  ),
                  SizedBox(height: 24),
                  GestureDetector(
                    onTap: () {
                      openPDF(
                        context,
                        'assets/pdf/User-Agreement.pdf',
                        'Пользовательское соглашение',
                      );
                    },
                    child: Text(
                      'Пользовательское соглашение',
                      style: textMedium.copyWith(color: caption),
                    ),
                  ),
                  SizedBox(height: 24),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Выход',
                      style: textMedium.copyWith(color: error),
                    ),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
