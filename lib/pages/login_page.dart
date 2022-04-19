import 'package:flutter/material.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: Text(
          "Login Page", 
        style : TextStyle(
        color: Colors.blueAccent,
        fontWeight:FontWeight.bold, 
         ),
      ),
    ),
    );
  }


}
