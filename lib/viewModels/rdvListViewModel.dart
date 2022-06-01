import 'dart:async';
import 'dart:developer';
import '../models/RDV.dart';
import '../models/observer.dart';
import '../services/webServices.dart';
import 'package:flutter/material.dart';

enum LoadingStatus { completed, searching, empty }

class rdvListViewModel with ChangeNotifier {
  //LoadingStatus loadingStatus = LoadingStatus.empty;
  List<RDV>? _rdv;
  bool _loading = true;
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

  List<RDV>? getListRDV() {
    return _rdv;
  }

  void loadListRDV(dynamic context, int? id) async {
    WebServices webServices = WebServices();
    _loading = true;
    try {
      List<RDV>? result = await webServices.getAllRDVs(id);
      _rdv = result;
      _loading = false;
      notify_observers("list rdv loading success");

      // List<RDV> scheduless = [
      //   RDV(1, "nomMedecin", "date", "dentiste"),
      //   RDV(3, "nomMedecin2", "date2", "ldjazk")
      // ];

      // log("waiting for 5 seconds begin");
      // Timer(
      //     Duration(seconds: 10),
      //     () => {
      //           _rdv = scheduless,
      //           _loading = false,
      //           notify_observers("list rdv loading success"),
      //           log("waiting for 5 seconds done")
      //         });
    } catch (e) {
      _loading = false;
    }
  }
}
