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
  final _formkey = GlobalKey<FormState>();
  movetoHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, Myroutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/hello.jpg",
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username cannot be empty.";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                      ),
                      TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                              hintText: "Enter Password",
                              labelText: "Password"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return " Password cannot be empty.";
                            } else if (value.length < 6) {
                              return " Password length should be atleast 6.";
                            }
                            return null;
                          }),
                      const SizedBox(height: 20.0),
                      Material(
                        color: Colors.deepPurple,
                        borderRadius:
                            BorderRadius.circular(changeButton ? 50 : 8),
                        child: InkWell(
                          onTap: () => movetoHome(context),
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            width: changeButton ? 50 : 150,
                            height: 40,
                            alignment: Alignment.center,
                            child: changeButton
                                ? const Icon(Icons.done, color: Colors.white)
                                : const Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
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
          ),
        ));
  }
}
