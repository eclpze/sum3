import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sum3_uikit/colors.dart';
import 'package:sum3_uikit/sum3_uikit.dart';

// Губайдуллина Камилла, 21.01.2026 12:00, переменные проекта

// Переменные для показа uikit в Test
int currentValue = 0; // Переменная для навигации
String? errorName; // Переменная для textfield
String? errorPassword; // Переменная для textfield
var clearSearch = searchController.clear();

// Переменные для signUp/logIn
String? emailError;
String? passwordError;
String? passwordReplayError;
String? nameError;
String? lastNameError;
String? middleNameError;
String? dataError;
String? dropDownError;
String? nameProjectError;
String? dataStartError;
String? dataEndError;
String? descError;
String? typeProjectError;
String? peopleError;
String? categoryError;

//
String? selectedGender;
String? typeProject;
String? people;
String? category;

// Валидация почты
final RegExp regEmail = RegExp(
  r'^[a-z0-9]+@[a-z0-9]+\.ru$',
  caseSensitive: true,
);
// Валидация пароля
final RegExp regPassword = RegExp(
  r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\s])(?=.*[!@#$%^&*()_+\-=\[\]{};:"\\|,.<>\/?~`])[\w\s!@#$%^&*()_+\-=\[\]{};:"\\|,.<>\/?~`]{8,}$',
);
// Валидация пароля без обязательного пробела
final RegExp passwordRegex = RegExp(
  r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*()_+\-=\[\]{};:"\\|,.<>\/?~`]).{8,}$',
);

// Контроллеры
TextEditingController searchController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController lastNameController = TextEditingController();
TextEditingController middleNameController = TextEditingController();
TextEditingController dataController = TextEditingController();
TextEditingController dataStartController = TextEditingController();
TextEditingController dataEndController = TextEditingController();
TextEditingController nameProjectController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController passwordReplayController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController descController = TextEditingController();
PageController pageController = PageController();
PageController catalogController = PageController();

// Список вариантов
List<String> genderList = ['Мужской', 'Женский'];
List<String> typeProjectList = ['Социальный', 'Технический'];
List<String> peopleList = ['Мне', 'Друзьям'];
List<String> categoryList = ['Образование', 'Медицина', 'Творчество'];

// Список для показа цветов
List<Color> colors = [
  accent,
  accent_inactive,
  black,
  white,
  error,
  error_textfield,
  success,
  input_bg,
  input_stroke,
  input_icon,
  placeholder,
  desc,
  card_stroke,
  icons,
  caption,
  counter,
];

// Список для показа стилей
List<TextStyle> styles = [
  title1Semibold,
  title1ExtraBold,
  title2Regular,
  title2Semibold,
  title2ExtraBold,
  title3Regular,
  title3Medium,
  title3Semibold,
  headlineRegular,
  headlineMedium,
  textRegular,
  textMedium,
  captionRegular,
  captionSemibold,
  caption2Regular,
  caption2Bold,
];

// Список для показа стилей
List<String> titles = [
  'title1Semibold',
  'title1ExtraBold',
  'title2Regular',
  'title2Semibold',
  'title2ExtraBold',
  'title3Regular',
  'title3Medium',
  'title3Semibold',
  'headlineRegular',
  'headlineMedium',
  'textRegular',
  'textMedium',
  'captionRegular',
  'captionSemibold',
  'caption2Regular',
  'caption2Bold',
];

// Переменная для ввода пинкода
String pin = '';

// Список со значениями кнопок пинкода
final List<String> pinCode = [
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '',
  '0',
  'del',
];

//
List<String> actionsImage = [
  'assets/images/banner.png',
  'assets/images/banner1.png',
];

//
bool selectedValue = false;
List<String> sectionsName = [
  'Все',
  'Женщинам',
  'Мужчинам',
  'Детям',
  'Аксессуары',
];
List<double> sectionsWidth = [78, 150, 150, 110, 150];
int currentSection = 0;
List<bool> cartStatus = List.filled(10, true);

//
final ImagePicker picker = ImagePicker();
