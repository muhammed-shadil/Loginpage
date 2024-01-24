import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreference/content.dart';
import 'package:sharedpreference/login.dart';
import 'package:sharedpreference/main.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  @override
  Widget build(BuildContext context) {
    List lisst = [
      Content(text: "Profile"),
      Content(text: "Transactions"),
      Content(text: "Cards"),
      Content(text: "My banking"),
      Content(text: "ePAssbook"),
      Content(text: "Cardless-cash"),
      Content(text: "Apply Loans"),
      Content(text: "Other Services"),
      Content(text: "Manage Accounts"),
    ];
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(
          child: Text(
            'CANARA Bank',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 35,
            ),
            const Center(
              child: Text(
                "STUDENT ACCOUNT",
                style: TextStyle(fontSize: 25),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              height: 450,
              child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: const BoxDecoration(
                        border: Border(
                            left: BorderSide.none, right: BorderSide.none),
                      ),
                      // height: 0,
                      // width: 400,
                      child: Text(
                        lisst[index].text,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  itemCount: 9),
            ),
            // SizedBox(height: 30,),
            FilledButton( onPressed: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  final islogged = prefs.setBool(NAME_KEY, false);

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Loginpage()));
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.red),
                ),
               
                child: const Text("Logout"))
          ],
        ),
      ),
    );
  }
}
