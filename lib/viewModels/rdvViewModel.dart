import 'dart:developer';

import 'package:flutter/material.dart';

import '../models/observer.dart';
import '../models/rdv.dart';
import '../services/webServices.dart';

class rdvViewModel {
  RDV? _rdv;
  bool _loading = false;
  rdvViewModel({RDV? rdv}) : _rdv = rdv;

  List<Observer>? _observers;

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

  bool getLoading() {
    return _loading;
  }

  Future<void> autoriser(dynamic context, int? id) async {
    WebServices webServices = WebServices();
    _loading = true;
    notify_observers("autorisation d acces");

    try {
      bool result = await webServices.autoriser(id);
      _loading = !result;
      notify_observers("autorisation d acces success");
    } catch (e) {
      _loading = false;
    }
    //log("message hii");
  }

  Future<void> refuser(dynamic context, int? id) async {
    WebServices webServices = WebServices();
    _loading = true;
    notify_observers("refus d acces");

    try {
      bool result = await webServices.refuser(id);
      _loading = !result;
      notify_observers("fin cosultation");
    } catch (e) {
      _loading = false;
    }
    //log("message hii");
  }
}
