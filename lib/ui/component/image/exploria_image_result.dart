import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:exploriahost/ui/component/dialog/dialog_choose_image.dart';
import 'package:exploriahost/ui/component/image/image_full_screen.dart';
import 'package:flutter/material.dart';

class ExploriaImageResult extends StatelessWidget {
  final Function() onTapGallery, onTapCamera;
  final File image;
  final String heroTag;
  final double? width, height;
  const ExploriaImageResult({Key? key, required this.onTapGallery, required this.onTapCamera, required this.image, required this.heroTag, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: InkWell(
        onTap: () {
          chooseImage(
              context: context,
              onTapGallery: onTapGallery,
              onTapCamera: onTapCamera,
              onTapFullScreen: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (c) =>
                      ImageFullScreen(
                        image: image,
                        heroTag: heroTag,
                      ),
                ),
              ));
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
                height: height ?? 100,
                width: width ?? 100,
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
}
