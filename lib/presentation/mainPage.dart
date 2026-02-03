import 'package:flutter/material.dart';
import 'package:sum3/data/data.dart';
import 'package:sum3_uikit/sum3_uikit.dart';

class MainPage extends StatefulWidget {
  final int selectedIndex;

  const MainPage({super.key, this.selectedIndex = 0});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: buildPage(currentIndex)),
      bottomNavigationBar: CustomTabBar(
        image: [
          'assets/images/home.png',
          'assets/images/catalog.png',
          'assets/images/project.png',
          'assets/images/profile.png',
        ],
        title: ['Главная', 'Каталог', 'Проекты', 'Профиль'],
        selectedValue: currentIndex,
        onPressed: (index) {
          setState(() {
            currentIndex = index;
          });
          setState(() {});
        },
        color: white,
      ),
    );
  }

}
