import 'dart:developer';

import 'package:flutter/material.dart';

import '../models/observer.dart';
import '../models/rdv.dart';

class rdvViewModel {
  RDV? _rdv;
  bool _loading = true;
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

  Future<void> autoriser(dynamic context) async {
    // WebServices webServices = WebServices();
    // _loading = true;
    // notify_observers("autorisation d acces");

    // try {
    //   await webServices.autoriser();
    //
    // } catch (e) {
    //   _loading = false;
    // }
    log("message hii");
  }
}

//TODO: webServices 
//TODO: passage from list to detail

