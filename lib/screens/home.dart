import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:med/models/observer.dart';
import 'package:med/screens/detailRDV.dart';
import 'package:med/viewModels/rdvListViewModel.dart';
import '../models/RDV.dart';
import '../models/user.dart';
import 'styles/colors.dart';

class homePage extends StatefulWidget {
  homePage(this.user, {Key? key}) : super(key: key);
  User? user;

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> with Observer {
  rdvListViewModel rdvListVm = rdvListViewModel();
  List<RDV>? scheduless = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    log("init state");
    rdvListVm.loadListRDV(context, widget.user?.id);
    rdvListVm.registerObserver(this);
  }

  @override
  void notify(String message) {
    // TODO: implement notify
    super.notify(message);
    log("notify message ");
    setState(() {
      scheduless = rdvListVm.getListRDV();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Medico"),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              appHeader(),
              SizedBox(
                height: 40,
              ),
              Container(
                height: rdvListVm.getLoading() ? 50 : 600,
                child: rdvListVm.getLoading()
                    ? SizedBox(
                        height: 25,
                        width: 25,
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: scheduless!.length,
                        itemBuilder: (context, index) {
                          var rdv = scheduless![index];
                          //var rdv = scheduless[1];
                          bool isLastElement =
                              (scheduless?.length)! + 1 == index;
                          return rdvCard(isLastElement, rdv);
                        },
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget appHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Text(
              (widget.user?.name)! + ' ' + (widget.user?.surname)! + ' 👋',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ],
    );
  }

  Widget rdvCard(bool isLastElement, RDV rdv) {
    return GestureDetector(
        onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => detailRDVPage(rdv, widget.user)))
            },
        child: Card(
          margin:
              !isLastElement ? EdgeInsets.only(bottom: 20) : EdgeInsets.zero,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                        //backgroundImage: AssetImage(_schedule['img']),
                        ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          rdv.nomMedecin!,
                          style: TextStyle(
                            color: Color(MyColors.header01),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          rdv.emailMedecin!,
                          style: TextStyle(
                            color: Color(MyColors.grey02),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                DateTimeCard(rdv.date!),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ));
  }
}

class DateTimeCard extends StatelessWidget {
  DateTimeCard(
    this.date, {
    Key? key,
  }) : super(key: key);

  String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(MyColors.bg03),
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 180,
          ),
          Icon(
            Icons.calendar_today,
            color: Color(MyColors.primary),
            size: 15,
          ),
          Text(
            date,
            style: TextStyle(
              fontSize: 12,
              color: Color(MyColors.primary),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
