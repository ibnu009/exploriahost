import 'package:exploriahost/modules/profile/screen/edit/edit_profile_start_screen.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildProfileHeader extends StatelessWidget {
  const BuildProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ExploriaTheme.primaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    "https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_640/v1578620671/wwa6sd5wyp1wxjrder5i.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Ibnu Batutah", style: ExploriaTheme.subTitle.copyWith(color: Colors.white)),
                  Text("Belum ada Headline", style: TextStyle(fontSize: 13, color: Colors.white)),
                ],
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: (){
                Navigator.push(context, CupertinoPageRoute(builder: (c) => const EditProfileStartScreen()));
              },
              child: const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                child: Icon(Icons.edit,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
