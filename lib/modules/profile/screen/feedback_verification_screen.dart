import 'package:exploriahost/modules/profile/screen/profile_screen.dart';
import 'package:exploriahost/ui/component/button/primary_button.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FeedbackVerificationscreen extends StatefulWidget {
  const FeedbackVerificationscreen({Key? key}) : super(key: key);

  @override
  _FeedbackVerificationscreenState createState() =>
      _FeedbackVerificationscreenState();
}

class _FeedbackVerificationscreenState extends State<FeedbackVerificationscreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Selesai",
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/ic_verification_success.svg'),
              SizedBox(height: 39.0,),
              Text(
                'Verifikasi Berhasil',
                style: ExploriaTheme.title,),
              Text(
                'Nomor telepon kamu telah diubah',
                style: ExploriaTheme.text1,),
            ]
        ),
      ),
        bottomNavigationBar:
        Container(
          padding: EdgeInsets.all(20.0),
          child: exploriaPrimaryButton(
              context: context,
              text: 'Kembali Ke Profile',
              isEnabled: true,
              onPressed: (){
                Navigator.push(context,
                    CupertinoPageRoute(builder: (c) => const ProfileScreen()));
              }),
        )
    );
  }
}
