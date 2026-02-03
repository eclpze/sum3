import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sum3/data/data.dart';
import 'package:sum3/domain/globals.dart';
import 'package:sum3_uikit/sum3_uikit.dart';

// Губайдуллина Камилла, 27.01.2026 10:00, ввод пинкода при зарегистрированном аккаунте в приложении
class PinLogin extends StatelessWidget {
  const PinLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 150),
          Text('Вход', style: title1Semibold),
          const SizedBox(height: 90),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const CustomPinCode(),
          ),
        ],
      ),
    );
  }
}

// Губайдуллина Камилла, 28.01.2026 9:17, создание пинкода в приложении
class PinSignUp extends StatelessWidget {
  const PinSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 150),
          Text('Создайте пароль', style: title1Semibold),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 74),
            child: Text(
              'Для защиты ваших персональных данных',
              style: textRegular.copyWith(color: caption),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const CustomPinCode(),
          ),
        ],
      ),
    );
  }
}

// Губайдуллина Камилла, 27.01.2026 10:00, создание пароля в приложении
class CustomPinCode extends StatefulWidget {
  const CustomPinCode({super.key});

  @override
  State<CustomPinCode> createState() => _CustomPinCodeState();
}

class _CustomPinCodeState extends State<CustomPinCode> {
  String? isPressed;

  void buttonPress(String value, BuildContext context) {
    setState(() {
      isPressed = value;
    });

    Future.delayed(Duration(milliseconds: 170), () {
      setState(() {
        isPressed = null;
      });
    });

    if (value == 'del') {
      if (pin.isNotEmpty) {
        setState(() {
          pin = pin.substring(0, pin.length - 1);
        });
      }
    } else {
      if (pin.length < 4) {
        setState(() {
          pin += value;
        });
        if (pin.length == 4) {
          navigatorHome(context);
        }
      }
    }
  }

  Widget buttons(String value, BuildContext context) {
    bool pressedButton = isPressed == value;

    return GestureDetector(
      onTap: () => buttonPress(value, context),
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: pressedButton && value != 'del' ? accent : input_bg,
        ),
        child: Center(
          child: value == 'del'
              ? SvgPicture.asset(
                  'assets/icon-delete.svg',
                  width: 35,
                  height: 24,
                )
              : Text(
                  value,
                  style: title1Semibold.copyWith(
                    color: pressedButton ? white : black,
                  ),
                ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(4, (index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index < pin.length ? accent : Colors.transparent,
                border: Border.all(color: accent),
              ),
            );
          }),
        ),
        const SizedBox(height: 60),
        Container(
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 15,
              childAspectRatio: 1.4,
            ),
            itemCount: pinCode.length,
            itemBuilder: (context, index) {
              final value = pinCode[index];
              if (value.isEmpty) {
                return const SizedBox.shrink();
              }
              return buttons(value, context);
            },
          ),
        ),
      ],
    );
  }
}
