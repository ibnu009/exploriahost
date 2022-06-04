import 'package:exploriahost/modules/experience/screens/add/experience_address_screen.dart';
import 'package:exploriahost/modules/experience/widgets/other_experience_item.dart';
import 'package:exploriahost/ui/component/button/primary_button.dart';
import 'package:exploriahost/ui/component/input/exploria_generic_text_input.dart';
import 'package:exploriahost/ui/component/text/exploria_generic_text_input_hint.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OtherExperienceScreen extends StatefulWidget {
  const OtherExperienceScreen({Key? key}) : super(key: key);

  @override
  _OtherExperienceScreenState createState() => _OtherExperienceScreenState();
}

class _OtherExperienceScreenState extends State<OtherExperienceScreen> {
  final TextEditingController _otherExperienceController =
      TextEditingController();
  final TextEditingController _facilitiesController = TextEditingController();
  final snackBar = const SnackBar(
    content: Text('Telah mencapai jumlah maksimal'),
  );

  final List<String> _otherExperiences = [];
  final List<String> _facilities = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Experience Lainnya",
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
                  text: "Experience Lainnya*",
                ),
              ),
              _buildOtherExperienceList(),
              ExploriaGenericTextInput(
                controller: _otherExperienceController,
                inputType: TextInputType.text,
                maxLines: 1,
                hintText: 'Bersepeda di kebun teh',
                onSubmitted: (value) => _addOtherExperience(),
              ),
              const SizedBox(
                height: 8,
              ),
              exploriaBorderButton(
                  context: context,
                  text: 'Tambahkan Experience Lain',
                  isEnabled: true,
                  onPressed: () => _addOtherExperience()),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Divider(
                  thickness: 1,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 12.0),
                child: ExploriaGenericTextInputHint(
                  text: "Fasilitas*",
                ),
              ),
              _buildFacilitiesList(),
              ExploriaGenericTextInput(
                controller: _facilitiesController,
                inputType: TextInputType.text,
                maxLines: 1,
                hintText: 'Sepeda sudah disediakan',
                onSubmitted: (value) => _addFacilities(),
              ),
              const SizedBox(
                height: 8,
              ),
              exploriaBorderButton(
                  context: context,
                  text: 'Tambahkan Fasilitas',
                  isEnabled: true,
                  onPressed: () => _addFacilities()),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Divider(
                  thickness: 1,
                ),
              ),
              exploriaPrimaryButton(
                  context: context,
                  text: 'Lanjut',
                  isEnabled: true,
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (c) => const ExperienceAddresscreen(),
                      ),
                    );
                  }),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOtherExperienceList() {
    List<Widget> otherExperienceWidgets = [];
    if (_otherExperiences.isNotEmpty) {
      for (int i = 0; i < _otherExperiences.length; i++) {
        String otherExperience = _otherExperiences[i];
        otherExperienceWidgets.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: OtherExperienceItem(
                sequence: (i + 1),
                text: otherExperience,
                onTapDelete: () {
                  setState(() {
                    _otherExperiences.removeAt(i);
                  });
                }),
          ),
        );
      }
    }
    return Column(
        mainAxisSize: MainAxisSize.min, children: otherExperienceWidgets);
  }

  Widget _buildFacilitiesList() {
    List<Widget> otherFacilityWidgets = [];
    if (_facilities.isNotEmpty) {
      for (int i = 0; i < _facilities.length; i++) {
        String facility = _facilities[i];
        otherFacilityWidgets.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: OtherExperienceItem(
                sequence: (i + 1),
                text: facility,
                onTapDelete: () {
                  setState(() {
                    _facilities.removeAt(i);
                  });
                }),
          ),
        );
      }
    }
    return Column(
        mainAxisSize: MainAxisSize.min, children: otherFacilityWidgets);
  }

  void _addFacilities() {
    if (_facilitiesController.text.isEmpty) {
      return;
    }
    if (_facilities.length > 10) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    setState(() {
      _facilities.add(_facilitiesController.text);
      _facilitiesController.clear();
    });
  }

  void _addOtherExperience() {
    if (_otherExperienceController.text.isEmpty) {
      return;
    }
    if (_otherExperiences.length >= 10) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    setState(() {
      _otherExperiences.add(_otherExperienceController.text);
      _otherExperienceController.clear();
    });
  }
}
