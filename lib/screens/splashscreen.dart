import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicalapp/screens/homescreen.dart';

import '../auth/login.dart';
import '../const/custom_text.dart';
import '../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.lightBlue.shade800,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/svg/health-cross-firstaid.svg",
              color: Colors.white,
              height: width * 0.2,
            ),
            SizedBox(height: width * 0.03),
            CustomText(
              title: "Your Doctor",
              color: Colors.white,
              fontSize: width * 0.07,
            ),
          ],
        ),
      ),
    );
  }
}