// ignore: file_names
// ignore: file_names
import 'dart:convert';
import 'dart:async';
import '../model/peserta.dart';
import 'package:http/http.dart' as http;
import 'package:lpk_ihmi_mobile/services/config.dart';
// ignore: unused_import

class ApiPesertaStatic {
  static getHost() {
    return CONFIG.host;
  }

  static getPeserta() {}
}

Future<List<Peserta>> getPeserta() async {
  try {
    String url = getHost() + "/api/Peserta";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      final parsed = json['data'].cast<Map<String, dynamic>>();
      return parsed.map<Peserta>((json) => Peserta.fromJson(json)).toList();
    } else {
      return [];
    }
  } catch (e) {
    return [];
  }
}

getHost() {}
