import 'package:exploriahost/core/network/response/experience/experience_detail_response.dart';
import 'package:exploriahost/modules/experience/bloc/experience_bloc.dart';
import 'package:exploriahost/modules/experience/bloc/experience_event.dart';
import 'package:exploriahost/modules/experience/bloc/experience_state.dart';
import 'package:exploriahost/ui/component/button/primary_button.dart';
import 'package:exploriahost/ui/component/generic/exploria_loading.dart';
import 'package:exploriahost/ui/component/image/exploria_image_row_network.dart';
import 'package:exploriahost/ui/component/text/exploria_edit_field_text.dart';
import 'package:exploriahost/ui/component/text/exploria_generic_text_input_hint.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:exploriahost/utils/int_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailExperienceScreen extends StatefulWidget {
  final String uuidExperience;

  const DetailExperienceScreen({Key? key, required this.uuidExperience})
      : super(key: key);

  @override
  State<DetailExperienceScreen> createState() => _DetailExperienceScreenState();
}

class _DetailExperienceScreenState extends State<DetailExperienceScreen> {
  late ExperienceBloc _bloc;

  Widget blocListener(Widget child) {
    return BlocListener(
      bloc: _bloc,
      listener: (ctx, state) => print("$state"),
      child: child,
    );
  }

  Widget blocBuilder() {
    return BlocBuilder(
      bloc: _bloc,
      builder: (ctx, state) {
        if (state is ShowLoading) {
          return const Center(
            child: ExploriaLoading(
              width: 100,
            ),
          );
        }
        if (state is ShowDetailExperience) {
          return _buildDetailExperienceBody(state.experience);
        }
        return Container();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _bloc = ExperienceBloc();
    _bloc.add(GetDetailExperience(widget.uuidExperience));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: ExploriaTheme.primaryColor,
        title: const Text(
          "Detail Experience",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: blocListener(
          blocBuilder(),
        ),
      ),
    );
  }

  Widget _buildDetailExperienceBody(DetailExperience detailExperience) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: ExploriaGenericTextInputHint(text: "Gallery Experience"),
          ),
          _buildGallery(detailExperience.images),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: ExploriaGenericTextInputHint(text: "Judul Experience"),
          ),
          ExploriaEditFieldTextStatis(text: detailExperience.name),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: ExploriaGenericTextInputHint(text: "Harga Experience"),
          ),
          ExploriaEditFieldTextStatis(
              text: detailExperience.price.toRupiah() + "/orang"),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child:
                ExploriaGenericTextInputHint(text: "Durasi Experience (Jam)"),
          ),
          ExploriaEditFieldTextStatis(text: "${detailExperience.duration} Jam"),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: ExploriaGenericTextInputHint(text: "Experience Lainnya"),
          ),
          InkWell(
              onTap: () {},
              child: _buildDetailExperienceFieldButton(
                  "Terdapat ${_getOtherExperience(detailExperience.otherExperiences).length} Experiences")),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: ExploriaGenericTextInputHint(text: "Fasilitas"),
          ),
          InkWell(
              onTap: () {},
              child: _buildDetailExperienceFieldButton(
                  "Terdapat ${_getFacilities(detailExperience.facilities).length} Fasilitas Tambahan")),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: ExploriaGenericTextInputHint(text: "Review Experience"),
          ),
          InkWell(
              onTap: () {},
              child:
                  _buildDetailExperienceFieldButton("Lihat Review Experience")),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: exploriaPrimaryButton(
                context: context,
                text: "Hapus",
                color: Colors.red,
                isEnabled: true,
                onPressed: () {}),
          )
        ],
      ),
    );
  }

  Widget _buildDetailExperienceFieldButton(String title) {
    return Container(
      height: 50,
      alignment: Alignment.centerLeft,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black38)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ExploriaGenericTextInputHint(text: title),
          const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.arrow_forward_ios_outlined),
          ),
        ],
      ),
    );
  }

  List<String> _getFacilities(String facilities) {
    List<String> listFacilities = facilities.split(",");
    return listFacilities;
  }

  List<String> _getOtherExperience(String otherExperiences) {
    List<String> experiences = [];
    experiences = otherExperiences.split(",");

    return experiences;
  }

  Widget _buildGallery(List<String> images) {
    List<Widget> resultWidget = [];
    resultWidget.add(const SizedBox(
      width: 18,
    ));
    if (images.isNotEmpty) {
      for (int i = 0; i < images.length; i++) {
        resultWidget.add(ExploriaImageRowNetwork(
          imageUrl: images[i],
        ));
      }
    }

    if (images.isEmpty) {
      return const Text("No Image");
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: resultWidget,
      ),
    );
  }
}
