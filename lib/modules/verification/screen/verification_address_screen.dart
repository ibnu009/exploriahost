import 'package:exploriahost/modules/verification/screen/verification_photo_screen.dart';
import 'package:exploriahost/modules/verification/widget/verification_text_input.dart';
import 'package:exploriahost/modules/verification/widget/verification_text_input_hint.dart';
import 'package:exploriahost/ui/component/button/primary_button.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerificationAddresscreen extends StatefulWidget {
  const VerificationAddresscreen({Key? key}) : super(key: key);

  @override
  _VerificationAddresscreenState createState() =>
      _VerificationAddresscreenState();
}

class _VerificationAddresscreenState extends State<VerificationAddresscreen> {
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _provinceController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _kodePosController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Verifikasi Alamat",
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
              const VerificationTextInputHint(
                text: "Provinsi*",
              ),
              VerificationTextInput(
                  controller: _provinceController,
                  inputType: TextInputType.text,
                  maxLines: 1),
              const VerificationTextInputHint(
                text: "Kabupaten/Kota*",
              ),
              VerificationTextInput(
                  controller: _cityController,
                  inputType: TextInputType.text,
                  maxLines: 1),
              const VerificationTextInputHint(
                text: "Kode Pos*",
              ),
              VerificationTextInput(
                  controller: _kodePosController,
                  inputType: TextInputType.number,
                  maxLines: 1),
              const VerificationTextInputHint(
                text: "Alamat*",
              ),
              VerificationTextInput(
                controller: _addressController,
                inputType: TextInputType.text,
                maxLines: 5,
                hintText:
                    "Jl. Danau Toba 5 no.95, Tegalgede, Kec. Sumbersari, Kab. Jember",
              ),
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
                          builder: (c) => const VerificationPhotoScreen(),
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
