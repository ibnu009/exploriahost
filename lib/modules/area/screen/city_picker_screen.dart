import 'package:exploriahost/core/network/response/area/city_response.dart';
import 'package:exploriahost/modules/area/bloc/area_bloc.dart';
import 'package:exploriahost/modules/area/bloc/area_event.dart';
import 'package:exploriahost/modules/area/bloc/area_state.dart';
import 'package:exploriahost/ui/component/generic/exploria_loading.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CityPickerScreen extends StatefulWidget {
  final int provinceId;

  const CityPickerScreen({Key? key, required this.provinceId})
      : super(key: key);

  @override
  _CityPickerScreenState createState() => _CityPickerScreenState();
}

class _CityPickerScreenState extends State<CityPickerScreen> {
  late AreaBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = AreaBloc();
    _bloc.add(GetCities(widget.provinceId, ""));
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
        if (state is ShowLoadingArea) {
          return const Center(
            child: ExploriaLoading(
              width: 100,
            ),
          );
        }
        if (state is ShowCities) {
          return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: state.cities.length,
              itemBuilder: (context, index) {
                City city = state.cities[index];
                return InkWell(
                    onTap: () => Navigator.of(context)
                        .pop({'cityId': city.id, 'name': city.name}),
                    child: ListTile(title: Text(state.cities[index].name)));
              });
        }
        return const SizedBox();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ExploriaTheme.primaryColor,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white),
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text('Pilih Kabupaten',
            style: ExploriaTheme.bodyText.copyWith(color: Colors.white)),
        centerTitle: true,
        elevation: 4,
      ),
      body: blocListener(blocBuilder()),
    );
  }
}
