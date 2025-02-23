import 'dart:async';
import 'dart:ui'; // Required for BackdropFilter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horizonx/screens/login_screen.dart';

import '../constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = "SplashView";

  @override
  State<SplashScreen> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pushAndRemoveUntil(
        CupertinoPageRoute(
          builder: (BuildContext context) {
            return  LoginScreen();
          },
        ),
            (_) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("${imageAsset}background.jpg"),
              ),
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                color: Colors.black.withOpacity(0.1),
              ),
            ),
          ),
          // Foreground: logo
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("${imageAsset}logo.png"),
                  width: 300,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
