import 'dart:async';

import 'package:flutter/material.dart';
import 'package:management_keuangan/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyHomePage()),
      ); // after 5 second menuju ke home page
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 113, 113),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/ppkdju.png", width: 120, height: 120),
            SizedBox(height: 20),

            const Text(
              "Management Keuangan Rizal",
              style: TextStyle(
                color: Color.fromARGB(255, 2, 248, 15),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 25),
            const CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }
}
