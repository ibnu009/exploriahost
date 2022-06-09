import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/material.dart';

class ExperiencePendingVerification extends StatefulWidget {
  const ExperiencePendingVerification({Key? key}) : super(key: key);

  @override
  _ExperiencePendingVerificationState createState() => _ExperiencePendingVerificationState();
}

class _ExperiencePendingVerificationState extends State<ExperiencePendingVerification> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white24,
          title: Text(
              "Detail My Experience",
              style: ExploriaTheme.smallTitle
          ),
          leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back,
                color: ExploriaTheme.primaryColor,
              )),
        ),
        body: SafeArea(
            child: SingleChildScrollView(

            )
        ),
      bottomNavigationBar:
      Container(

      ),
    );
  }
}