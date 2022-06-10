import 'package:exploriahost/ui/component/text/exploria_generic_text_input_hint.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/material.dart';

class DetaiLExperienceOtherScreen extends StatelessWidget {
  final String appBarText;
  final List<String> data;

  const DetaiLExperienceOtherScreen(
      {Key? key, required this.appBarText, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: ExploriaTheme.primaryColor,
        title: Text(
          appBarText,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top : 48.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (context, index) =>
              _buildOtherExperience(index + 1, data[index]),
        ),
      ),
    );
  }

  Widget _buildOtherExperience(int sequence, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadiusDirectional.circular(8),
            border: Border.all(color: ExploriaTheme.primaryColor)),
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: Center(
          child: Row(
            children: [
              Text(
                '$sequence',
                style: const TextStyle(fontSize: 12, color: Colors.black38),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                text,
                style: const TextStyle(fontSize: 15, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
