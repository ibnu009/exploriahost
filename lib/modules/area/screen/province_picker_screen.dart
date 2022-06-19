import 'package:exploriahost/core/network/response/area/province_response.dart';
import 'package:exploriahost/modules/area/bloc/area_bloc.dart';
import 'package:exploriahost/modules/area/bloc/area_event.dart';
import 'package:exploriahost/modules/area/bloc/area_state.dart';
import 'package:exploriahost/ui/component/generic/exploria_loading.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProvincePickerScreen extends StatefulWidget {
  const ProvincePickerScreen({Key? key}) : super(key: key);

  @override
  _ProvincePickerScreenState createState() => _ProvincePickerScreenState();
}

class _ProvincePickerScreenState extends State<ProvincePickerScreen> {
  late AreaBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = AreaBloc();
    _bloc.add(GetProvinces(""));
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
        if (state is ShowProvinces) {
          return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: state.provinces.length,
              itemBuilder: (context, index) {
                Province province = state.provinces[index];
                return InkWell(
                  onTap: () => Navigator.of(context)
                      .pop({'provinceId': province.id, 'name': province.name}),
                  child: ListTile(
                    title: Text(province.name),
                  ),
                );
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
        title: Text('Pilih Provinsi',
            style: ExploriaTheme.bodyText.copyWith(color: Colors.white)),
        centerTitle: true,
        elevation: 4,
      ),
      body: blocListener(blocBuilder()),
    );
  }
}
