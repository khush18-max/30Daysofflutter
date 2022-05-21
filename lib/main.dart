import 'package:flutter/material.dart';
import 'package:hello/core/store.dart';
import 'package:hello/pages/cart_page.dart';
import 'package:hello/utils.dart/routes.dart';
import 'package:hello/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';

void main() {
  runApp(VxState(
    store: MyStore(),

    
    child:const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: Myroutes.homeRoute,
      routes: {
        "/": (context) => const Loginpage(),
        Myroutes.homeRoute: (context) =>  const Homepage(),
        Myroutes.loginRoute: (context) => const Loginpage(),
        Myroutes.cartRoute: (context) => const CartPage(),
      },
    );
  }
}
