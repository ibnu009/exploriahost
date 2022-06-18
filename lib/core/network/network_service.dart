import 'dart:convert';
import 'dart:io';

import 'package:exploriahost/core/network/response/auth/LoginResponse.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:logger/logger.dart';

const BASE_URL = 'https://97f5-2001-448a-5122-874-b828-648b-cc97-da21.ngrok.io';

abstract class NetworkService {
  final logger = Logger(printer: PrettyPrinter());

  Future<dynamic> getMethod(String endPoint, Map<String, String>? headers) async {
    try {
      final response = await http.get(Uri.parse(endPoint), headers: headers);
      var res = json.decode(response.body);
      logger.d(res);
      return res;
    } on SocketException {
      throw Exception("Connection Failed");
    }
  }

  Future<dynamic> postMethod(String endpoint,
      {dynamic body, Map<String, String>? headers}) async {
    try {
      final response = await http.post(Uri.parse(endpoint),
          body: json.encode(body), headers: headers);
      Map<String, dynamic> res = jsonDecode(response.body);
      logger.d(res);
      return res;
    } on SocketException {
      throw Exception("Connection Failed");
    }
  }

  Future<dynamic> postMethodNoBody(String endpoint,
      { Map<String, String>? headers}) async {
    try {
      final response = await http.post(Uri.parse(endpoint), headers: headers);
      Map<String, dynamic> res = jsonDecode(response.body);
      logger.d(res);
      return res;
    } on SocketException {
      throw Exception("Connection Failed");
    }
  }

  Future<dynamic> multipartPost(String endpoint,
      {Map<String, String>? body,
      Map<String, String>? header,
      Map<String, File>? files}) async {
    try {
      var uri = Uri.parse(endpoint);
      var request = http.MultipartRequest("POST", uri);

      if (files!.isNotEmpty) {
        files.forEach((key, value) async {
          request.files.add(await http.MultipartFile.fromPath(key, value.path,
              contentType: MediaType('image', '*')));
        });
      }

      if (header != null) request.headers.addAll(header);
      if (body != null) request.fields.addAll(body);

      var response = await request.send().then(http.Response.fromStream);
      var res = jsonDecode(response.body);
      logger.d(res);
      return res;

    } on SocketException {
      throw Exception("Connection Failed");
    }
  }

  Future<dynamic> multipartUpdate(String endpoint,
      {Map<String, String>? body,
      Map<String, String>? header,
      Map<String, File>? files}) async {
    try {
      var uri = Uri.parse(endpoint);
      var request = http.MultipartRequest("PUT", uri);

      if (files!.isNotEmpty) {
        files.forEach((key, value) async {
          request.files.add(await http.MultipartFile.fromPath(key, value.path,
              contentType: MediaType('image', '*')));
        });
      }

      request.headers.addAll(header!);
      if (body != null) request.fields.addAll(body);

      var response = await request.send().then(http.Response.fromStream);
      var res = jsonDecode(response.body);
      logger.d(res);
      return res;
    } on SocketException {
      throw Exception("Connection Failed");
    }
  }

  Future<dynamic> putMethod(String endpoint,
      {dynamic body, Map<String, String>? header}) async {
    try {
      final response = await http.put(Uri.parse(endpoint),
          body: json.encode(body), headers: header);
      var res = json.decode(response.body);
      logger.d(res);
      return res;
    } on SocketException {
      throw Exception("Connection Failed");
    }
  }

  Future<dynamic> deleteMethod(String endpoint, Map<String, String>? headers) async {
    try {
      final response = await http.delete(Uri.parse(endpoint), headers: headers);
      var res = json.decode(response.body);
      logger.d(res);
      return res;
    } on SocketException {
      throw Exception("Connection Failed");
    }
  }

  Future<LoginResponse> loginUser(String email, String password) async {
    print("Loginn cuyyy");
    final response = await http.post(
      Uri.parse("$BASE_URL/api/login"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, Object>{'email': email, 'password': password}),
    );
    return LoginResponse.fromJson(json.decode(response.body));
  }

  Future<dynamic> createExperienceService(String endpoint,
      {Map<String, String>? header, dynamic body, required List<File> files}) async {
    try {
      var uri = Uri.parse(endpoint);
      var request = http.MultipartRequest("POST", uri);

      for (var element in files) {
        request.files.add(await http.MultipartFile.fromPath('files', element.path,
            contentType: MediaType('image','*')));
      }

      if (header != null) request.headers.addAll(header);
      if (body != null) request.fields.addAll(body);

      var response = await request.send().then(http.Response.fromStream);
      var res = jsonDecode(response.body);
      logger.d(res);
      return res;

    } on SocketException {
      throw Exception("Connection Failed");
    }
  }
}
