import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black12,
        child: Column(
          children: [
            const SizedBox(
              height: 300,
              child: CircleAvatar(
                foregroundImage: AssetImage("images/login-form-design-01.jpg"),
                radius: 80,
              ),
              // width: double.infinity,
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                ),
                width: MediaQuery.of(context).size.width * .9,
                height: 300,
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
                      decoration: InputDecoration(
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
                      decoration: InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
