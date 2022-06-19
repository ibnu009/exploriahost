import 'package:exploriahost/core/network/request/verify_profile_request.dart';
import 'package:exploriahost/modules/area/screen/city_picker_screen.dart';
import 'package:exploriahost/modules/area/screen/province_picker_screen.dart';
import 'package:exploriahost/modules/verification/screen/verification_photo_screen.dart';
import 'package:exploriahost/ui/component/button/field_button.dart';
import 'package:exploriahost/ui/component/button/primary_button.dart';
import 'package:exploriahost/ui/component/input/exploria_generic_text_input.dart';
import 'package:exploriahost/ui/component/text/exploria_generic_text_input_hint.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerificationAddresscreen extends StatefulWidget {
  final String fullName, headline, phoneNumber, description;

  const VerificationAddresscreen(
      {Key? key,
      required this.fullName,
      required this.headline,
      required this.phoneNumber,
      required this.description})
      : super(key: key);

  @override
  _VerificationAddresscreenState createState() =>
      _VerificationAddresscreenState();
}

class _VerificationAddresscreenState extends State<VerificationAddresscreen> {
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _kodePosController = TextEditingController();

  String _selectedItemProvince = "Belum Memilih";
  int _selectedProvinceId = -1;
  int _selectedCityId = -1;
  String _selectedItemCity = "Belum Memilih";

  late String name, headline, phone, desc;

  @override
  void initState() {
    super.initState();
    name = widget.fullName;
    headline = widget.headline;
    phone = widget.phoneNumber;
    desc = widget.description;
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              const ExploriaGenericTextInputHint(
                text: "Kode Pos*",
              ),
              ExploriaGenericTextInput(
                  controller: _kodePosController,
                  inputType: TextInputType.number,
                  maxLines: 1),
              const ExploriaGenericTextInputHint(
                text: "Detail Alamat*",
              ),
              ExploriaGenericTextInput(
                controller: _addressController,
                inputType: TextInputType.text,
                maxLines: 5,
                hintText:
                "Jl. Danau Toba 5 no.95, Tegalgede, Kec. Sumbersari, Kab. Jember",
              ),
              const SizedBox(
                height: 24,
              ),
              exploriaPrimaryButton(
                  context: context,
                  text: 'Lanjut',
                  isEnabled: true,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      VerifyProfileRequest request = VerifyProfileRequest(
                        address:
                            '$_selectedItemProvince, $_selectedItemCity, ${_addressController.text}, ${_kodePosController.text}',
                        phone: phone,
                        description: desc,
                        fullName: name,
                        headline: headline,
                      );

                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (c) => VerificationPhotoScreen(
                            request: request,
                          ),
                        ),
                      );
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
}
