import 'dart:convert';
import 'package:crypto/crypto.dart';

extension StringConverter on String {
  String convertToSha256() {
    List<int> bytes = utf8.encode(this);
    String hash = sha256.convert(bytes).toString();
    return hash;
  }
}