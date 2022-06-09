import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ExploriaLoading extends StatelessWidget {
  final double? height, width;
  const ExploriaLoading({Key? key, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Lottie.asset('assets/exploria_loading_new.json', height: height, width: width);
  }
}
