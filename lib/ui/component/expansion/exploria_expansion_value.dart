import 'package:flutter/material.dart';

class ItemModel{
  bool expanded;
  String headerItem;
  String discription;

  ItemModel({this.expanded: false, required this.headerItem, required this.discription,});
}

List<ItemModel> itemData = <ItemModel>[
  ItemModel(
    headerItem: 'Definisi Exploria Host',
    discription:
    "Aplikasi Exploria Host adalah aplikasi yang digunakan oleh para penduduk lokal untuk bergabung Bersama keluarga Exploria dan Bersama-sama membangun pariwisata Indonesia.",
  ),
  ItemModel(
    headerItem: 'Cara Kerja Exploria Host',
    discription: "1.	Pada saat pengguna keeper mengunduh aplikasi Exploria Host, system akan meminta persetujuan pengguna Exploria Host untuk mengaktifkan lokasi "
        "\n \n2.	Dengan kondisi lokasi aktif, maka pengguna Exploria Host akan mendapatkan informasi terkait zonasi dan area pengguna "
        "\n \n3.	Hasil ini memudahkan pengguna adventure mengakses kegiatan yang sedang pengguna Exploria Host langsungkan",
  ),
  ItemModel(
    headerItem: 'Kontak Kami',
    discription: 'Jika Anda mengalami kendala atau ada pertanyaan lainnya terkait penggunaan aplikasi Exploria Host, Anda bisa mengirimkan email ke info@exploria.com',
  ),
  ItemModel(
    headerItem: 'Versi Aplikasi',
    discription: 'Saat ini Anda menggunakan Aplikasi Exploria Host dengan versi Aplikasi yaitu 0.0.1',
  ),
  ItemModel(
    headerItem: 'Kontributor',
    discription: 'Politeknik Negeri Jember'
        '\nKementerian Pariwisata dan Industri Kreatif Indonesia',
  ),
];