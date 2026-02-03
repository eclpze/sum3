import 'package:flutter/material.dart';
import 'package:sum3/data/data.dart';
import 'package:sum3/domain/globals.dart';
import 'package:sum3_uikit/sum3_uikit.dart';

// Губайдуллина Камилла, 24.01.2026 18:00, вход в приложении
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  void initState() {
    super.initState();
    emailController.addListener(updateTextField);
    passwordController.addListener(updateTextField);
  }

  void updateTextField() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailController.removeListener(updateTextField);
    passwordController.removeListener(updateTextField);
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
                    Text('Добро пожаловать!', style: title1ExtraBold),
                    Spacer(),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'Войдите, чтобы пользоваться функциями\nприложения',
                      style: textRegular,
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(height: 60),
                CustomTextField(
                  type: TextFieldType.text,
                  isTitle: true,
                  keyboardType: TextInputType.emailAddress,
                  title: 'Вход по E-mail',
                  controller: emailController,
                  colorCursor: accent,
                  hintText: 'example@mail.com',
                  borderColor: input_stroke,
                  borderRadius: 10,
                  padding: 0,
                  errorColor: error,
                  focusColor: accent,
                  colorTextField: input_bg,
                  error: emailError,
                ),
                SizedBox(height: 14),
                CustomTextField(
                  type: TextFieldType.password,
                  isTitle: true,
                  keyboardType: TextInputType.visiblePassword,
                  title: 'Пароль',
                  controller: passwordController,
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
                  error: passwordError,
                ),
                SizedBox(height: 16),
                CustomButton(
                  textButton: 'Далее',
                  widthButton: 380,
                  heightButton: 56,
                  colorButton: hasSignUp ? accent : accent_inactive,
                  colorText: white,
                  borderRadius: 10,
                  onPressed: () {
                    validEmail();
                    validPassword();
                    if (emailError == null && passwordError == null) {
                      clearError();
                      navigatorHome(context);
                      clearData();
                    }
                    if (mounted) {
                      setState(() {});
                    }
                  },
                  padding: 0,
                  type: ButtonType.primary,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 75),
                  child: GestureDetector(
                    onTap: () {
                      clearError();
                      navigatorLogIn(context);
                      clearData();
                    },
                    child: Text(
                      'Зарегистрироваться',
                      style: textRegular.copyWith(color: accent),
                    ),
                  ),
                ),
                Text(
                  'Или войдите с помощью',
                  style: textRegular.copyWith(color: caption),
                ),
                SizedBox(height: 16),
                CustomButton(
                  textButton: 'Войти с VK',
                  widthButton: 380,
                  heightButton: 60,
                  colorButton: white,
                  colorText: black,
                  borderRadius: 10,
                  onPressed: () {},
                  padding: 0,
                  type: ButtonType.login,
                  colorBorder: input_stroke,
                  pathIcon: 'assets/vk.svg',
                  widthIcon: 32,
                  heightIcon: 32,
                  onIcon: () {},
                ),
                SizedBox(height: 16),
                CustomButton(
                  textButton: 'Войти с Yandex',
                  widthButton: 380,
                  heightButton: 60,
                  colorButton: white,
                  colorText: black,
                  colorBorder: input_stroke,
                  borderRadius: 10,
                  onPressed: () {},
                  padding: 0,
                  type: ButtonType.login,
                  pathIcon: 'assets/yandex.svg',
                  widthIcon: 32,
                  heightIcon: 32,
                  onIcon: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
