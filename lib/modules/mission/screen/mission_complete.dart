import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:exploriahost/modules/mission/screen/feedback_mission_complate.dart';
import 'package:exploriahost/ui/component/button/primary_button.dart';
import 'package:exploriahost/ui/component/dialog/dialog_choose_image.dart';
import 'package:exploriahost/ui/component/image/image_full_screen.dart';
import 'package:exploriahost/ui/component/text/exploria_generic_text_input_hint.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MissionCompleteScreen extends StatefulWidget {
  const MissionCompleteScreen({Key? key}) : super(key: key);

  @override
  _MissionCompleteScreenState createState() => _MissionCompleteScreenState();
}

class _MissionCompleteScreenState extends State<MissionCompleteScreen> {
  List<File> images = [];
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white24,
          title: Text(
              "Konfirmasi Misi Selesai",
              style: ExploriaTheme.smallTitle
          ),
          leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back,
                color: ExploriaTheme.primaryColor,
              )),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ExploriaGenericTextInputHint(text: 'Foto Misi (Berupa lokasi, menu yang disediakan, dll) *'),
                  _buildImageGallery(),
                  ExploriaGenericTextInputHint(text: 'Foto Misi (Berupa lokasi, menu yang disediakan, dll) *'),
                  exploriaBorderButton(
                      context: context,
                      text: 'Tambahkan Pin Point',
                      isEnabled: true,
                      onPressed: (){}
                  )
                ],
              ),
            )
        ),
        bottomNavigationBar:
        Container(
          padding: EdgeInsets.all(20.0),
          child: exploriaPrimaryButton(
              context: context,
              text: 'Selesaikan Misi',
              isEnabled: true,
              onPressed: (){
                Navigator.push(context,
                    CupertinoPageRoute(builder: (c) => const FeedbackMissionComplate()));
              }),
        )
    );
  }
  Widget _buildImageGallery() {
    List<Widget> resultWidget = [];
    resultWidget.add(const SizedBox(
      width: 18,
    ));
    resultWidget.add(_buildImagePlaceHolder());
    if (images.isNotEmpty) {
      for (int i = 0; i < images.length; i++) {
        File img = images[i];
        String heroTag = "heroTag $i";
        resultWidget.add(_buildImageResultHolder(img, heroTag));
      }
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: resultWidget,
      ),
    );
  }

  Widget _buildImageResultHolder(File image, String heroTag) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (c) => ImageFullScreen(
                    image: image,
                    heroTag: heroTag,
                  )));
        },
        child: Hero(
          tag: heroTag,
          child: Center(
            child: DottedBorder(
              borderType: BorderType.RRect,
              strokeWidth: 1,
              strokeCap: StrokeCap.round,
              color: Colors.black54,
              radius: const Radius.circular(12),
              dashPattern: const [5, 5],
              child: SizedBox(
                height: 100,
                width: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(image, fit: BoxFit.cover),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImagePlaceHolder() {
    return InkWell(
      onTap: () => chooseImage(
          context: context,
          onTapGallery: () => openCameraOrGallery(isCamera: false),
          onTapCamera: () => openCameraOrGallery(isCamera: true)),
      child: Center(
        child: DottedBorder(
          borderType: BorderType.RRect,
          strokeWidth: 1,
          strokeCap: StrokeCap.round,
          color: Colors.black54,
          radius: const Radius.circular(8),
          dashPattern: const [5, 5],
          child: const SizedBox(
            height: 100,
            width: 100,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Icon(
                Icons.camera_alt,
                color: Colors.grey,
                size: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future openCameraOrGallery({required bool isCamera}) async {
    final pickedFile = await picker.pickImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        images.add(File(pickedFile.path));
        Navigator.pop(context);
      } else {}
    });
  }
}