import 'package:flutter/material.dart';
import 'package:sum3/data/data.dart';
import 'package:sum3/domain/globals.dart';
import 'package:sum3_uikit/sum3_uikit.dart';
import 'package:sum3_uikit/widget/custom_button.dart';

// Губайдуллина Камилла, 24.01.2026 18:00, создание пароля в приложении
class PasswordReg extends StatefulWidget {
  const PasswordReg({super.key});

  @override
  State<PasswordReg> createState() => _PasswordRegState();
}

class _PasswordRegState extends State<PasswordReg> {
  @override
  void initState() {
    super.initState();
    passwordController.addListener(updateTextField);
    passwordReplayController.addListener(updateTextField);
  }

  void updateTextField() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    super.dispose();
    passwordController.removeListener(updateTextField);
    passwordReplayController.removeListener(updateTextField);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 60),
                Row(
                  children: [
                    CustomIcon(
                      padding: 0,
                      onIcon: () {},
                      widthIcon: 32,
                      heightIcon: 32,
                      pathIcon: 'assets/hello.svg',
                    ),
                    SizedBox(width: 10),
                    Text('Создание пароля', style: title1ExtraBold),
                    Spacer(),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text('Введите новый пароль', style: textRegular),
                    Spacer(),
                  ],
                ),
                SizedBox(height: 100),
                CustomTextField(
                  type: TextFieldType.password,
                  isTitle: true,
                  keyboardType: TextInputType.visiblePassword,
                  title: 'Новый Пароль',
                  controller: passwordController,
                  colorCursor: accent,
                  hintText: '*********',
                  borderColor: input_stroke,
                  borderRadius: 10,
                  padding: 0,
                  errorColor: error,
                  focusColor: accent,
                  pathIcon: 'assets/eye-off.svg',
                  pathIcon2: 'assets/eye-on.svg',
                  widthIcon: 20,
                  heightIcon: 20,
                  colorTextField: input_bg,
                  error: passwordError,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  type: TextFieldType.password,
                  isTitle: true,
                  keyboardType: TextInputType.visiblePassword,
                  title: 'Повторите пароль',
                  controller: passwordReplayController,
                  colorCursor: accent,
                  hintText: '*********',
                  borderColor: input_stroke,
                  borderRadius: 10,
                  padding: 0,
                  errorColor: error,
                  focusColor: accent,
                  colorTextField: input_bg,
                  pathIcon: 'assets/eye-off.svg',
                  pathIcon2: 'assets/eye-on.svg',
                  widthIcon: 20,
                  heightIcon: 20,
                  error: passwordReplayError,
                ),
                SizedBox(height: 10),
                CustomButton(
                  textButton: 'Сохранить',
                  widthButton: 380,
                  heightButton: 56,
                  colorButton: hasPassword ? accent : accent_inactive,
                  colorText: white,
                  borderRadius: 10,
                  onPressed: () {
                    validPassword();
                    validReplayPassword();
                    if (passwordError == null && passwordReplayError == null) {
                      clearError();
                      navigatorPinSigUp(context);
                      clearData();
                    } else {
                      if (mounted) {
                        setState(() {});
                      }
                    }
                  },
                  padding: 0,
                  type: ButtonType.primary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
