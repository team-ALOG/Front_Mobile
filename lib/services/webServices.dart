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

  Future<List<RDV>?> getAllRDVs(int? id) async {
    String baseUrl =
        "https://9051-129-45-37-149.eu.ngrok.io/api/" + id.toString();

    final response = await dio.get(baseUrl);

    if (response.statusCode == 200) {
      final result = response.data["data"]["allRendezVous"];
      List<RDV>? listResult;
      log(result.toString());
      for (dynamic rdvJSON in result) {
        if (listResult == null) {
          listResult = [RDV.fromJson(rdvJSON)];
        } else {
          listResult.add(RDV.fromJson(rdvJSON));
        }
      }
      return listResult;
      // Iterable list = result['rdvs'];
      // return list.map((rdv) => RDV.fromJson(rdv)).toList();
    } else {
      throw Exception("Failed to get your appointments");
    }
  }

  Future<User> login(String email, String password) async {
    String baseUrl = "https://9051-129-45-37-149.eu.ngrok.io/api/connection";

    Map jsonRqt = {'email': email, 'password': password};
    log(jsonRqt.toString());
    final response = await dio.post(baseUrl, data: jsonRqt);
    log(response.data["data"].toString());
    if (response.statusCode == 200) {
      final result = response.data["data"];
      return User.fromJson(result);
    } //else if (response.statusCode == 404) {
    //return null;
    else {
      throw Exception("Login Failed");
    }
  }

  Future<bool> autoriser(int? id) async {
    String baseUrl =
        "https://9051-129-45-37-149.eu.ngrok.io/unlock/" + id.toString();

    final response = await dio.get(baseUrl);
    log(response.data["success"].toString());
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Login Failed");
    }
  }

  Future<bool> refuser(int? id) async {
    String baseUrl =
        "https://9051-129-45-37-149.eu.ngrok.io/lock/" + id.toString();

    final response = await dio.get(baseUrl);
    log(response.data["success"].toString());
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Login Failed");
    }
  }
}
