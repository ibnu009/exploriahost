import 'package:exploriahost/core/network/request/create_experience_request.dart';
import 'package:exploriahost/modules/area/screen/city_picker_screen.dart';
import 'package:exploriahost/modules/area/screen/province_picker_screen.dart';
import 'package:exploriahost/modules/experience/bloc/experience_bloc.dart';
import 'package:exploriahost/modules/experience/bloc/experience_event.dart';
import 'package:exploriahost/modules/experience/screens/add/success_add_experience_screen.dart';
import 'package:exploriahost/ui/component/button/field_button.dart';
import 'package:exploriahost/ui/component/button/primary_button.dart';
import 'package:exploriahost/ui/component/dialog/dialog_component.dart';
import 'package:exploriahost/ui/component/dropdown/exploria_dropdown_value.dart';
import 'package:exploriahost/ui/component/dropdown/exploria_generic_dropdown.dart';
import 'package:exploriahost/ui/component/input/exploria_generic_text_input.dart';
import 'package:exploriahost/ui/component/map/map_screen.dart';
import 'package:exploriahost/ui/component/text/exploria_generic_text_input_hint.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:exploriahost/utils/generic_delegate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ExperienceAddresscreen extends StatefulWidget {
  final CreateExperienceRequest createExperienceRequest;

  const ExperienceAddresscreen(
      {Key? key, required this.createExperienceRequest})
      : super(key: key);

  @override
  _ExperienceAddresscreenState createState() => _ExperienceAddresscreenState();
}

class _ExperienceAddresscreenState extends State<ExperienceAddresscreen>
    implements GenericDelegate {
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _kodePosController = TextEditingController();
  late GoogleMapController mapController;
  late ExperienceBloc _bloc;

  final _formKey = GlobalKey<FormState>();
  String _selectedItemProvince = "Belum Memilih";
  int _selectedProvinceId = -1;
  int _selectedCityId = -1;
  String _selectedItemCity = "Belum Memilih";
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
    _bloc = ExperienceBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Verifikasi Alamat",
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
                child: Text(
                  "Harap mengisi data diri dengan benar untuk memudahkan tim kami memverifikasi data kamu.",
                  style: ExploriaTheme.bodyText,
                ),
              ),
              const ExploriaGenericTextInputHint(
                text: "Provinsi*",
              ),
              InkWell(
                  onTap: () => _initiateProvincePicker(),
                  child: ExploriaFieldButton(title: _selectedItemProvince)),
              const SizedBox(
                height: 16,
              ),
              const ExploriaGenericTextInputHint(
                text: "Kabupaten/Kota*",
              ),
              InkWell(
                  onTap: () {
                    if (_selectedProvinceId < 0) {
                      return;
                    }
                    _initiateCityPicker(_selectedProvinceId);
                  },
                  child: ExploriaFieldButton(title: _selectedItemCity)),
              const SizedBox(
                height: 16,
              ),
              const ExploriaGenericTextInputHint(
                text: "Alamat Lengkap*",
              ),
              ExploriaGenericTextInput(
                controller: _addressController,
                inputType: TextInputType.text,
                maxLines: 5,
                hintText:
                "Jl. Danau Toba 5 no.95, Tegalgede, Kec. Sumbersari, Kab. Jember",
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Divider(
                  thickness: 1,
                ),
              ),
              Row(
                children:  [
                  const ExploriaGenericTextInputHint(
                    text: "Pin Point Lokasi*",
                  ),
                  const Spacer(),
                  Visibility(
                    visible: _markedLatitude != null,
                    child: InkWell(
                      onTap: () => _initiateToLocationPicker(true),
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
                  onPressed: () => _initiateToLocationPicker(false))
                  : _buildAddressMap(),
              const SizedBox(
                height: 24,
              ),
              exploriaPrimaryButton(
                  context: context,
                  text: 'Kirim',
                  isEnabled: true,
                  onPressed: ()  {
                    if (_formKey.currentState!.validate()) {
                      _createExperience();
                    }
                  }),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
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

  void _createExperience() {

    if (_selectedProvinceId < 0){
      showOkDialog(context, "Peringatan", "Kamu belum memilih provinsi");
      return;
    }

    if (_selectedCityId < 0){
      showOkDialog(context, "Peringatan", "Kamu belum memilih kabupaten");
      return;
    }

    CreateExperienceRequest data = widget.createExperienceRequest;
    CreateExperienceRequest newData = CreateExperienceRequest(
        name: data.name,
        description: data.description,
        files: data.files,
        price: data.price,
        duration: data.duration,
        category: data.category,
        facilities: data.facilities,
        otherExperience: data.otherExperience,
        address: _addressController.text,
        provinceId: _selectedProvinceId,
        cityId: _selectedCityId,
        latitude: _markedLatitude,
        longitude: _markedLongitude);

    _bloc.add(CreateExperience(request: newData, delegate: this));
  }

  Future<void> _initiateProvincePicker() async {
    var result = await Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (c) => const ProvincePickerScreen(),
      ),
    );

    if (result != null || result != "") {
      setState(() {
        _selectedProvinceId = result['provinceId'] as int;
        _selectedItemProvince = result['name'] as String;
      });
    }
  }

  Future<void> _initiateCityPicker(int provinceId) async {
    var result = await Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (c) => CityPickerScreen(provinceId: provinceId),
      ),
    );

    if (result != null || result != "") {
      setState(() {
        _selectedCityId = result['cityId'] as int;
        _selectedItemCity = result['name'] as String;
      });
    }
  }

  @override
  void onError(String message) {
    // TODO: implement onError
  }

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
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const SuccessAddExperienceScreen()));
        });
  }
}
