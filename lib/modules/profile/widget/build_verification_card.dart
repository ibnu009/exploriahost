import 'package:exploriahost/modules/verification/screen/verification_start_screen.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String textVerified =
    "Akun kamu belum di verifikasi nih! Verifikasi sekarang untuk mendapatkan benefit lebih dan dipercaya oleh para Adventurer dengan menambahkan alamat dan verifikasi sederhana.";
const String textVerifying =
    "Tim kami sedang memproses verifikasi akun anda, harap tunggu! Anda dapat melaporkan masalah ini dalam waktu 2x24 Jam setelah melakukan verifikasi akun jika belum mendapatkan status verifikasi.";

class BuildVerificationCard extends StatelessWidget {
  final bool isVerifying;

  const BuildVerificationCard({Key? key, required this.isVerifying})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 18),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: Colors.deepOrange),
          color: Colors.amber[200]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Verifikasi Akun",
            style: ExploriaTheme.subTitle,
          ),
          Text(isVerifying ? textVerifying : textVerified,
              style: const TextStyle(color: Colors.black87)),
          SizedBox(
            height: 12,
          ),
          Visibility(
            visible: !isVerifying,
            maintainSize: false,
            child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (c) => const VerificationStartScreen(),
                    ),
                  );
                },
                child: Text(
                  "Verifikasi Sekarang!",
                  style: ExploriaTheme.subTitleButton
                      .copyWith(color: ExploriaTheme.primaryColor),
                )),
          )
        ],
      ),
    );
  }
}
