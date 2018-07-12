import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'User.dart';
import 'network_util.dart';

class Service {
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "https://dev.helloqua.com/ws/v1/";
  static final LOGIN_URL = BASE_URL + "/authtoken";

  Future<User> login(String username, String password) {
    print(username +" "+password);
    return _netUtil.post(LOGIN_URL,
        body: {"username": username, "password": password}).then((dynamic res) {
      print(res);
//      if (res["error"]) throw new Exception(res["error_msg"]);
      return new User.map(res);
    });
  }

}
