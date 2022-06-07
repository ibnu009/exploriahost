import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/material.dart';

class FrequentlyAskQuestion extends StatefulWidget {
  const FrequentlyAskQuestion({Key? key}) : super(key: key);

  @override
  _FrequentlyAskQuestionState createState() => _FrequentlyAskQuestionState();
}

class _FrequentlyAskQuestionState extends State<FrequentlyAskQuestion> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white24,
          title: Text(
              "FaQ",
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
        )
    );
  }
}