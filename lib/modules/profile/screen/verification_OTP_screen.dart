import 'package:exploriahost/modules/profile/screen/feedback_verification_screen.dart';
import 'package:exploriahost/modules/profile/widget/build_otp_input.dart';
import 'package:exploriahost/ui/component/button/primary_button.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerificationOTPscreen extends StatefulWidget {
  const VerificationOTPscreen({Key? key}) : super(key: key);

  @override
  _VerificationOTPscreenState createState() =>
      _VerificationOTPscreenState();
}

class _VerificationOTPscreenState extends State<VerificationOTPscreen> {
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  final TextEditingController _fieldFive = TextEditingController();
  final TextEditingController _fieldSix = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Ubah Nomor Telepon",
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          child: Column(
              children: [
                SizedBox(height: 20.0,),
                Text(
                  'Masukkan Kode OTP',
                  style: ExploriaTheme.title1,),
                Text(
                    'Kami mengirim kode OTP ke email ibnubatutah@gmail.com Harap buka inbox email kamu',
                textAlign: TextAlign.center,
                style: ExploriaTheme.text1,),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OtpInput(_fieldOne, true),
                      OtpInput(_fieldTwo, false),
                      OtpInput(_fieldThree, false),
                      OtpInput(_fieldFour, false),
                      OtpInput(_fieldFive, false),
                      OtpInput(_fieldSix, false),
                    ],
                  ),
                ),
                exploriaPrimaryButton(
                    context: context,
                    text: 'Verifikasi',
                    isEnabled: true,
                    onPressed: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (c)=>const FeedbackVerificationscreen()));
                    })
              ]
          ),
        ),
    );
  }
}
