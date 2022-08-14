import 'package:flutter/material.dart';
import 'package:movies_app/commons/widgets/widgets.dart';
import 'package:movies_app/views/welcome/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // TODO: This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: CustomScrollBehavior(),
          child: child!,
        );
      },
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        // Define the default font family.
        fontFamily: 'Gilroy',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          headline2: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
        ).apply(
          displayColor: Colors.white,
        ),

        // Define the default `elevatedButtonTheme`. Use this to specify the default
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            fixedSize: const Size(150, 40),
            onPrimary: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            textStyle:
                Theme.of(context).textTheme.button?.copyWith(fontSize: 16),
            splashFactory: NoSplash.splashFactory,
          ),
        ),
      ),
      home: const WelcomePage(),
    );
  }
}
