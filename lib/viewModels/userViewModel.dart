import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import '../models/observer.dart';
import '../models/user.dart';
import '../screens/home.dart';
import '../services/webServices.dart';

class UserViewModel {
  User? _user;
  bool _loading = false;
  List<Observer>? _observers;

  UserViewModel(this._user, this._loading);

  void registerObserver(Observer observer) {
    if (_observers == null) {
      _observers = [observer];
    } else {
      _observers?.add(observer);
    }
  }

  void notify_observers(String message) {
    if (_observers != null) {
      for (var observer in _observers!) {
        observer.notify(message);
      }
    }
  }

  String? getName() {
    return _user?.name;
  }

  bool getLoading() {
    return _loading;
  }

  Future<void> login(dynamic context, String email, String password) async {
    WebServices webServices = WebServices();
    _loading = true;
    notify_observers("login");

    try {
      User result = await webServices.login(email, password);
      _user = result;
      _loading = false;
      notify_observers("login success");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => homePage(_user)));
    } catch (e) {
      _loading = false;
    }
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => homePage(User("name", "surname", "email"))));
  }
}
