import 'package:anmolapp/utiles/routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constants.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changebutton = false;
  bool isObscure = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  MoveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changebutton = true;  
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changebutton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //Gets the size of the screen
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: context.canvasColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/login_image.png",
              fit: BoxFit.cover,
              width: size.width,
              height: size.height * 0.5,
            ),
            // Text(
            //   "Welcome $name",
            //   style: const TextStyle(
            //     fontSize: 30,
            //     fontWeight: FontWeight.bold,
            //     fontStyle: FontStyle.italic,
            //   ),
            // ),
            text(
              text: "Welcome $name",
              bold: FontWeight.bold,
              color: Colors.white,
              size: 23,
            ),
            const SizedBox(
              height: 20.0,
            ),
            /*
              Padding is this 
            */
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Enter username",
                        labelText: "Username",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "username cant  be emt";
                        }
                        return null;
                      },
                      onChanged: ((value) {
                        name = value;
                        setState(() {});
                      }),
                    ),
                    TextFormField(
                      obscureText: isObscure,
                      decoration: InputDecoration(
                        suffix: IconButton(
                          color: context.theme.bottomAppBarTheme.color,
                          icon: const Icon(Icons.remove_red_eye,
                              ),
                          onPressed: () {
                            isObscure = !isObscure;
                            setState(() {});
                          },
                        ),
                        hintText: "Enter Password",
                        labelText: "Password",
                      ),
                      validator: (value) {
                        if (value == null) {
                          print("null");
                        } else if (value.isEmpty) {
                          return "password can not be empty";
                        } else if (value.length < 6) {
                          return "password contains atleastt 6 char";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),

                    Material(
                      color: context.theme.bottomAppBarTheme.color,
                      borderRadius:
                          BorderRadius.circular(changebutton ? 50 : 15),
                      child: InkWell(
                        onTap: () => MoveToHome(context),
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          width: changebutton ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,
                          child: changebutton
                              ? const Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : const Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                        ),
                      ),
                    )

                    // ElevatedButton(
                    //   style: TextButton.styleFrom(
                    //       minimumSize: Size(80, 40),
                    //       foregroundColor: Colors.white,
                    //       backgroundColor: Colors.deepPurple),
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //   },
                    //   child: Text("SIGN IN"),
                    // )
                  ],
                ),
              ),
            ),
            Row(
              children: const [
                Expanded(
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                // Text("OR"),
                Expanded(
                  child: Divider(
                    thickness: 2,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
