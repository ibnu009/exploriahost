import 'package:exploriahost/core/network/network_service.dart';
import 'package:exploriahost/core/network/response/mission/mission_response.dart';
import 'package:exploriahost/modules/mission/screen/mission_submission_screen.dart';
import 'package:exploriahost/ui/component/button/primary_button.dart';
import 'package:exploriahost/ui/component/generic/generic_appbar.dart';
import 'package:exploriahost/ui/component/image/exploria_image_network.dart';
import 'package:exploriahost/ui/component/text/exploria_generic_text_input_hint.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:exploriahost/utils/date_time_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MissionDetailScreen extends StatefulWidget {
  final Mission mission;
  const MissionDetailScreen({Key? key, required this.mission}) : super(key: key);

  @override
  _MissionDetailScreenState createState() => _MissionDetailScreenState();
}

class _MissionDetailScreenState extends State<MissionDetailScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: genericAppbar(context, "Detail Misi"),
        body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ExploriaImageNetwork(imageUrl: "$BASE_URL${widget.mission.imageUrl}", height: 220, width: double.infinity,),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 8, left: 16, top: 8),
                      child: Text(widget.mission.name, style: ExploriaTheme.title1, maxLines: 3, overflow: TextOverflow.ellipsis)),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 8, left: 16),
                      child: Text(
                          "Deadline : ${widget.mission.deadline.convertToExploriaDateAndHour()}",
                          style: ExploriaTheme.smallTitleRed.copyWith(fontWeight: FontWeight.w300))
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 8, left: 16),
                      child: Text("${widget.mission.point} pts ", style: ExploriaTheme.priceTextStyle)),
                  _buildDivider(),
                  const ExploriaGenericTextInputHint(text: 'Deskripsi Misi'),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 8, left: 16),
                      child: Text(widget.mission.description)),
                  const ExploriaGenericTextInputHint(text: 'Alamat Lokasi'),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 8, left: 16),
                      child: Text(widget.mission.address)),
                  const ExploriaGenericTextInputHint(text: 'Maksimal Contributor'),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 8, left: 16),
                      child: Text("${widget.mission.maxContributor}")),
                  const ExploriaGenericTextInputHint(text: 'Current Contributor'),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 8, left: 16),
                      child: Text("${widget.mission.currentContributor}")),
                ],
              ),
            )
        ),
        bottomNavigationBar:
        Container(
          padding: const EdgeInsets.all(20.0),
          child: exploriaPrimaryButton(
              context: context,
              text: 'Kerjakan Misi',
              isEnabled: true,
              onPressed: (){
                Navigator.push(context,
                    CupertinoPageRoute(builder: (c) => const MissionSubmissionScreen()));
              }),
        )
    );
  }

  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Divider(color: Colors.black12, thickness: 1),
    );
  }
}