import 'package:flutter/material.dart';
import 'package:hello/utils.dart/routes.dart';
import 'package:hello/widgets/themes.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int days = 30;
    String name = "codepur";
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: "Myroutes.homeRoute",
      routes: {
        "/": (context) => const Loginpage(),
        Myroutes.homeRoute: (context) => const Homepage(),
        Myroutes.loginRoute: (context) => const Loginpage(),
      },
    );
  }
}
