import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:exploriahost/core/network/request/create_experience_request.dart';
import 'package:exploriahost/modules/experience/screens/add/other_experience_screen.dart';
import 'package:exploriahost/ui/component/button/primary_button.dart';
import 'package:exploriahost/ui/component/dialog/dialog_choose_image.dart';
import 'package:exploriahost/ui/component/dropdown/exploria_dropdown_value.dart';
import 'package:exploriahost/ui/component/dropdown/exploria_generic_dropdown.dart';
import 'package:exploriahost/ui/component/image/image_full_screen.dart';
import 'package:exploriahost/ui/component/input/exploria_generic_text_input.dart';
import 'package:exploriahost/ui/component/text/exploria_generic_text_input_hint.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddExperienceScreen extends StatefulWidget {
  const AddExperienceScreen({Key? key}) : super(key: key);

  @override
  _AddExperienceScreenState createState() => _AddExperienceScreenState();
}

class _AddExperienceScreenState extends State<AddExperienceScreen> {
  final TextEditingController _experienceNameController =
      TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _hourController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String _selectedItem = initialCategoryExperienceItem;

  List<File> images = [];
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Tambah Experience",
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: ExploriaGenericTextInputHint(
                  text: "Gambar Experience*",
                ),
              ),
              _buildImageGallery(),
              const Padding(
                padding: EdgeInsets.only(top: 18.0, bottom: 6),
                child: ExploriaGenericTextInputHint(
                  text: "Judul Experience*",
                ),
              ),
              ExploriaGenericTextInput(
                  controller: _experienceNameController,
                  inputType: TextInputType.text,
                  maxLines: 1),
              const Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 6),
                child: ExploriaGenericTextInputHint(
                  text: "Kategori*",
                ),
              ),
              ExploriaGenericDropdown(
                  selectedItem: _selectedItem,
                  items: categoryExperienceItems,
                  onChanged: (String? newVal) {
                    setState(() {
                      _selectedItem = newVal ?? "";
                    });
                  }),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 6.0),
                child: ExploriaGenericTextInputHint(
                  text: "Harga Perorangan*",
                ),
              ),
              ExploriaGenericTextInput(
                controller: _priceController,
                inputType: TextInputType.number,
                maxLines: 1,
                hintText: 'Rp 100.000',
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 6.0),
                child: ExploriaGenericTextInputHint(
                  text: "Durasi Experience (Jam)*",
                ),
              ),
              ExploriaGenericTextInput(
                controller: _hourController,
                inputType: TextInputType.number,
                maxLines: 1,
                hintText: '24 Jam',
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 6.0),
                child: ExploriaGenericTextInputHint(
                  text: "Deskripsi Experience*",
                ),
              ),
              ExploriaGenericTextInput(
                controller: _descriptionController,
                inputType: TextInputType.text,
                maxLines: 8, hintText: 'Kami menyediakan...',),

              const SizedBox(height: 32,),
              exploriaPrimaryButton(
                  context: context,
                  text: 'Lanjut',
                  isEnabled: true,
                  onPressed: () => _passDataToNextScreen()),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
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
        resultWidget.add(_buildImageResultHolder(img, heroTag, i));
      }
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: resultWidget,
      ),
    );
  }

  Widget _buildImageResultHolder(File image, String heroTag, int position) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (c) => ImageFullScreen(
                    image: image,
                    heroTag: heroTag,
                  ),
                ),
              );
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
          Positioned(
            top: 10,
            right: 10,
            child: InkWell(
              onTap: () => _showDialogConfimationDelete(position),
              child: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          )
        ],
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

  void _passDataToNextScreen() {
    CreateExperienceRequest data = CreateExperienceRequest(
        name: _experienceNameController.text,
        description: _descriptionController.text,
        files: images,
        price: int.parse(_priceController.text),
        duration: int.parse(_hourController.text),
        category: _selectedItem);

    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (c) => OtherExperienceScreen(createExperienceRequest: data),
      ),
    );
  }

  Future<void> _showDialogConfimationDelete(int position) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text('Hapus Foto'),
          content: const Text('Apakah kamu yakin untuk menghapus foto ini?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  images.removeAt(position);
                });
              },
              child: const Text('Iya'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Tidak',
                style: TextStyle(
                  color: Colors.blueAccent,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
