import 'package:exploriahost/ui/component/button/primary_button.dart';
import 'package:exploriahost/ui/component/input/exploria_generic_text_input.dart';
import 'package:exploriahost/ui/component/text/exploria_generic_text_input_hint.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/material.dart';

class EditNameProfile extends StatefulWidget {
  const EditNameProfile({Key? key}) : super(key: key);

  @override
  _EditNameProfileState createState() => _EditNameProfileState();
}

class _EditNameProfileState extends State<EditNameProfile> {
  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white24,
          title: Text( 'Data Nama',
              style: ExploriaTheme.smallTitle
          ),
          leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back,
                color: ExploriaTheme.primaryColor,
              )
          ),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(18, 20, 18, 15),
                  child: Text('Harap menggunakan nama asli untuk memudahkan menjual Experience kamu.', style: ExploriaTheme.text1,)
              ),
              ExploriaGenericTextInputHint(text: 'Nama'),
              ExploriaGenericTextInput(controller: _nameController, inputType: TextInputType.name),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 9, vertical: 20.0),
                child: exploriaPrimaryButton(
                  context: context,
                  text: 'Simpan',
                  isEnabled: true,
                  onPressed: () {},
                ),
              )
            ]
        )
    );
  }
}