import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:exploriahost/core/network/request/verify_profile_request.dart';
import 'package:exploriahost/modules/profile/bloc/profile_bloc.dart';
import 'package:exploriahost/modules/profile/bloc/profile_event.dart';
import 'package:exploriahost/modules/verification/screen/verification_end_screen.dart';
import 'package:exploriahost/ui/component/button/primary_button.dart';
import 'package:exploriahost/ui/component/dialog/dialog_choose_image.dart';
import 'package:exploriahost/ui/component/dialog/dialog_component.dart';
import 'package:exploriahost/ui/component/text/exploria_generic_text_input_hint.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:exploriahost/utils/generic_delegate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class VerificationPhotoScreen extends StatefulWidget {
  final VerifyProfileRequest request;

  const VerificationPhotoScreen({Key? key, required this.request})
      : super(key: key);

  @override
  _VerificationPhotoScreenState createState() =>
      _VerificationPhotoScreenState();
}

class _VerificationPhotoScreenState extends State<VerificationPhotoScreen>
    with GenericDelegate {
  String? path, fileName;
  final picker = ImagePicker();
  File? photo;
  late VerifyProfileRequest newReq;

  late ProfileBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = ProfileBloc();
    newReq = widget.request;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Foto Diri",
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: ExploriaGenericTextInputHint(
                text: "Foto diri kamu",
              ),
            ),
            photo != null
                ? _buildImageResultHolder()
                : _buildImagePlaceHolder(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
              child: Text(
                "Harap memberikan foto yang jelas, tidak buram, tidak gelap, dan menampakkan wajah.",
                style: ExploriaTheme.bodyText,
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            exploriaPrimaryButton(
                context: context,
                text: 'Lanjut',
                isEnabled: true,
                onPressed: () {
                  if (photo == null) {
                    return;
                  }
                  _bloc.add(VerifyHostProfile(newReq, photo!, this));
                }),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageResultHolder() {
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
          radius: const Radius.circular(12),
          dashPattern: const [5, 5],
          child: SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width * .5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(photo!, fit: BoxFit.cover),
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
          radius: const Radius.circular(12),
          dashPattern: const [5, 5],
          child: SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width * .5,
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(
                Icons.camera_alt,
                color: Colors.grey,
                size: 32,
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
        photo = File(pickedFile.path);
        path = photo?.path.split('/').last;
        Navigator.pop(context);
      } else {}
    });
  }

  @override
  void onError(String message) {}

  @override
  void onLoading() {
    showLoadingDialog(context: context);
  }

  @override
  void onSuccess(String message) {
    showSuccessDialog(
        context: context,
        title: "Success",
        message: message,
        onTap: () {
          Navigator.pop(context);
          Navigator.of(context).pushReplacement(CupertinoPageRoute(
              builder: (context) => const VerificationEndScreen()));
        });
  }
}
