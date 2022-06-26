import 'package:exploriahost/core/network/network_service.dart';
import 'package:exploriahost/core/network/response/mission/mission_response.dart';
import 'package:exploriahost/modules/mission/bloc/mission_bloc.dart';
import 'package:exploriahost/modules/mission/bloc/mission_event.dart';
import 'package:exploriahost/modules/mission/bloc/mission_state.dart';
import 'package:exploriahost/modules/mission/screen/mission_submission_screen.dart';
import 'package:exploriahost/ui/component/button/primary_button.dart';
import 'package:exploriahost/ui/component/generic/exploria_loading.dart';
import 'package:exploriahost/ui/component/generic/generic_appbar.dart';
import 'package:exploriahost/ui/component/image/exploria_image_network.dart';
import 'package:exploriahost/ui/component/text/exploria_generic_text_input_hint.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:exploriahost/utils/date_time_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MissionDetailScreen extends StatefulWidget {
  final Mission mission;
  const MissionDetailScreen({Key? key, required this.mission}) : super(key: key);

  @override
  _MissionDetailScreenState createState() => _MissionDetailScreenState();
}

class _MissionDetailScreenState extends State<MissionDetailScreen> {

  late MissionBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = MissionBloc();
    _bloc.add(CheckHostContributionStatus(widget.mission.uuidMission));
  }

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
        if (state is ShowLoadingMission) {
          return const Center(
            child: ExploriaLoading(
              width: 100,
            ),
          );
        }
        if (state is ShowMissionDetail) {
          return _buildDetailMission(state.isAlreadyContributed);
        }
        return const SizedBox();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: genericAppbar(context, "Detail Misi"),
        body: SafeArea(
            child: blocListener(blocBuilder())
        ),
    );
  }

  Widget _buildDetailMission(bool isAlreadyContributed){
    return SingleChildScrollView(
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: exploriaPrimaryButton(
                context: context,
                text: 'Kerjakan Misi',
                isEnabled: isAlreadyContributed,
                onPressed: (){
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (c) => MissionSubmissionScreen(uuidMission: widget.mission.uuidMission, point: widget.mission.point,)));
                }),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Divider(color: Colors.black12, thickness: 1),
    );
  }
}