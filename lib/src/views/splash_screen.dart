import 'dart:async';

import 'package:app_open/src/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

      ///Run after 3 seconds
      Timer(const Duration(seconds: 1), () {
        Get.off(
          () =>  HomeScreen(),
          transition: Transition.leftToRightWithFade,
        );
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(Icons.person_2),
      ),
    );
  }
}
