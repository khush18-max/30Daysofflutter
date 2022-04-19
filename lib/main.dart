import 'package:flutter/material.dart';


import 'pages/home_page.dart';
import 'pages/login_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int days = 30;
    String name = "codepur";
    return MaterialApp(
    themeMode: ThemeMode.light,
    theme: ThemeData(primarySwatch: Colors.deepPurple),
    darkTheme: ThemeData(primarySwatch: Colors.red
    ),
    initialRoute: "/home",
    routes: {
      "/" : (context) => const Loginpage(),
      "/home" :(context) => const Homepage(),
      "/Login":(context) => const Loginpage(),
    },
    );
  }
}
