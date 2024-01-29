import 'package:get/get.dart';

class LoginProvider extends GetConnect {
  Future<Response> auth(var data) {
    var myHeader = {
      'Accept': 'aplication/json',
    };
    return post('http://192.168.43.64:8000/api/login', data, headers: myHeader);
  }
}
