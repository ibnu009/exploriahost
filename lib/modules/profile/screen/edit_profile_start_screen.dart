import 'package:exploriahost/modules/profile/screen/edit_job_profile_screen.dart';
import 'package:exploriahost/modules/profile/screen/edit_name_profile_screen.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfileStartScreen extends StatefulWidget {
  const EditProfileStartScreen({Key? key}) : super(key: key);

  @override
  _EditProfileStartScreenState createState() => _EditProfileStartScreenState();
}

class _EditProfileStartScreenState extends State<EditProfileStartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white24,
          title: Text(
            "Data Diri",
            style: ExploriaTheme.smallTitle
          ),
            leading: InkWell(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back,
                  color: ExploriaTheme.primaryColor,
                )
            ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.only(top: 20.0, bottom: 22.0),
                  child: const CircleAvatar(
                    radius: 50.0,
                    backgroundImage: NetworkImage('https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_640/v15710620671/wwa6sd5wyp1wxjrder5i.png'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nama',style: ExploriaTheme.subTitle),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Ibnu Batutah", ),
                          InkWell(
                            onTap: (){
                              Navigator.push(context,
                              CupertinoPageRoute(builder: (c) => const EditNameProfile()));
                            },
                              child: Text("Ubah", style: TextStyle(color: ExploriaTheme.primaryColor))),
                        ],
                      ),
                    ),
                  ]
                ),
              ),
              Padding(padding: const EdgeInsetsDirectional.fromSTEB(10, 15, 10, 0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Pekerjaan',style: ExploriaTheme.subTitle),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Tour Guide In Bondowoso Tourism Community", ),
                            InkWell(
                                onTap: (){
                                  Navigator.push(context, CupertinoPageRoute(builder: (c) => const EditJobProfile()));
                                },
                                child: Text("Ubah", style: TextStyle(color: ExploriaTheme.primaryColor))),
                          ],
                        ),
                      ),
                    ]
                ),
              )
            ],
        )
    );
  }
}