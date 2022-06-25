import 'package:dotted_border/dotted_border.dart';
import 'package:exploriahost/ui/component/dialog/dialog_choose_image.dart';
import 'package:flutter/material.dart';

class ExploriaImagePlaceHolder extends StatelessWidget {
  final Function() onTapGallery, onTapCamera;
  final double? width, height;
  const ExploriaImagePlaceHolder({Key? key, required this.onTapGallery, required this.onTapCamera, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => chooseImage(
          context: context,
          onTapGallery: onTapGallery,
          onTapCamera: onTapCamera),
      child: Center(
        child: DottedBorder(
          borderType: BorderType.RRect,
          strokeWidth: 1,
          strokeCap: StrokeCap.round,
          color: Colors.black54,
          radius: const Radius.circular(8),
          dashPattern: const [5, 5],
          child: SizedBox(
            height: height ?? 100,
            width: width ?? 100,
            child: const Padding(
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
}
