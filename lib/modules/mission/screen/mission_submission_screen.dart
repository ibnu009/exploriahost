import 'dart:io';

import 'package:exploriahost/core/network/request/submit_submission_request.dart';
import 'package:exploriahost/modules/mission/bloc/mission_bloc.dart';
import 'package:exploriahost/modules/mission/bloc/mission_event.dart';
import 'package:exploriahost/modules/mission/screen/feedback_mission_complate.dart';
import 'package:exploriahost/ui/component/button/primary_button.dart';
import 'package:exploriahost/ui/component/dialog/dialog_component.dart';
import 'package:exploriahost/ui/component/generic/generic_appbar.dart';
import 'package:exploriahost/ui/component/image/exploria_image_place_holder.dart';
import 'package:exploriahost/ui/component/image/exploria_image_result.dart';
import 'package:exploriahost/ui/component/input/exploria_generic_text_input.dart';
import 'package:exploriahost/ui/component/map/map_screen.dart';
import 'package:exploriahost/ui/component/text/exploria_generic_text_input_hint.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:exploriahost/utils/generic_delegate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class MissionSubmissionScreen extends StatefulWidget {
  final String uuidMission;
  final int point;
  const MissionSubmissionScreen({Key? key, required this.uuidMission, required this.point})
      : super(key: key);

  @override
  _MissionSubmissionScreenState createState() =>
      _MissionSubmissionScreenState();
}

class _MissionSubmissionScreenState extends State<MissionSubmissionScreen>
    with GenericDelegate {
  File? image;
  File? imageSelfie;
  late MissionBloc _bloc;

  final TextEditingController _merchantNameController = TextEditingController();
  final TextEditingController _merchantDescriptionController =
      TextEditingController();

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
  void initState() {
    super.initState();
    _bloc = MissionBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: genericAppbar(context, "Form Submission"),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            const ExploriaGenericTextInputHint(text: 'Nama Toko*'),
            ExploriaGenericTextInput(
              controller: _merchantNameController,
              inputType: TextInputType.text,
              maxLines: 1,
            ),
            const ExploriaGenericTextInputHint(text: 'Alamat Toko*'),
            ExploriaGenericTextInput(
              controller: _merchantDescriptionController,
              inputType: TextInputType.multiline,
              maxLines: 1,
            ),
            const SizedBox(
              height: 16,
            ),
            const ExploriaGenericTextInputHint(text: 'Foto Toko*'),
            const SizedBox(
              height: 12,
            ),
            _buildMissionImage(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Divider(
                thickness: 1,
              ),
            ),
            const ExploriaGenericTextInputHint(
                text: 'Foto Bukti (Selfie dengan obyek misi)*'),
            const SizedBox(
              height: 12,
            ),
            _buildSelfieImage(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Divider(
                thickness: 1,
              ),
            ),
            Row(
              children: [
                const ExploriaGenericTextInputHint(
                  text: 'Lokasi*',
                ),
                const Spacer(),
                Visibility(
                  visible: _markedLatitude != null,
                  child: InkWell(
                    onTap: () => _initiateToLocationPicker(true),
                    child: const Text(
                      "Ubah Lokasi",
                      style: TextStyle(
                          color: ExploriaTheme.primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            _markedLatitude == null
                ? exploriaBorderButton(
                    context: context,
                    text: 'Tambahkan Pin Point',
                    isEnabled: true,
                    onPressed: () => _initiateToLocationPicker(false))
                : _buildAddressMap(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: exploriaPrimaryButton(
                  context: context,
                  text: 'Selesaikan Misi',
                  isEnabled: true,
                  onPressed: () {
                    if (imageSelfie == null ||
                        image == null ||
                        _markedLongitude == null ||
                        _markedLatitude == null) {
                      return;
                    }

                    SubmitSubmissionRequest request = SubmitSubmissionRequest(
                        name: _merchantNameController.text,
                        description: _merchantDescriptionController.text,
                        address: _merchantDescriptionController.text,
                        uuidMission: widget.uuidMission,
                        latitude: _markedLatitude ?? 0.0,
                        longitude: _markedLongitude ?? 0.0);

                    _bloc.add(SubmitMissionSubmission(
                        request, this, imageSelfie!, image!));
                  }),
            )
          ],
        ),
      )),
    );
  }

  Widget _buildMissionImage() {
    return image != null
        ? _buildImageResultHolder(image!, "mission_hero", false)
        : _buildImagePlaceHolder(false);
  }

  Widget _buildSelfieImage() {
    return imageSelfie != null
        ? _buildImageResultHolder(imageSelfie!, "mission_hero", true)
        : _buildImagePlaceHolder(true);
  }

  Widget _buildImageResultHolder(File image, String heroTag, bool isSelfie) {
    return ExploriaImageResult(
        height: 200,
        width: 200,
        onTapGallery: () =>
            openCameraOrGallery(isCamera: false, isSelfie: isSelfie),
        onTapCamera: () =>
            openCameraOrGallery(isCamera: true, isSelfie: isSelfie),
        image: image,
        heroTag: heroTag);
  }

  Widget _buildImagePlaceHolder(bool isSelfie) {
    return ExploriaImagePlaceHolder(
        height: 200,
        width: 200,
        onTapGallery: () =>
            openCameraOrGallery(isCamera: false, isSelfie: isSelfie),
        onTapCamera: () =>
            openCameraOrGallery(isCamera: true, isSelfie: isSelfie));
  }

  Future openCameraOrGallery(
      {required bool isCamera, required bool isSelfie}) async {
    final pickedFile = await picker.pickImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        if (isSelfie) {
          imageSelfie = File(pickedFile.path);
        } else {
          image = File(pickedFile.path);
        }
        Navigator.pop(context);
      } else {}
    });
  }

  Future<void> _initiateToLocationPicker(bool isEditLocation) async {
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
        if (isEditLocation) {
          Marker initialLocationMarker = Marker(
            draggable: true,
            markerId: const MarkerId("1"),
            position: LatLng(_markedLatitude ?? 0.0, _markedLongitude ?? 0.0),
            icon: BitmapDescriptor.defaultMarker,
          );
          myMarker.add(initialLocationMarker);
          mapController.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                  target:
                      LatLng(_markedLatitude ?? 0.0, _markedLongitude ?? 0.0),
                  zoom: 15),
            ),
          );
        }
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

  @override
  void onError(String message) {
    showFailedDialog(
        context: context,
        title: "Gagal",
        message: message,
        onTap: () {
          Navigator.pop(context);
          Navigator.pop(context);
        });  }

  @override
  void onLoading() {
    showLoadingDialog(context: context);
  }

  @override
  void onSuccess(String message) {
    showSuccessDialog(
        context: context,
        title: "Berhasil",
        message: message,
        onTap: () {
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pushReplacement(
            context,
            CupertinoPageRoute(
              builder: (c) => FeedbackMissionComplete(point: widget.point,),
            ),
          );
        });
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }
}