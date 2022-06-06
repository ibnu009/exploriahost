import 'package:exploriahost/modules/experience/bloc/experience_bloc.dart';
import 'package:exploriahost/modules/experience/bloc/experience_event.dart';
import 'package:exploriahost/modules/experience/bloc/experience_state.dart';
import 'package:exploriahost/modules/experience/widgets/experience_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EtalaseExperienceTab extends StatefulWidget {
  final String status;
  const EtalaseExperienceTab({Key? key, required this.status}) : super(key: key);

  @override
  State<EtalaseExperienceTab> createState() => _EtalaseExperienceTabState();
}

class _EtalaseExperienceTabState extends State<EtalaseExperienceTab> {
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
            child: CircularProgressIndicator(),
          );
        }
        if (state is ShowEtalaseExperience) {
          return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: state.experiences.length,
              itemBuilder: (context, index) {
                return ExperienceItem(experience: state.experiences[index]);
              });
        }
        return Container();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _bloc = ExperienceBloc();
    _bloc.add(GetEtalaseExperience(widget.status));
  }

  @override
  Widget build(BuildContext context) {
    return blocListener(blocBuilder());
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }
}
