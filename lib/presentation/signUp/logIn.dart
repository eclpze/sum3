import 'package:flutter/material.dart';
import 'package:sum3/data/data.dart';
import 'package:sum3/domain/globals.dart';
import 'package:sum3_uikit/sum3_uikit.dart';

// Губайдуллина Камилла, 24.01.2026 18:00, регистрация в приложении

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  void initState() {
    super.initState();
    nameController.addListener(updateTextField);
    lastNameController.addListener(updateTextField);
    middleNameController.addListener(updateTextField);
    dataController.addListener(updateTextField);
    emailController.addListener(updateTextField);
  }

  void updateTextField() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    super.dispose();
    nameController.removeListener(updateTextField);
    lastNameController.removeListener(updateTextField);
    middleNameController.removeListener(updateTextField);
    dataController.removeListener(updateTextField);
    emailController.removeListener(updateTextField);
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
                SizedBox(height: 40),
                Row(
                  children: [
                    Text('Создание профиля', style: title1ExtraBold),
                    Spacer(),
                  ],
                ),
                SizedBox(height: 40),
                Row(
                  children: [
                    Text(
                      'Без профиля вы не сможете создавать проекты.',
                      style: textRegular.copyWith(color: caption),
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      'В профиле будут храниться результаты\nпроектов и ваши описания.',
                      style: textRegular.copyWith(color: caption),
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(height: 30),
                CustomTextField(
                  colorErrorTextField: error_textfield,
                  type: TextFieldType.text,
                  isTitle: false,
                  keyboardType: TextInputType.text,
                  title: '',
                  controller: nameController,
                  colorCursor: accent,
                  hintText: 'Имя',
                  borderColor: input_stroke,
                  borderRadius: 10,
                  padding: 0,
                  errorColor: error,
                  focusColor: accent,
                  colorTextField: input_bg,
                  error: nameError,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  colorErrorTextField: error_textfield,
                  type: TextFieldType.text,
                  isTitle: false,
                  keyboardType: TextInputType.text,
                  title: '',
                  controller: middleNameController,
                  colorCursor: accent,
                  hintText: 'Отчество',
                  borderColor: input_stroke,
                  borderRadius: 10,
                  padding: 0,
                  errorColor: error,
                  focusColor: accent,
                  colorTextField: input_bg,
                  error: middleNameError,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  colorErrorTextField: error_textfield,
                  type: TextFieldType.text,
                  isTitle: false,
                  keyboardType: TextInputType.text,
                  title: '',
                  controller: lastNameController,
                  colorCursor: accent,
                  hintText: 'Фамилия',
                  borderColor: input_stroke,
                  borderRadius: 10,
                  padding: 0,
                  errorColor: error,
                  focusColor: accent,
                  colorTextField: input_bg,
                  error: lastNameError,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  colorErrorTextField: error_textfield,
                  type: TextFieldType.data,
                  isTitle: false,
                  keyboardType: TextInputType.number,
                  title: '',
                  controller: dataController,
                  colorCursor: accent,
                  hintText: 'Дата рождения',
                  borderColor: input_stroke,
                  borderRadius: 10,
                  padding: 0,
                  errorColor: error,
                  focusColor: accent,
                  colorTextField: input_bg,
                  error: dataError,
                ),
                SizedBox(height: 20),
                CustomDropDown(
                  isTitle: false,
                  mainTitle: '',
                  titlePadding: 0,
                  type: DropDownType.no_smiles,
                  title: genderList,
                  borderRadius: 10,
                  color: input_bg,
                  padding: 14,
                  margin: 0,
                  hint: 'Пол',
                  error: dropDownError,
                  onChanged: (value) {
                    selectedGender = value;
                    dropDownError = null;
                    setState(() {});
                  },
                ),
                SizedBox(height: 20),
                CustomTextField(
                  colorErrorTextField: error_textfield,
                  type: TextFieldType.text,
                  isTitle: false,
                  keyboardType: TextInputType.emailAddress,
                  title: '',
                  controller: emailController,
                  colorCursor: accent,
                  hintText: 'Почта',
                  borderColor: input_stroke,
                  borderRadius: 10,
                  padding: 0,
                  errorColor: error,
                  focusColor: accent,
                  colorTextField: input_bg,
                  error: emailError,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CustomButton(
                    textButton: 'Далее',
                    widthButton: 380,
                    heightButton: 56,
                    colorButton: hasLogIn ? accent : accent_inactive,
                    colorText: white,
                    borderRadius: 10,
                    onPressed: () {
                      validName();
                      validLastName();
                      validMiddleName();
                      validData();
                      validDropDown();
                      validEmail();
                      if (nameError == null &&
                          lastNameError == null &&
                          middleNameError == null &&
                          emailError == null &&
                          dataError == null &&
                          dropDownError == null) {
                        clearError();
                        navigatorPassword(context);
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
