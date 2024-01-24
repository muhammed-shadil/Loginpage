import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreference/homepage.dart';
import 'package:sharedpreference/login.dart';
import 'package:sharedpreference/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    share();
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SizedBox(
        width: 250,
        height: 200,
        child: Image.asset("images/image3.jpeg"),
      )),
    );
  }

  Future<void> share() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final islogged = prefs.getBool(NAME_KEY);

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 2), () {
      if (islogged != null) {
      if (islogged) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Homepage(),
          ),
        );
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const Loginpage()));
      }
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Loginpage()));
    }
    });

    
  }
}
