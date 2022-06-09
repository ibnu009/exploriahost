import 'package:exploriahost/ui/component/text/exploria_generic_text_input_hint.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/material.dart';

class PencairanSaldoScreen extends StatefulWidget {
  const PencairanSaldoScreen({Key? key}) : super(key: key);

  @override
  _PencairanSaldoScreenState createState() => _PencairanSaldoScreenState();
}

class _PencairanSaldoScreenState extends State<PencairanSaldoScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white24,
          title: Text(
              "Pencairan Saldo",
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
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Yeay! Saldo kamu telah dicairkan ke rekeningmu. Jika aktivitras ini bukan dilakukan olehmu, kamu dapat melaporkan masalah ini di Laporkan Masalah.',
                    style: ExploriaTheme.text1,),
                    SizedBox(height: 16,),
                    _buildTitle('Jumlah Pencairan'),
                    _buildText('Jumlah Saldo Sebelum Pencairan', 'Rp 15000000'),
                    _buildText('Saldo yang Dicairkan', 'Rp 1000000'),
                    _buildText('Jumlah Saldo Setelah Dicairkan', 'Rp 500000'),
                    _buildTitle('Info Rekening'),
                    _buildText('Bank', 'BRI'),
                    _buildText('Nomor Rekening', '24728745968'),
                    _buildTitle('Waktu Pencairan'),
                    _buildText('Tanggal', '1 June 2022'),
                    _buildText('Waktu', '12.45'),
                    _buildText('Status', 'Done')
                  ],
                ),
              ),
            )
        )
    );
  }
  Widget _buildTitle (String title){
    return Padding(
      padding: EdgeInsets.only(bottom: 12, top: 4),
      child: Text(
        title,
        style: ExploriaTheme.title1.copyWith(fontSize: 16),
      ),
    );
  }
  Widget _buildText(String title, String value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: ExploriaTheme.smallTitle.copyWith(fontSize: 14),
        ),
        Padding(
          padding: EdgeInsets.only(top: 6, bottom: 10, left: 5),
          child: Text(
            value,
            style: ExploriaTheme.text1.copyWith(color: Colors.black),
          ),
        ),
      ],
    );
  }
}

