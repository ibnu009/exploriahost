import 'package:exploriahost/modules/home/home_screen.dart';
import 'package:exploriahost/ui/component/button/primary_button.dart';
import 'package:exploriahost/ui/component/dropdown/exploria_dropdown_value.dart';
import 'package:exploriahost/ui/component/dropdown/exploria_generic_dropdown.dart';
import 'package:exploriahost/ui/component/input/exploria_generic_text_input.dart';
import 'package:exploriahost/ui/component/text/exploria_generic_text_input_hint.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExperienceAddresscreen extends StatefulWidget {
  const ExperienceAddresscreen({Key? key}) : super(key: key);

  @override
  _ExperienceAddresscreenState createState() => _ExperienceAddresscreenState();
}

class _ExperienceAddresscreenState extends State<ExperienceAddresscreen> {
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _kodePosController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String _selectedItemProvince = initialProvinceItem;
  String _selectedItemCity = initialCityItem;

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
              ExploriaGenericDropdown(
                  selectedItem: _selectedItemProvince,
                  items: provinceItems,
                  onChanged: (String? newVal) {
                    setState(() {
                      _selectedItemProvince = newVal ?? "";
                    });
                  }),
              const ExploriaGenericTextInputHint(
                text: "Kabupaten/Kota*",
              ),
              ExploriaGenericDropdown(
                  selectedItem: _selectedItemCity,
                  items: cityItems,
                  onChanged: (String? newVal) {
                    setState(() {
                      _selectedItemCity = newVal ?? "";
                    });
                  }),
              const ExploriaGenericTextInputHint(
                text: "Kode Pos*",
              ),
              ExploriaGenericTextInput(
                  controller: _kodePosController,
                  inputType: TextInputType.number,
                  maxLines: 1),
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
              const SizedBox(
                height: 24,
              ),
              exploriaPrimaryButton(
                  context: context,
                  text: 'Lanjut',
                  isEnabled: true,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (c) => const HomeScreen(),
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
}
