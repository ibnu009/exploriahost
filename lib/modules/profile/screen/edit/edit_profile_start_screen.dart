import 'package:exploriahost/core/network/network_service.dart';
import 'package:exploriahost/modules/profile/screen/edit/edit_job_profile_screen.dart';
import 'package:exploriahost/modules/profile/screen/edit/edit_name_profile_screen.dart';
import 'package:exploriahost/ui/component/button/primary_button.dart';
import 'package:exploriahost/ui/component/image/exploria_image_network.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

class EditProfileStartScreen extends StatefulWidget {
  final String image, name, headline;

  const EditProfileStartScreen(
      {Key? key,
      required this.image,
      required this.name,
      required this.headline})
      : super(key: key);

  @override
  _EditProfileStartScreenState createState() => _EditProfileStartScreenState();
}

class _EditProfileStartScreenState extends State<EditProfileStartScreen> {
  late String _profileName, _profileImage, _profileHeadline;
  bool _profileChanged = false;

  @override
  void initState() {
    super.initState();
    _profileName = widget.name;
    _profileImage = widget.image;
    _profileHeadline = widget.headline;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white24,
          title: Text("Data Diri", style: ExploriaTheme.smallTitle),
          leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back,
                color: ExploriaTheme.primaryColor,
              )),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.only(top: 20.0, bottom: 22.0),
                child:  CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage(_profileImage.isNotEmpty ? '$BASE_URL$_profileImage' : defaultImage),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nama', style: ExploriaTheme.subTitle),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(_profileName),
                          InkWell(
                            onTap: () async {
                              var result = await Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (c) => const EditNameProfile(),
                                ),
                              );
                              if (result != null || result != "") {
                                setState(() {
                                  _profileName =
                                      result['profile_name'] as String;
                                  _profileChanged = true;
                                });
                              }
                            },
                            child: const Text(
                              "Ubah",
                              style:
                                  TextStyle(color: ExploriaTheme.primaryColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 15, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Headline', style: ExploriaTheme.subTitle),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _profileHeadline.isEmpty
                              ? "Belum ada Headline"
                              : _profileHeadline,
                        ),
                        InkWell(
                          onTap: () async {
                            var result = await Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (c) => const EditJobProfile(),
                              ),
                            );
                            if (result != null || result != "") {
                              setState(() {
                                _profileHeadline =
                                    result['profile_headline'] as String;
                                _profileChanged = true;
                              });
                            }
                          },
                          child: const Text(
                            "Ubah",
                            style: TextStyle(color: ExploriaTheme.primaryColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _profileChanged ? _showButton() : const SizedBox()
                ],
              ),
            )
          ],
        ));
  }

  Widget _showButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: ShowUpAnimation(
        delayStart: const Duration(milliseconds: 500),
        animationDuration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
        direction: Direction.vertical,
        offset: 0.5,
        child: exploriaPrimaryButton(
            context: context, text: 'Simpan', isEnabled: true, onPressed: () {}),
      ),
    );
  }
}