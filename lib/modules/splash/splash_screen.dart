import 'dart:async';

import 'package:exploriahost/core/repository/user_repository.dart';
import 'package:exploriahost/modules/auth/login/screen/LoginScreen.dart';
import 'package:exploriahost/modules/home/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late UserRepository _repository;
  String userToken = "";

  startSplashScreen() async {
    var duration = const Duration(seconds: 2);
    return Timer(
      duration,
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) {
              if (userToken.isEmpty) {
                return const LoginScreen();
              }
              return const HomeScreen();
            },
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _repository = UserRepository.instance;
    _getUserToken();
    startSplashScreen();
  }

  Future<void> _getUserToken() async {
    userToken = await _repository.readSecureData('token') ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/logoexploria.png',
          height: 80,
        ),
      ),
    );
  }
}
