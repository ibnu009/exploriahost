import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/material.dart';

AppBar genericAppbar(BuildContext context, String title){
  return AppBar(
    leading: InkWell(
        onTap: () => Navigator.pop(context),
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