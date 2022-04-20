import 'package:flutter/material.dart';
import 'package:hello/utils.dart/routes.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/login_image.png",
                fit: BoxFit.cover,
                height: 300,
              ),
              const SizedBox(height: 20.0),
              const Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Enter UserName", labelText: "UserName"),
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: "Enter Password", labelText: "Password"),
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                        child: const Text("Login"),
                        style: TextButton.styleFrom(
                            minimumSize: const Size(150, 40)),
                        onPressed: () {
                          Navigator.pushNamed(context, Myroutes.homeRoute);
                        })
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
