import 'package:exploriahost/modules/experience/screens/detail_experience/detail_experience_pending_verification.dart';
import 'package:exploriahost/modules/home/home_screen.dart';
import 'package:exploriahost/modules/splash/splash_screen.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: primaryThemeColor,
      ),
      home: const SplashScreen()
    );
  }
}

