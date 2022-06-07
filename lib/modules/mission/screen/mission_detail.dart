import 'package:exploriahost/modules/mission/screen/mission_complete.dart';
import 'package:exploriahost/ui/component/button/primary_button.dart';
import 'package:exploriahost/ui/component/text/exploria_generic_text_input_hint.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image(
                      image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNGn2ApoDdsvsla7BGl_jx7lZXFoeb0nkvG-oxwdRE9DRvfdshJPE7nZwOOLc1NLKYf_E&usqp=CAU'),
                    width: 412,
                    fit: BoxFit.fitHeight,
                  ),
                  Container(
                      padding: EdgeInsets.only(bottom: 8, left: 17, top: 8),
                      child: Text("Mengunjungi Kafe Skala dan Mendokumentasi sekitar Kafe", style: ExploriaTheme.title1, maxLines: 3, overflow: TextOverflow.ellipsis)),
                  Container(
                      padding: EdgeInsets.only(bottom: 8, left: 17),
                      child: Text(
                          "Deadline : Rabu, 1 Juni 2022 ",
                          style: ExploriaTheme.smallTitleRed.copyWith(fontWeight: FontWeight.w300))
                  ),
                  Container(
                      padding: EdgeInsets.only(bottom: 8, left: 17),
                      child: Text("25 pts ", style: ExploriaTheme.priceTextStyle)),
                  _buildDivider(),
                  ExploriaGenericTextInputHint(text: 'Nama'),
                  Container(
                      padding: EdgeInsets.only(bottom: 8, left: 17),
                      child: Text('Kafe Skala')),
                  ExploriaGenericTextInputHint(text: 'Alamat Lokasi'),
                  Container(
                      padding: EdgeInsets.only(bottom: 8, left: 17),
                      child: Text('Jl. DR. Sutomo, Potos, Badean, Kec. Bondowoso, Kabupaten Bondowoso, Jawa Timur 68214')),
                  ExploriaGenericTextInputHint(text: 'Detail Lokasi'),
                  Container(
                      padding: EdgeInsets.only(bottom: 8, left: 17),
                      child: Text('Sebelah Utara Hotel Palm'))
                ],
              ),
            )
        ),
        bottomNavigationBar:
        Container(
          padding: EdgeInsets.all(20.0),
          child: exploriaPrimaryButton(
              context: context,
              text: 'Konfirmasi Misi Selesai',
              isEnabled: true,
              onPressed: (){
                Navigator.push(context,
                    CupertinoPageRoute(builder: (c) => const MissionCompleteScreen()));
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