import 'package:exploriahost/modules/verification/screen/verification_second_screen.dart';
import 'package:exploriahost/ui/component/button/primary_button.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VerificationStartScreen extends StatelessWidget {
  const VerificationStartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Mulai Verifikasi",
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 16,
          ),
          const Text(
            "Verifikasi Akun",
            style: TextStyle(
                color: ExploriaTheme.primaryColor,
                fontSize: 22,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
              "Verifikasi akun kamu agar dapat menambahkan Experience dan dipercaya Adventurer",
              style: ExploriaTheme.bodyText,
              textAlign: TextAlign.center),
          const SizedBox(
            height: 16,
          ),
          SvgPicture.asset('assets/img_verification.svg'),
          const SizedBox(
            height: 16,
          ),
          exploriaPrimaryButton(
              context: context,
              text: 'Mulai Verifikasi',
              isEnabled: true,
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (c) => const VerificationSecondScreen(),
                  ),
                );
              })
        ],
      ),
    );
  }
}
