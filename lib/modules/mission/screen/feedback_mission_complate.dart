import 'package:exploriahost/modules/mission/screen/mission_list.dart';
import 'package:exploriahost/ui/component/button/primary_button.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FeedbackMissionComplete extends StatefulWidget {
  final int point;

  const FeedbackMissionComplete({Key? key, required this.point})
      : super(key: key);

  @override
  _FeedbackMissionCompleteState createState() =>
      _FeedbackMissionCompleteState();
}

class _FeedbackMissionCompleteState extends State<FeedbackMissionComplete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text("Selesai",
              style: ExploriaTheme.smallTitle.copyWith(color: Colors.white)),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Misi Berhasil Dilakukan',
              style: ExploriaTheme.title,
            ),
            SvgPicture.asset('assets/ic_mission_complete.svg'),
            const SizedBox(
              height: 39.0,
            ),
            Text(
              'Misi kamu berhasil dilakukan nih. Kamu bisa mendapatkan ${widget.point} Point. Tim kami akan memverivikasi misi kamu. Harap bersabar ya!',
              style: ExploriaTheme.text1,
              textAlign: TextAlign.center,
            ),
          ]),
        ),
        bottomNavigationBar:
        Container(
          padding: const EdgeInsets.all(20.0),
          child: exploriaPrimaryButton(
              context: context,
              text: 'Kembali Ke Daftar Misi',
              isEnabled: true,
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    CupertinoPageRoute(
                      builder: (c) => const MissionListScreen(),
                    ),
                    (Route<dynamic> route) => false);
              }),
        )
    );
  }
}
