import 'package:flutter/material.dart';
import 'package:hello/utils.dart/routes.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String name = "";
  bool changeButton = false;
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
              Text(
                "Welcome $name",
                style: const TextStyle(
                  fontSize: 18,
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
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: "Enter Password", labelText: "Password"),
                    ),
                    const SizedBox(height: 20.0),
                    InkWell(
                      onTap: () async {
                        setState(() {
                        changeButton = true;
                        });

                      await Future.delayed(const Duration(seconds: 1));
                      Navigator.pushNamed(context, Myroutes.homeRoute);
                      },
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        width: changeButton ? 50: 150,
                        height: 40,
                        alignment: Alignment.center,
                        child: changeButton ?const Icon(
                          Icons.done,
                          color: Colors.white)
                         :const Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        
                        decoration: BoxDecoration(
                            color: Colors.deepPurpleAccent,
                            // shape: changeButton ? BoxShape.circle:BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(changeButton?50:8)
                            ),
                        ),
                    ),
                      

                    // ElevatedButton(
                    //     child: const Text("Login"),
                    //     style: TextButton.styleFrom(
                    //         minimumSize: const Size(150, 40)),
                    //     onPressed: () {
                    //       Navigator.pushNamed(context, Myroutes.homeRoute);
                    //     })
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
