import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sum3/domain/globals.dart';
import 'package:sum3/presentation/cart.dart';
import 'package:sum3/presentation/mainPage.dart';
import 'package:sum3/presentation/pincode/pincode.dart';
import 'package:sum3/presentation/section/catalog.dart';
import 'package:sum3/presentation/section/home.dart';
import 'package:sum3/presentation/section/pdfScreen.dart';
import 'package:sum3/presentation/section/profile.dart';
import 'package:sum3/presentation/section/project.dart';
import 'package:sum3/presentation/signUp/logIn.dart';
import 'package:sum3/presentation/signUp/passwordReg.dart';
import 'package:sum3/presentation/signUp/signUp.dart';

// Губайдуллина Камилла, 21.01.2026 12:00, функции проекта

// Валидация для показа uikit
void validator() {
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
}

// Проверка, что значения не пустые
bool get hasSignUp =>
    emailController.text.isNotEmpty && passwordController.text.isNotEmpty;

// Проверка, что значения не пустые
bool get hasLogIn =>
    nameController.text.isNotEmpty &&
    middleNameController.text.isNotEmpty &&
    lastNameController.text.isNotEmpty &&
    dataController.text.isNotEmpty &&
    emailController.text.isNotEmpty &&
    selectedGender != null;

//
bool get hasPassword =>
    passwordController.text.isNotEmpty &&
    passwordReplayController.text.isNotEmpty;

// Валидация почты
bool validEmail() {
  if (emailController.text.trim().isEmpty) {
    emailError = 'Введите почту!';
    return false;
  } else if (!regEmail.hasMatch(emailController.text.trim())) {
    emailError = 'Введите корректную почту!';
    return false;
  } else {
    emailError = null;
    return true;
  }
}

// Валидация имени
void validName() {
  if (nameController.text.trim().isEmpty) {
    nameError = 'Введите имя!';
  } else {
    nameError = null;
  }
}

// Валидация фамилии
void validLastName() {
  if (lastNameController.text.trim().isEmpty) {
    lastNameError = 'Введите фамилию!';
  } else {
    lastNameError = null;
  }
}

// Валидация отчества
void validMiddleName() {
  if (middleNameController.text.trim().isEmpty) {
    middleNameError = 'Введите отчество!';
  } else {
    middleNameError = null;
  }
}

// Валидация даты рождения
void validData() {
  if (dataController.text.trim().isEmpty) {
    dataError = 'Введите дату рождения!';
  } else {
    dataError = null;
  }
}

// Валидация выпадающего списка
void validDropDown() {
  if (selectedGender == null) {
    dropDownError = 'Выберите пол!';
  } else {
    dropDownError = null;
  }
}

// Валидация пароля
void validPassword() {
  if (passwordController.text.trim().isEmpty) {
    passwordError = 'Введите пароль!';
  } else if (passwordController.text.length < 8) {
    passwordError = 'Пароль состоит из 8 символов!';
  } else if (!passwordRegex.hasMatch(passwordController.text.trim())) {
    passwordError = 'Введите корректный пароль!';
  } else {
    passwordError = null;
  }
}

// Валидация повторного пароля
void validReplayPassword() {
  if (passwordReplayController.text.trim().isEmpty) {
    passwordReplayError = 'Введите пароль!';
  } else if (passwordReplayController.text.length < 8) {
    passwordReplayError = 'Пароль состоит из 8 символов!';
  } else {
    passwordReplayError = null;
  }

  if (passwordError == null && passwordReplayError == null) {
    if (passwordReplayController.text != passwordController.text) {
      passwordReplayError = 'Пароли не совпадают!';
    } else {
      passwordError = null;
      passwordReplayError = null;
    }
  }
}

void validProject() {
  if (typeProject == null) {
    typeProjectError = 'Выберите тип проекта';
  } else {
    typeProjectError = null;
  }

  if (nameProjectController.text.trim().isEmpty) {
    nameProjectError = 'Введите названиие проекта';
  } else {
    nameProjectError = null;
  }

  if (dataStartController.text.trim().isEmpty) {
    dataStartError = 'Введите дату начала';
  } else {
    dataStartError = null;
  }

  if (dataEndController.text.trim().isEmpty) {
    dataEndError = 'Введите дату окончания';
  } else {
    dataEndError = null;
  }

  if (people == null) {
    peopleError = 'Выберите для кого проекта';
  } else {
    peopleError = null;
  }

  if (descController.text.trim().isEmpty) {
    descError = 'Введите источник описания';
  } else {
    descError = null;
  }

  if (category == null) {
    categoryError = 'Выберите категорию';
  } else {
    categoryError = null;
  }
}

// Очистка контроллеров
void clearData() {
  nameController.clear();
  lastNameController.clear();
  middleNameController.clear();
  dataController.clear();
  emailController.clear();
  passwordController.clear();
  passwordReplayController.clear();
  dataStartController.clear();
  dataEndController.clear();
  nameProjectController.clear();
  descController.clear();
}

// Очистка ошибок
void clearError() {
  emailError = null;
  nameError = null;
  lastNameError = null;
  middleNameError = null;
  passwordError = null;
  passwordReplayError = null;
  dataError = null;
  dropDownError = null;
  nameProjectError = null;
  dataStartError = null;
  dataEndError = null;
  descError = null;
  typeProjectError = null;
  peopleError = null;
  categoryError = null;
}

// Показ pdf файла
void openPDF(BuildContext context, String pdfPath, String title) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => PdfViewerScreen(pdfPath: pdfPath, title: title),
    ),
  );
}

// Переход к регистрации
void navigatorLogIn(context) {
  Navigator.of(
    context,
  ).pushReplacement(MaterialPageRoute(builder: (context) => LogIn()));
}

// Переход к входу в аккаунт
void navigatorSignUp(context) {
  Navigator.of(
    context,
  ).pushReplacement(MaterialPageRoute(builder: (context) => SignUp()));
}

// Переход на главный экран
void navigatorHome(context, {int selectedIndex = 0}) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) => MainPage(selectedIndex: 0)),
  );
}

// Переход на каталога
void navigatorCatalog(context, {int selectedIndex = 0}) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) => MainPage(selectedIndex: 1)),
  );
}

// Переход на экран проектов
void navigatorProject(context, {int selectedIndex = 0}) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) => MainPage(selectedIndex: 2)),
  );
}

// Переход на экран профиля
void navigatorProfile(context, {int selectedIndex = 0}) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) => MainPage(selectedIndex: 3)),
  );
}

// Переход на экран создания пароля
void navigatorPassword(context) {
  Navigator.of(
    context,
  ).pushReplacement(MaterialPageRoute(builder: (context) => PasswordReg()));
}

// Переход к созданию пинкода
void navigatorPinSigUp(context) {
  Navigator.of(
    context,
  ).pushReplacement(MaterialPageRoute(builder: (context) => PinSignUp()));
}

// Переход к созданию пинкода
void navigatorCart(context) {
  Navigator.of(
    context,
  ).pushReplacement(MaterialPageRoute(builder: (context) => Cart()));
}

//
void navigatorBack(context) {
  Navigator.of(context).pop();
}

//
void animatePage(index) {
  pageController.animateToPage(
    index,
    duration: Duration(milliseconds: 300),
    curve: Curves.easeInOut,
  );
}

//
Widget buildPage(currentIndex) {
  switch (currentIndex) {
    case 0:
      return Home();
    case 1:
      return Catalog();
    case 2:
      return Project();
    case 3:
      return Profile();
    default:
      return Home();
  }
}

//
Future<void> gallery() async {
  await picker.pickImage(source: ImageSource.gallery);
}

//
Future<void> camera() async {
  await picker.pickImage(source: ImageSource.camera);
}
