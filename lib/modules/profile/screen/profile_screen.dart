import 'package:exploriahost/modules/profile/widget/build_profile_header.dart';
import 'package:exploriahost/modules/profile/widget/build_verification_card.dart';
import 'package:exploriahost/ui/component/button/primary_button.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Akun",
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BuildProfileHeader(),
              BuildVerificationCard(isVerifying: false),
              const SizedBox(
                height: 32,
              ),
              BuildSaldoAndPoint(
                balance: "Rp 1.500.000",
                point: "500pts",
              ),
              const SizedBox(
                height: 16,
              ),
              _buildSettingParentSection("Pengaturan Akun"),
              _buildDivider(),
              _buildSettingSubSection("Ubah Nomor Telfon", () {}),
              _buildDivider(),
              _buildSettingSubSection("Ubah Alamat", () => null),
              _buildDivider(),
              _buildSettingSubSection("Ubah Password", () => null),
              _buildDivider(),
              _buildSettingParentSection("Pengaturan Aplikasi"),
              _buildDivider(),
              _buildSettingSubSection("Pengaturan Notifikasi", () => null),
              _buildDivider(),
              _buildSettingSubSection("Laporkan Masalah", () => null),
              _buildDivider(),
              _buildSettingParentSection("Kebijakan dan Pertanyaan"),
              _buildDivider(),
              _buildSettingSubSection("Kebijakan Aplikasi", () => null),
              _buildDivider(),
              _buildSettingSubSection("FAQ", () => null),
              _buildDivider(),
              
              exploriaPrimaryButton(context: context, text: "Logout", isEnabled: true, onPressed: (){}),
              const SizedBox(
                height: 48,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingParentSection(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16),
      child: Text(
        text,
        style: ExploriaTheme.subTitle,
      ),
    );
  }

  Widget _buildSettingSubSection(String text, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8, left: 32),
        child: Text(
          text,
          style: ExploriaTheme.bodyText,
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Divider(color: Colors.black12, thickness: 1),
    );
  }
}

class BuildSaldoAndPoint extends StatelessWidget {
  final String? balance, point;

  const BuildSaldoAndPoint({Key? key, this.balance, this.point})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
          color: Colors.white),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton("Saldo", balance ?? "Rp 0", 'assets/ic_money.svg'),
            const VerticalDivider(color: Colors.black26, thickness: 1),
            _buildButton(
                "Points", point ?? "0pts", 'assets/ic_point_exploria.svg'),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String title, String value, String assetPath) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          SizedBox(height: 28, width: 28, child: SvgPicture.asset(assetPath)),
          const SizedBox(
            width: 8,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: ExploriaTheme.smallTitle
                    .copyWith(color: ExploriaTheme.primaryColor),
              ),
              Text(
                value,
                style: ExploriaTheme.subTitle
                    .copyWith(color: ExploriaTheme.primaryColor),
              ),
            ],
          )
        ],
      ),
    );
  }
}