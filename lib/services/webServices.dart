import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:med/models/RDV.dart';

import '../models/user.dart';

class WebServices {
  // Le patron singleton pour avoir une seule instance de cette classe
  static final WebServices _singleton = WebServices._internal();

  factory WebServices() {
    return _singleton;
  }

  WebServices._internal();

  // Le contenu de la classe
  var dio = Dio();

  Future<List<RDV>> getAllRDVs() async {
    String baseUrl = "https://hi";

    final response = await dio.get(baseUrl);

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['rdvs'];
      return list.map((rdv) => RDV.fromJson(rdv)).toList();
    } else {
      throw Exception("Failed to get your appointments");
    }
  }

  Future<User> login(String email, String password) async {
    String baseUrl = "https://9904-129-45-36-44.eu.ngrok.io/api/connection";

    Map jsonRqt = {'email': email, 'password': password};
    log(jsonRqt.toString());
    final response = await dio.post(baseUrl, data: jsonRqt);
    log(response.data.toString());
    if (response.statusCode == 200) {
      final result = response.data;
      return User.fromJson(result);
    } //else if (response.statusCode == 404) {
    //return null;
    else {
      throw Exception("Login Failed");
    }
  }
}
