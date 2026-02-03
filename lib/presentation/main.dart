import 'package:flutter/material.dart';
import 'package:sum3/data/data.dart';
import 'package:sum3/presentation/mainPage.dart';

// Губайдуллина Камилла, 21.01.2026 12:00, точка входа в приложение
void main() {
  runApp(const MyApp());
}

// Губайдуллина Камилла, 21.01.2026 12:00, корневой виджет в приложение
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MainPage());
  }
}

// Губайдуллина Камилла, 24.01.2026 18:00, splash в приложении
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      navigatorSignUp(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splash.png'),
            fit: BoxFit.fill,
          ),
          // gradient: LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   colors: [
          //     Color(0xff5BA3E2),
          //     Color(0xff5079E4),
          //     Color(0xff2254F5),
          //     Color(0xff5079E4),
          //     Color(0xff5BA3E2),
          //   ],
          // ),
        ),
        // child: SafeArea(
        //   child: Center(
        //     child: Text(
        //       'Matule',
        //       style: GoogleFonts.roboto(
        //         color: white,
        //         fontSize: 40,
        //         fontWeight: FontWeight.w500,
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
