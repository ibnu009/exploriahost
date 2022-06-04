import 'package:exploriahost/modules/profile/screen/verification_OTP_screen.dart';
import 'package:exploriahost/ui/component/button/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditPasswordProfile extends StatefulWidget {
  const EditPasswordProfile({Key? key}) : super(key: key);

  @override
  _EditPasswordProfileState createState() => _EditPasswordProfileState();
}

class _EditPasswordProfileState extends State<EditPasswordProfile> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text(
              "Ubah Password",
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
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.0,),
              _buildTextInputHint('Password Baru'),
              Container(
                height: 55.0,
                padding: const EdgeInsets.fromLTRB(18, 5, 18, 5),
                child: TextField(
                  showCursor: true,
                  controller: _newPasswordController,
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
              _buildTextInputHint('Ulangi Password Baru'),
              Container(
                height: 55.0,
                padding: const EdgeInsets.fromLTRB(18, 5, 18, 5),
                child: TextField(
                  showCursor: true,
                  controller: _confirmPasswordController,
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
                    Navigator.push(context, 
                        CupertinoPageRoute(builder: (c) => const VerificationOTPscreen()));
                  },
                ),
              )
            ]
        )
    );
  }

  Widget _buildTextInputHint(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 8, 15, 4),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}