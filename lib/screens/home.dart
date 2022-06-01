import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:med/models/observer.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    log("init state");
    rdvListVm.loadListRDV(context);
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
                          bool isLastElement = schedules.length + 1 == index;
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

  List<RDV>? scheduless = [
    RDV(1, "nomMedecin", "date", "dentiste"),
    RDV(3, "nomMedecin2", "date2", "ldjazk")
  ];
  List<Map> schedules = [
    {
      'img': 'assets/doctor01.jpeg',
      'doctorName': 'Dr. Anastasya Syahid',
      'doctorTitle': 'Dental Specialist',
      'reservedDate': 'Monday, Aug 29',
      'reservedTime': '11:00 - 12:00',
    },
    {
      'img': 'assets/doctor02.png',
      'doctorName': 'Dr. Mauldya Imran',
      'doctorTitle': 'Skin Specialist',
      'reservedDate': 'Monday, Sep 29',
      'reservedTime': '11:00 - 12:00',
    },
    {
      'img': 'assets/doctor03.jpeg',
      'doctorName': 'Dr. Rihanna Garland',
      'doctorTitle': 'General Specialist',
      'reservedDate': 'Monday, Jul 29',
      'reservedTime': '11:00 - 12:00',
    },
    {
      'img': 'assets/doctor04.jpeg',
      'doctorName': 'Dr. John Doe',
      'doctorTitle': 'Something Specialist',
      'reservedDate': 'Monday, Jul 29',
      'reservedTime': '11:00 - 12:00',
    },
    {
      'img': 'assets/doctor05.jpeg',
      'doctorName': 'Dr. Sam Smithh',
      'doctorTitle': 'Other Specialist',
      'reservedDate': 'Monday, Jul 29',
      'reservedTime': '11:00 - 12:00',
    },
    {
      'img': 'assets/doctor05.jpeg',
      'doctorName': 'Dr. Sam Smithh',
      'doctorTitle': 'Other Specialist',
      'reservedDate': 'Monday, Jul 29',
      'reservedTime': '11:00 - 12:00',
    },
  ];

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
        const CircleAvatar(
            //backgroundImage: AssetImage('assets/person.jpeg'),
            )
      ],
    );
  }

  Widget rdvCard(bool isLastElement, RDV rdv) {
    return Card(
      margin: !isLastElement ? EdgeInsets.only(bottom: 20) : EdgeInsets.zero,
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
                      rdv.specialiteMedecin!,
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
            DateTimeCard(),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}

class DateTimeCard extends StatelessWidget {
  const DateTimeCard({
    Key? key,
  }) : super(key: key);

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
          Row(
            children: [
              Icon(
                Icons.calendar_today,
                color: Color(MyColors.primary),
                size: 15,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Mon, July 29',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(MyColors.primary),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.access_alarm,
                color: Color(MyColors.primary),
                size: 17,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '11:00 ~ 12:10',
                style: TextStyle(
                  color: Color(MyColors.primary),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
