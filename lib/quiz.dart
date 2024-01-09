import 'package:adv_basics/columnChart.dart';
import 'package:adv_basics/login.dart';
import 'package:adv_basics/mfaRegister.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));

var defaultTheme = const CupertinoThemeData().copyWith(
  brightness: Brightness.light,
  applyThemeToAll: true,
  barBackgroundColor: CupertinoColors.activeBlue,
  primaryContrastingColor: Colors.amber,
  primaryColor: CupertinoColors.activeBlue,
  //primaryContrastingColor: CupertinoColors.activeGreen,
  scaffoldBackgroundColor: CupertinoColors.lightBackgroundGray,
  textTheme: const CupertinoTextThemeData(
    textStyle: TextStyle(fontSize: 14, color: Colors.white),
  ),
);

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = const MFA();
    });
  }

  @override
  Widget build(context) {
    return CupertinoAdaptiveTheme(
      light: const CupertinoThemeData(
      
        brightness: Brightness.light,
        //primaryColor: CupertinoColors.extraLightBackgroundGray,
       // barBackgroundColor: CupertinoColors.activeBlue,
       // scaffoldBackgroundColor: CupertinoColors.extraLightBackgroundGray,
      ),
      dark: const CupertinoThemeData(
        brightness: Brightness.dark,
              //  primaryColor: CupertinoColors.darkBackgroundGray,

        // scaffoldBackgroundColor: CupertinoColors.extraLightBackgroundGray,
      ),
      initial: AdaptiveThemeMode.light,
    
      builder: (theme) => CupertinoApp(
        title: 'Adaptive Theme Demo',
        theme: theme,
        // darkTheme: defaultTheme,
        home: const Login(), 
      ),
    );
  }
}
