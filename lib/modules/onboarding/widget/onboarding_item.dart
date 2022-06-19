import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/material.dart';

class OnBoardingItem extends StatelessWidget {
  final String asset, onBoardingText;
  const OnBoardingItem({Key? key, required this.asset, required this.onBoardingText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          asset,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0x00FFFFFF),
                ExploriaTheme.primaryColor
              ],
              stops: [0.3, 1],
              begin: AlignmentDirectional(0, -1),
              end: AlignmentDirectional(0, 1),
            ),
          ),
        ),
        Padding(
          padding:
          const EdgeInsetsDirectional.fromSTEB(32, 32, 32, 96),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                onBoardingText,
                style: ExploriaTheme.title1.copyWith(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
