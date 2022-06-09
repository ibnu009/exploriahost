import 'package:exploriahost/core/network/network_service.dart';
import 'package:exploriahost/modules/profile/screen/edit/edit_profile_start_screen.dart';
import 'package:exploriahost/ui/component/image/exploria_image_network.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildProfileHeader extends StatelessWidget {
  final String image, name, headline;

  const BuildProfileHeader(
      {Key? key,
      required this.image,
      required this.name,
      required this.headline})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ExploriaTheme.primaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(image.isNotEmpty
                    ? '$BASE_URL$image'
                    : defaultImage),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style:
                          ExploriaTheme.subTitle.copyWith(color: Colors.white)),
                  Text(headline.isEmpty ? "Belum ada Headline" : headline,
                      style:
                          const TextStyle(fontSize: 13, color: Colors.white)),
                ],
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (c) => EditProfileStartScreen(
                      headline: headline,
                      name: name,
                      image: image,
                    ),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                child: Icon(Icons.edit, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
