import 'package:exploriahost/modules/profile/screen/profile_screen.dart';
import 'package:exploriahost/ui/component/button/primary_button.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReportSuccessscreen extends StatefulWidget {
  const ReportSuccessscreen({Key? key}) : super(key: key);

  @override
  _ReportSuccessscreenState createState() => _ReportSuccessscreenState();
}

class _ReportSuccessscreenState extends State<ReportSuccessscreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Laporan Diterima",
            style: ExploriaTheme.smallTitle.copyWith(color: Colors.white)
          ),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/ic_report_success.svg'),
                SizedBox(height: 39.0,),
                Text(
                  'Kami akan mereview laporan kamu dan kami akan mencari solusi terbaik untuk kamu',
                  style: ExploriaTheme.text1, textAlign: TextAlign.center,),
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
