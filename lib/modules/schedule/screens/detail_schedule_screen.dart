import 'package:exploriahost/core/network/response/schedule/schedule_detail_response.dart';
import 'package:exploriahost/modules/schedule/bloc/schedule_bloc.dart';
import 'package:exploriahost/modules/schedule/bloc/schedule_event.dart';
import 'package:exploriahost/modules/schedule/bloc/schedule_state.dart';
import 'package:exploriahost/modules/schedule/widgets/build_schedule_card.dart';
import 'package:exploriahost/modules/schedule/widgets/build_user_card.dart';
import 'package:exploriahost/ui/component/button/primary_button.dart';
import 'package:exploriahost/ui/component/dialog/dialog_component.dart';
import 'package:exploriahost/ui/component/generic/exploria_loading.dart';
import 'package:exploriahost/ui/component/text/exploria_generic_text_input_hint.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:exploriahost/utils/date_time_ext.dart';
import 'package:exploriahost/utils/generic_delegate.dart';
import 'package:exploriahost/utils/int_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailScheduleScreen extends StatefulWidget {
  final String uuidSchedule;

  const DetailScheduleScreen({Key? key, required this.uuidSchedule})
      : super(key: key);

  @override
  _DetailScheduleScreenState createState() => _DetailScheduleScreenState();
}

class _DetailScheduleScreenState extends State<DetailScheduleScreen>
    with GenericDelegate {
  late ScheduleBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = ScheduleBloc();
    _bloc.add(GetScheduleDetail(widget.uuidSchedule));
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
        if (state is ShowLoading) {
          return const Center(
            child: ExploriaLoading(width: 100,),
          );
        }
        if (state is ShowScheduleDetail) {
          return SingleChildScrollView(child: _detailScheduleContent(state.schedule));
        }
        return Container();
      },
    );
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
            "Detail Jadwal",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: blocListener(blocBuilder()));
  }

  Widget _detailScheduleContent(ScheduleDetail scheduleDetail) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        BuildScheduleCard(
          price: scheduleDetail.price.toRupiah(),
          durasi: 'Durasi ${scheduleDetail.duration} Jam',
          name: scheduleDetail.name,
          image: scheduleDetail.experienceImage ?? "",
        ),
        const Padding(
          padding: EdgeInsets.all(16),
          child: Divider(thickness: 1, color: Colors.black38),
        ),
        BuildUserCard(
            image: scheduleDetail.imageUser ?? "",
            name: scheduleDetail.nameUser,
            uuidUser: scheduleDetail.uuidUser),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 32),
          child: Text(
            'Info Umum',
            style: ExploriaTheme.title
                .copyWith(color: Colors.black87, fontSize: 18),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const ExploriaGenericTextInputHint(text: 'Durasi experience'),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            'Durasi ${scheduleDetail.duration} Jam',
            style: ExploriaTheme.bodyText,
          ),
        ),
        const ExploriaGenericTextInputHint(text: 'Tanggal Experience'),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            '${scheduleDetail.startDate.convertToExploriaDateAndHour()} - ${scheduleDetail.endDate.convertToExploriaDateAndHour()}',
            style: ExploriaTheme.bodyText,
          ),
        ),
        const ExploriaGenericTextInputHint(text: 'Jumlah Peserta'),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            '${scheduleDetail.touristAmount} Orang',
            style: ExploriaTheme.bodyText,
          ),
        ),
        const ExploriaGenericTextInputHint(text: 'Total Harga '),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            (scheduleDetail.price * scheduleDetail.touristAmount).toRupiah(),
            style: ExploriaTheme.bodyText
                .copyWith(color: ExploriaTheme.primaryColor),
          ),
        ),
        const ExploriaGenericTextInputHint(text: 'Total Harga '),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            _statusExperience(scheduleDetail.verificationStatus),
            style: ExploriaTheme.bodyText.copyWith(
                color:
                    _statusExperienceColor(scheduleDetail.verificationStatus)),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(16),
          child: Divider(thickness: 1, color: Colors.black38),
        ),
        Visibility(
          visible: scheduleDetail.verificationStatus == 2,
          maintainSize: false,
          child: exploriaPrimaryButton(
              context: context,
              text: 'Verifikasi',
              isEnabled: true,
              onPressed: () {
                _bloc.add(SetVerificationStatus(
                    scheduleDetail.uuidHostSchedule, "accepted", this));
              }),
        ),
        const SizedBox(
          height: 16,
        ),
        Visibility(
          visible: scheduleDetail.verificationStatus == 2,
          maintainSize: false,
          child: exploriaBorderButton(
              context: context,
              text: 'Tolak',
              isEnabled: true,
              onPressed: () {
                _bloc.add(SetVerificationStatus(
                    scheduleDetail.uuidHostSchedule, "reject", this));
              },
              buttonColor: Colors.red),
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }

  Color _statusExperienceColor(int statusAccepted) {
    switch (statusAccepted) {
      case 0:
        return Colors.red;
      case 1:
        return ExploriaTheme.primaryColor;
      case 2:
        return Colors.orange;
      default:
        return Colors.orange;
    }
  }

  String _statusExperience(int statusAccepted) {
    switch (statusAccepted) {
      case 0:
        return 'Rejected';
      case 1:
        return 'Accepted';
      case 2:
        return 'Pending Verification';
      default:
        return 'Pending Verification';
    }
  }

  @override
  void onError(String message) {
    showFailedDialog(
        context: context,
        title: "Failed",
        message: message,
        onTap: () {
          Navigator.pop(context);
          Navigator.pop(context);
        });
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
          Navigator.pop(context);
          Navigator.pop(context);
        });
  }
}
