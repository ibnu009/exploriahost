import 'package:exploriahost/modules/verification/screen/verification_address_screen.dart';
import 'package:exploriahost/ui/component/button/primary_button.dart';
import 'package:exploriahost/ui/component/input/exploria_generic_text_input.dart';
import 'package:exploriahost/ui/component/text/exploria_generic_text_input_hint.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerificationSecondScreen extends StatefulWidget {
  const VerificationSecondScreen({Key? key}) : super(key: key);

  @override
  _VerificationSecondScreenState createState() =>
      _VerificationSecondScreenState();
}

class _VerificationSecondScreenState extends State<VerificationSecondScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _headlineController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Verifikasi Data Diri",
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
                child: Text(
                  "Harap mengisi data diri dengan benar untuk memudahkan tim kami memverifikasi data kamu.",
                  style: ExploriaTheme.bodyText,
                ),
              ),
              const ExploriaGenericTextInputHint(text: "Nama Lengkap*"),
              ExploriaGenericTextInput(
                  controller: _nameController,
                  inputType: TextInputType.text,
                  maxLines: 1),
              const ExploriaGenericTextInputHint(text: "Headline*"),
              ExploriaGenericTextInput(
                  controller: _headlineController,
                  inputType: TextInputType.text,
                  maxLines: 1,
                  hintText: "Deksripsi singkat tentang dirimu"),
              const ExploriaGenericTextInputHint(text: "Nomor Telfon Aktif*"),
              ExploriaGenericTextInput(
                  controller: _phoneController,
                  inputType: TextInputType.number,
                  maxLines: 1),
              const ExploriaGenericTextInputHint(text: "Deskripsi*"),
              ExploriaGenericTextInput(
                  controller: _descriptionController,
                  inputType: TextInputType.text,
                  maxLines: 5,
                  hintText: "Deksripsikan dirimu"),
              const SizedBox(
                height: 24,
              ),
              exploriaPrimaryButton(
                  context: context,
                  text: 'Lanjut',
                  isEnabled: true,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (c) => VerificationAddresscreen(
                            fullName: _nameController.text,
                            description: _descriptionController.text,
                            headline: _headlineController.text,
                            phoneNumber: _phoneController.text,
                          ),
                        ),
                      );
                    }
                  }),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
