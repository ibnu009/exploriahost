import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/material.dart';

AppBar customGenericAppbar(BuildContext context, String title, Function() onTap){
  return AppBar(
    leading: InkWell(
        onTap: onTap,
        child: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        )),
    backgroundColor: ExploriaTheme.primaryColor,
    title: Text(
      title,
      style: const TextStyle(color: Colors.white),
    ),
  );
}