import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:med/models/observer.dart';
import 'package:med/viewModels/rdvViewModel.dart';

class detailRDVPage extends StatefulWidget {
  detailRDVPage({Key? key}) : super(key: key);

  @override
  State<detailRDVPage> createState() => _detailRDVPageState();
}

class _detailRDVPageState extends State<detailRDVPage> with Observer {
  rdvViewModel rdvVm = rdvViewModel();
  String text = 'veuiller accepter la demande d acces à votre dossier médical';

  @override
  void initState() {
    super.initState();
    rdvVm.registerObserver(this);
  }

  @override
  void notify(String message) {
    super.notify(message);
    log("notify message ");
    setState(() {
      text = 'vous etes en cours d effectuer la consultation';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              text,
            ),
            autoriserButton()
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget autoriserButton() {
    return GestureDetector(
      onTap: () => {
        rdvVm.autoriser(context),
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => homePage()))
      },
      child: rdvVm.getLoading()
          ? SizedBox(
              height: 25,
              width: 25,
              child: CircularProgressIndicator(),
            )
          : Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromARGB(255, 181, 182, 208),
                    Color(0xFF03217b),
                    //Color.fromARGB(255, 28, 49, 190),
                    //Color.fromARGB(255, 28, 49, 190),
                  ],
                ),
              ),
              child: const Text(
                'Autoriser',
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
    );
  }
}
