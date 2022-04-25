import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello/utils.dart/routes.dart';
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
      theme: ThemeData(
          primarySwatch: Colors.deepPurple, 
          fontFamily: GoogleFonts.lato().fontFamily,  
          primaryTextTheme: GoogleFonts.latoTextTheme()),
          debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(primarySwatch: Colors.red),
      initialRoute: "Myroutes.homeRoute",
      routes: {
        "/": (context) => const Loginpage(),
        Myroutes.homeRoute: (context) => const Homepage(),
        Myroutes.loginRoute: (context) => const Loginpage(),
      },
    );
  }
}
