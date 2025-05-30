import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicalapp/screens/homescreen.dart';
import 'package:medicalapp/screens/splashscreen.dart';

import 'auth/login.dart';
late double height;
late double width;

var userName;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return GestureDetector(
      //onTap: FocusManager.instance.primaryFocus!.unfocus,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home:  HomeScreen(),
      ),
    );
  }
}

