import 'dart:convert';
import 'dart:async';
import 'package:lpk_ihmi_mobile/model/informasi.dart';
import 'package:http/http.dart' as http;
import 'package:lpk_ihmi_mobile/services/config.dart';

class ApiInformasiStatic {
  static getHost() {
    return CONFIG.host;
  }

  static getInformasi() {}
}

Future<List<Informasi>> getInformasi() async {
  try {
    String url = getHost() + "/api/informasi";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      final parsed = json['data'].cast<Map<String, dynamic>>();
      return parsed.map<Informasi>((json) => Informasi.fromJson(json)).toList();
    } else {
      return [];
    }
  } catch (e) {
    return [];
  }
}

getHost() {}
