import 'package:flutter/material.dart';
import 'package:sum3/data/data.dart';
import 'package:sum3/domain/globals.dart';
import 'package:sum3_uikit/sum3_uikit.dart';

// Губайдуллина Камилла, 24.01.2026 18:00, экран проектов в приложении
class Project extends StatelessWidget {
  const Project({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Spacer(),
                    Text('Проекты', style: title2Semibold),
                    Spacer(),
                    CustomIcon(
                      padding: 0,
                      onIcon: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => CreateProject(),
                          ),
                        );
                      },
                      widthIcon: 20,
                      heightIcon: 20,
                      pathIcon: 'assets/plus.svg',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              CustomCard(
                type: CardType.project,
                colorCard: white,
                title: 'Мой первый проект',
                widthTitle: 300,
                borderRadius: 10,
                text: 'Прошло 2 дня',
                padding: 20,
                margin: 20,
                colorButton: accent,
                widthButton: 150,
                heightButton: 40,
                radiusButton: 10,
                paddingButton: 0,
                textButton: 'Открыть',
                colorText: white,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CreateProject extends StatefulWidget {
  const CreateProject({super.key});

  @override
  State<CreateProject> createState() => _CreateProjectState();
}

class _CreateProjectState extends State<CreateProject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Spacer(),
                    Text('Проект', style: title2Semibold),
                    Spacer(),
                  ],
                ),
              ),
              SizedBox(height: 10),
              CustomDropDown(
                type: DropDownType.no_smiles,
                mainTitle: 'Тип',
                isTitle: true,
                titlePadding: 25,
                title: typeProjectList,
                borderRadius: 10,
                color: input_bg,
                padding: 14,
                margin: 20,
                hint: 'Выберите тип',
                error: typeProjectError,
                onChanged: (value) {
                  typeProject = value;
                  typeProjectError = null;
                  setState(() {});
                },
              ),
              SizedBox(height: 10),
              CustomTextField(
                colorErrorTextField: error_textfield,
                type: TextFieldType.text,
                isTitle: true,
                title: 'Название проекта',
                controller: nameProjectController,
                colorCursor: accent,
                hintText: 'Введите имя',
                borderColor: input_stroke,
                borderRadius: 10,
                padding: 20,
                errorColor: error,
                focusColor: accent,
                colorTextField: input_bg,
                keyboardType: TextInputType.datetime,
                error: nameProjectError,
              ),
              SizedBox(height: 10),
              CustomTextField(
                colorErrorTextField: error_textfield,
                type: TextFieldType.data,
                isTitle: true,
                title: 'Дата начала',
                controller: dataStartController,
                colorCursor: accent,
                hintText: '--.--.----',
                borderColor: input_stroke,
                borderRadius: 10,
                padding: 20,
                errorColor: error,
                focusColor: accent,
                colorTextField: input_bg,
                keyboardType: TextInputType.datetime,
                error: dataStartError,
              ),
              SizedBox(height: 10),
              CustomTextField(
                colorErrorTextField: error_textfield,
                type: TextFieldType.data,
                isTitle: true,
                title: 'Дата окончания',
                controller: dataEndController,
                colorCursor: accent,
                hintText: '--.--.----',
                borderColor: input_stroke,
                borderRadius: 10,
                padding: 20,
                errorColor: error,
                focusColor: accent,
                colorTextField: input_bg,
                keyboardType: TextInputType.datetime,
                error: dataEndError,
              ),
              SizedBox(height: 10),
              CustomDropDown(
                type: DropDownType.no_smiles,
                mainTitle: 'Кому',
                isTitle: true,
                titlePadding: 25,
                title: peopleList,
                borderRadius: 10,
                color: input_bg,
                padding: 14,
                margin: 20,
                hint: 'Выберите кому',
                error: peopleError,
                onChanged: (value) {
                  people = value;
                  peopleError = null;
                  setState(() {});
                },
              ),
              SizedBox(height: 10),
              CustomTextField(
                colorErrorTextField: error_textfield,
                type: TextFieldType.text,
                isTitle: true,
                title: 'Источник описания',
                controller: descController,
                colorCursor: accent,
                hintText: 'example.com',
                borderColor: input_stroke,
                borderRadius: 10,
                padding: 20,
                errorColor: error,
                focusColor: accent,
                colorTextField: input_bg,
                keyboardType: TextInputType.datetime,
                error: descError,
              ),
              SizedBox(height: 10),
              CustomDropDown(
                type: DropDownType.no_smiles,
                mainTitle: 'Категория',
                isTitle: true,
                titlePadding: 25,
                title: categoryList,
                borderRadius: 10,
                color: input_bg,
                padding: 14,
                margin: 20,
                hint: 'Выберите категорию',
                error: categoryError,
                onChanged: (value) {
                  setState(() {
                    category = value;
                    categoryError = null;
                  });
                },
              ),
              SizedBox(height: 30),
              Container(
                width: 202,
                height: 192,
                decoration: BoxDecoration(
                  color: input_bg,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: CustomIcon(
                  padding: 0,
                  onIcon: () {
                    CustomModal.show(
                      typeModal: ModalType.photo,
                      context: context,
                      borderRadiusModal: 10,
                      onIcon: () {},
                      colorModal: white,
                      hasButton: false,
                      title: '',
                      text1: 'Загрузить с устройства',
                      onText1: () {
                        Navigator.of(context).pop();
                        gallery();
                      },
                      text2: 'Снять снимок',
                      onText2: () {
                        Navigator.of(context).pop();
                        camera();
                      },
                      padding: 0,
                    );
                  },
                  widthIcon: 80,
                  heightIcon: 80,
                  pathIcon: 'assets/add.svg',
                ),
              ),
              SizedBox(height: 30),
              CustomButton(
                textButton: 'Подтвердить',
                widthButton: 335,
                heightButton: 56,
                colorButton: accent,
                colorText: white,
                borderRadius: 10,
                onPressed: () {
                  validProject();
                  if (typeProjectError == null &&
                      nameProjectError == null &&
                      dataStartError == null &&
                      dataEndError == null &&
                      peopleError == null &&
                      descError == null &&
                      categoryError == null) {
                    clearError();
                    navigatorProject(context);
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
    );
  }
}
