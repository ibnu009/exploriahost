import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/material.dart';

class MissionDetailScreen extends StatefulWidget {
  const MissionDetailScreen({Key? key}) : super(key: key);

  @override
  _MissionDetailScreenState createState() => _MissionDetailScreenState();
}

class _MissionDetailScreenState extends State<MissionDetailScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white24,
          title: Text(
              "Detail Misi",
              style: ExploriaTheme.smallTitle
          ),
          leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back,
                color: ExploriaTheme.primaryColor,
              )),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Image(
                  //     image: NetworkImage(
                  //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNGn2ApoDdsvsla7BGl_jx7lZXFoeb0nkvG-oxwdRE9DRvfdshJPE7nZwOOLc1NLKYf_E&usqp=CAU'),
                  //   height: 219.0,
                  //
                  // ),
                ],
              ),
            )
        )
    );
  }
}