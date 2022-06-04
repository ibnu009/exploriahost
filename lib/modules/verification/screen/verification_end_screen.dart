import 'package:exploriahost/modules/profile/screen/profile_screen.dart';
import 'package:exploriahost/ui/component/button/primary_button.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VerificationEndScreen extends StatelessWidget {
  const VerificationEndScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Selesai",
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
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: SvgPicture.asset('assets/img_verification_complete.svg'),
          ),
          const Text(
            "Verifikasi Kamu Sedang Diproses",
            style: TextStyle(
                color: ExploriaTheme.primaryColor,
                fontSize: 22,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
                "Harap tunggu tim kami melakukan verifikasi terkait dengan akun anda. Kami akan melakukan panggilan telepon atau Whatsapp video call",
                style: ExploriaTheme.bodyText,
                textAlign: TextAlign.center),
          ),
          const Spacer(),
          exploriaPrimaryButton(
              context: context,
              text: 'Kembali Ke Pengaturan Akun',
              isEnabled: true,
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  CupertinoPageRoute(
                    builder: (c) => const ProfileScreen(),
                  ),
                  (route) => false,
                );
              }),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
