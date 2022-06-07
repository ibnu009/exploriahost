import 'package:exploriahost/modules/profile/screen/verification_OTP_screen.dart';
import 'package:exploriahost/ui/component/button/primary_button.dart';
import 'package:exploriahost/ui/component/text/exploria_generic_text_input_hint.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditPhoneProfile extends StatefulWidget {
  const EditPhoneProfile({Key? key}) : super(key: key);

  @override
  _EditPhoneProfileState createState() => _EditPhoneProfileState();
}

class _EditPhoneProfileState extends State<EditPhoneProfile> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text(
              "Ubah Nomor Telepon",
              style: TextStyle(color: Colors.white, fontSize: 14)
          ),
          leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )
          ),
        ),
        body: Form(
          key: _formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.0,),
                ExploriaGenericTextInputHint(text: 'Nomor Telepon Saat Ini'),
                Container(
                    padding: EdgeInsets.fromLTRB(18, 5, 0, 10),
                    child: Text('085730762925', style: TextStyle(fontSize: 16),)
                ),
                ExploriaGenericTextInputHint(text: 'Nomor Telepon Baru'),
                Container(
                  height: 55.0,
                  padding: const EdgeInsets.fromLTRB(18, 5, 18, 5),
                  child: TextField(
                    showCursor: true,
                    controller: _phoneController,
                    keyboardType: TextInputType.name,
                    cursorColor: Colors.black45,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black45,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintStyle: const TextStyle(fontSize: 16, color: Colors.grey)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 9, vertical: 20.0),
                  child: exploriaPrimaryButton(
                    context: context,
                    text: 'Konfirmasi',
                    isEnabled: true,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (c) => const VerificationOTPscreen(),
                          ),
                        );
                      }
                    },
                  ),
                )
              ]
          ),
        )
    );
  }
}