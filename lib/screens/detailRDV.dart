import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:med/models/observer.dart';
import 'package:med/viewModels/rdvViewModel.dart';

import '../models/RDV.dart';
import '../models/user.dart';
import 'home.dart';

class detailRDVPage extends StatefulWidget {
  detailRDVPage(this.rdv, this.user, {Key? key}) : super(key: key);
  User? user;
  RDV rdv;
  @override
  State<detailRDVPage> createState() => _detailRDVPageState();
}

class _detailRDVPageState extends State<detailRDVPage> with Observer {
  rdvViewModel rdvVm = rdvViewModel();
  String? text =
      'veuiller accepter la demande d acces à votre dossier médical par le médecin :';
  bool encours = false;

  @override
  void initState() {
    super.initState();
    text = text! + (widget.rdv.nomMedecin)!;
    rdvVm.registerObserver(this);
  }

  @override
  void notify(String message) {
    super.notify(message);
    log("notify message ");
    if (message == "fin cosultation") {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => homePage(widget.user)));
    } else {
      setState(() {
        text = 'vous etes en cours d effectuer la consultation';
        encours = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Medico"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              text!,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 70,
            ),
            rdvVm.getLoading()
                ? SizedBox(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator(),
                  )
                : encours
                    ? Center(
                        child: lockButton(),
                      )
                    : Row(
                        children: [
                          refuserButton(),
                          SizedBox(
                            width: 40,
                          ),
                          autoriserButton()
                        ],
                      ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget autoriserButton() {
    return GestureDetector(
      onTap: () => {
        rdvVm.autoriser(context, widget.user?.id),
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => homePage()))
      },
      child: //rdvVm.getLoading()
          // ? SizedBox(
          //     height: 25,
          //     width: 25,
          //     child: CircularProgressIndicator(),
          //   )
          // :
          Container(
        width: MediaQuery.of(context).size.width / 3,
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

  Widget refuserButton() {
    return GestureDetector(
      onTap: () => {
        //rdvVm.refuser(context, widget.user?.id),
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => homePage(widget.user)))
      },
      child:
          // rdvVm.getLoading()
          //     ? SizedBox(
          //         height: 25,
          //         width: 25,
          //         child: CircularProgressIndicator(),
          //       ):
          Container(
        width: MediaQuery.of(context).size.width / 3,
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
          'Refuser',
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget lockButton() {
    return GestureDetector(
      onTap: () => {
        rdvVm.refuser(context, widget.user?.id),
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => homePage()))
      },
      child:
          // rdvVm.getLoading()
          //     ? SizedBox(
          //         height: 25,
          //         width: 25,
          //         child: CircularProgressIndicator(),
          //       ):
          Container(
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
          'Terminer la consultation',
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
