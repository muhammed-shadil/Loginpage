import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreference/homepage.dart';
import 'package:sharedpreference/main.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

final _formKey = GlobalKey<FormState>();

class _LoginpageState extends State<Loginpage> {
  var namecontroller = TextEditingController();
  var passcomtroller = TextEditingController();
  final name = RegExp(r'^[A-Za-z]+$');
  bool _password = true;
  final paswd =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(221, 216, 216, 216),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 300,
              child: CircleAvatar(
                foregroundImage: AssetImage("images/login-form-design-01.jpg"),
                radius: 80,
              ),
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                ),
                width: MediaQuery.of(context).size.width * .9,
                // height: 300,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontFamily: "Anton",
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: namecontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "please enter name";
                          } else if (value.length < 3) {
                            return "enter a valid name";
                          } else if (!name.hasMatch(value)) {
                            return "enter a valid name";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          errorMaxLines: 10,
                          errorStyle:
                              const TextStyle(overflow: TextOverflow.clip),
                          hintText: "Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: passcomtroller,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _password,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "please enter a password";
                          } else if (!paswd.hasMatch(value)) {
                            return 'Password should contain at least one upper case, one lower case, one digit, one special character and must be 8 characters in length';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(_password
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(
                                () {
                                  _password = !_password;
                                },
                              );
                            },
                          ),
                          errorMaxLines: 10,
                          errorStyle:
                              const TextStyle(overflow: TextOverflow.clip),
                          hintText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton.icon(
                          autofocus: true,
                          onPressed: () {
                            check();
                          },
                          icon: const Icon(Icons.login),
                          label: const Text("login"))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> check() async {
    if (_formKey.currentState!.validate()) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool(NAME_KEY, true);
      
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Homepage(),
        ),
      );
    }
  }
}
