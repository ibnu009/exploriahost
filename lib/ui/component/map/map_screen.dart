import 'package:exploriahost/ui/component/button/primary_button.dart';
import 'package:exploriahost/ui/component/text/exploria_generic_text_input_hint.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  LatLng _initialCameraPosition =
      const LatLng(-7.9138540900667325, 113.81960282831976);
  loc.Location location = loc.Location();
  bool _isMapLoading = true;
  String markedAddress = "";

  List<Marker> myMarker = [];
  double? markedLatitude, markedLongitude;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(_initialCameraPosition.latitude,
                _initialCameraPosition.longitude),
            zoom: 15),
      ),
    );

    Marker initialLocationMarker = Marker(
      draggable: true,
      markerId: const MarkerId("1"),
      position: _initialCameraPosition,
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: const InfoWindow(
        title: 'Pilih Lokasi',
      ),
    );

    setState(() {
      myMarker.add(initialLocationMarker);
      _getPlace(_initialCameraPosition);
    });
  }

  @override
  void initState() {
    super.initState();
    if (mounted) {
      _getUserCurrentLocation();
    }
  }

  void _getUserCurrentLocation() async {
    bool _serviceEnabled;
    loc.PermissionStatus _permissionGranted;
    _serviceEnabled = await location.serviceEnabled();

    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == loc.PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != loc.PermissionStatus.granted) {
        return;
      }
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    setState(() {
      _initialCameraPosition = LatLng(position.latitude, position.longitude);
      markedLatitude = position.latitude;
      markedLongitude = position.longitude;
      _isMapLoading = false;
      print('testplace ${placemark[0].administrativeArea}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Picker'),
        backgroundColor: ExploriaTheme.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          _isMapLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : GoogleMap(
                  onMapCreated: _onMapCreated,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  mapType: MapType.normal,
                  markers: Set.from(myMarker),
                  onTap: _handleGoogleMapTap,
                  initialCameraPosition: CameraPosition(
                    target: _initialCameraPosition,
                    zoom: 11.0,
                  ),
                ),
          Align(alignment: Alignment.bottomCenter, child: _buildBottomDialog()),
        ],
      ),
    );
  }

  Widget _buildBottomDialog() {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.30,
      maxChildSize: 0.30,
      minChildSize: 0.0,
      builder: (context, scrollController) => StatefulBuilder(
          builder: (BuildContext context, StateSetter stateSetter) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ExploriaGenericTextInputHint(
                      text: markedAddress,
                    )),
                const Divider(
                  thickness: 1,
                  color: Colors.black12,
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: exploriaPrimaryButton(
                    context: context,
                    text: 'Simpan',
                    isEnabled: true,
                    onPressed: () => _saveAddress(),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  void _saveAddress(){
    Navigator.of(context).pop({'latitude': markedLatitude, 'longitude': markedLongitude});
  }

  void _getPlace(LatLng tapPoint) async {
    List<Placemark> newPlace =
        await placemarkFromCoordinates(tapPoint.latitude, tapPoint.longitude);

    Placemark placeMark = newPlace[0];
    String name = placeMark.street ?? "";
    String subLocality = placeMark.subLocality ?? "";
    String locality = placeMark.locality ?? "";
    String administrativeArea = placeMark.administrativeArea ?? "";
    String postalCode = placeMark.postalCode ?? "";
    String country = placeMark.country ?? "";
    String address =
        "$name, $subLocality, $locality, $administrativeArea $postalCode, $country";

    print(address);
    markedAddress = address;
  }

  void _handleGoogleMapTap(LatLng tapPoint) {
    if (mounted) {
      setState(() {
        myMarker = [];
        myMarker.add(
          Marker(markerId: MarkerId(tapPoint.toString()), position: tapPoint),
        );
        markedLatitude = tapPoint.latitude;
        markedLongitude = tapPoint.longitude;
        _getPlace(tapPoint);
      });
    }
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }
}
