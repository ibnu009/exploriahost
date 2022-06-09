import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:exploriahost/modules/mission/screen/feedback_mission_complate.dart';
import 'package:exploriahost/ui/component/button/primary_button.dart';
import 'package:exploriahost/ui/component/dialog/dialog_choose_image.dart';
import 'package:exploriahost/ui/component/image/image_full_screen.dart';
import 'package:exploriahost/ui/component/map/map_screen.dart';
import 'package:exploriahost/ui/component/text/exploria_generic_text_input_hint.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class MissionCompleteScreen extends StatefulWidget {
  const MissionCompleteScreen({Key? key}) : super(key: key);

  @override
  _MissionCompleteScreenState createState() => _MissionCompleteScreenState();
}

class _MissionCompleteScreenState extends State<MissionCompleteScreen> {
  List<File> images = [];
  final picker = ImagePicker();

  late GoogleMapController mapController;
  double? _markedLatitude, _markedLongitude;
  List<Marker> myMarker = [];

  void _onMapCreated(GoogleMapController controller) {
    if (_markedLatitude != null && _markedLongitude != null) {
      mapController = controller;
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(_markedLatitude ?? 0.0, _markedLongitude ?? 0.0),
              zoom: 15),
        ),
      );
      Marker initialLocationMarker = Marker(
        draggable: true,
        markerId: const MarkerId("1"),
        position: LatLng(_markedLatitude ?? 0.0, _markedLongitude ?? 0.0),
        icon: BitmapDescriptor.defaultMarker,
      );
      setState(() {
        myMarker.add(initialLocationMarker);
      });
    }
  }

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16,),
                  ExploriaGenericTextInputHint(text: 'Foto Misi (Berupa lokasi, menu yang disediakan, dll) *'),
                  _buildImageGallery(),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                  Row(
                    children:  [
                      const ExploriaGenericTextInputHint(
                        text: 'Foto Misi(Berupa lokasi,menu yang disediakan,dll)*',
                      ),
                      const Spacer(),
                      Visibility(
                        visible: _markedLatitude != null,
                        child: InkWell(
                          onTap: () => _initiateToLocationPicker(),
                          child: const Text(
                            "Ubah Lokasi", style: TextStyle(color: ExploriaTheme.primaryColor, fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16,),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  _markedLatitude == null
                      ? exploriaBorderButton(
                      context: context,
                      text: 'Tambahkan Pin Point',
                      isEnabled: true,
                      onPressed: () => _initiateToLocationPicker())
                      : _buildAddressMap(),
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

  Future<void> _initiateToLocationPicker() async {
    var result = await Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (c) => const MapScreen(),
      ),
    );

    if (result != null || result != "") {
      setState(() {
        _markedLatitude = result['latitude'] as double;
        _markedLongitude = result['longitude'] as double;
      });
    }
  }

  Widget _buildAddressMap() {
    return Container(
      height: 150,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: Set.from(myMarker),
        initialCameraPosition: CameraPosition(
          target: LatLng(_markedLatitude ?? 0.0, _markedLongitude ?? 0.0),
          zoom: 11.0,
        ),
      ),
    );
  }
}