import 'dart:async';
import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'widgets/helpers/spacex_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: const Center(
            child:
                Padding(padding: EdgeInsets.all(20.0), child: SpaceXLogo())));
  }
}
