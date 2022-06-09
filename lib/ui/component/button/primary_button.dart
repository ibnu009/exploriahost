import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget exploriaPrimaryButton({
  required BuildContext context,
  required String text,
  required bool isEnabled,
  required Function() onPressed,
}) {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: isEnabled ? ExploriaTheme.primaryColor : Colors.grey,
    minimumSize: const Size(double.infinity, 50),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  );

  return Container(
    height: 55,
    margin: const EdgeInsets.symmetric(horizontal: 16),
    child: ElevatedButton(
      style: raisedButtonStyle,
      child: Text(
        text,
        style: ExploriaTheme.smallTitle.copyWith(color: Colors.white, fontSize: 15)
      ),
      onPressed: isEnabled ? onPressed : (){},
    ),
  );
}

Widget exploriaBorderButton({
  required BuildContext context,
  required String text,
  required bool isEnabled,
  required Function() onPressed,
  Color? buttonColor,
}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadiusDirectional.circular(8),
        border: Border.all(color: buttonColor ?? ExploriaTheme.primaryColor)
      ),
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 15, color: buttonColor ?? ExploriaTheme.primaryColor),
        ),
      ),
    ),
  );
}

Widget exploriaPrimaryButtonResizeable({
  required BuildContext context,
  required String text,
  required bool isEnabled,
  required Function() onPressed,
  required double minimumWidth,
  required double minimumHeight,
}) {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: isEnabled ? ExploriaTheme.primaryColor : Colors.grey,
    minimumSize: Size(minimumWidth, minimumHeight),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  );

  return Container(
    height: minimumHeight,
    padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
    child: ElevatedButton(
      style: raisedButtonStyle,
      child: Text(
        text,
        style: const TextStyle(fontSize: 15),
      ),
      onPressed: isEnabled ? onPressed : (){},
    ),
  );
}