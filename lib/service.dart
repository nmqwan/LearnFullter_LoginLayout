import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'User.dart';
import 'error.dart';
import 'network_util.dart';
import 'dart:convert';

class Service {
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "https://dev.helloqua.com/ws/v1/";
  static final LOGIN_URL = BASE_URL + "/authtoken";

  Future<dynamic> login(String username, String password) {
    print(username +" "+password);
    return _netUtil.post(LOGIN_URL,
        body: {"username": username, "password": password}).then((dynamic res) {
      if (res["status"]==false){
      return  new ErrorApi.map(res);
      }
//      return new User.map(res);
      return new User.map(res);
    });
  }

}
