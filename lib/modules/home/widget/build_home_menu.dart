import 'package:exploriahost/modules/experience/screens/etalase_experience_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuildHomeMenu extends StatelessWidget {
  const BuildHomeMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildButtonMenu(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (c) => const EtalaseExperienceScreen(),
                  ),
                );
              },
              text: 'Etalase Experience',
              assetPath: 'assets/ic_experience.svg',
              context: context),
          _buildButtonMenu(
              onTap: () {},
              text: 'Local Missions',
              assetPath: 'assets/ic_mission.svg',
              context: context)
        ],
      ),
    );
  }

  Widget _buildButtonMenu(
      {required Function() onTap,
      required String text,
      required String assetPath,
      required BuildContext context}) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.45,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 22.0, horizontal: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(assetPath),
                const SizedBox(
                  width: 8,
                ),
                Flexible(
                    child: Text(
                  text,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
