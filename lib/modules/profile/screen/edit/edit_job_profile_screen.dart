import 'package:exploriahost/ui/component/button/primary_button.dart';
import 'package:exploriahost/ui/component/input/exploria_generic_text_input.dart';
import 'package:exploriahost/ui/component/text/exploria_generic_text_input_hint.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/material.dart';

class EditJobProfile extends StatefulWidget {
  const EditJobProfile({Key? key}) : super(key: key);

  @override
  _EditJobProfileState createState() => _EditJobProfileState();
}

class _EditJobProfileState extends State<EditJobProfile> {
  final TextEditingController _headlineController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text("Ubah Headline",
              style: TextStyle(color: Colors.white, fontSize: 14)),
          leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )
          ),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(18, 20, 18, 15),
              child: Text(
                'Isikan dengan data yang paling menggambarkan dirimu.',
                style: ExploriaTheme.text1,
              )),
          const ExploriaGenericTextInputHint(text: 'Headline'),
          ExploriaGenericTextInput(
            controller: _headlineController,
            inputType: TextInputType.name,
            maxLength: 200,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 20.0),
            child: exploriaPrimaryButton(
              context: context,
              text: 'Simpan',
              isEnabled: true,
              onPressed: () => Navigator.of(context)
                  .pop({'profile_headline': _headlineController.text}),
            ),
          )
        ]
        )
    );
  }
}