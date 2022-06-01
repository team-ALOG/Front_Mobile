import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:med/models/observer.dart';
import 'package:med/screens/home.dart';
import 'package:med/viewModels/UserViewModel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Observer {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var userVm = UserViewModel(null, false);
  bool load = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    log("init state");
    userVm.registerObserver(this);
  }

  @override
  void notify(String message) {
    // TODO: implement notify
    super.notify(message);
    log("notify message ");
    setState(() {
      load = userVm.getLoading();
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            appLogo(),
            const SizedBox(height: 50),
            Column(
              children: <Widget>[emailInputField(), passwordInputField()],
            ),
            const SizedBox(height: 60),
            loginButton(),
          ],
        ),
      ),
    );
  }

  Widget appLogo() {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
          text: 'My',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color.fromARGB(255, 28, 49, 190),
          ),
          children: [
            TextSpan(
              text: 'App',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
          ]),
    );
  }

  Widget emailInputField() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            "e-mail",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
              controller: emailController,
              obscureText: false,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget passwordInputField() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            "mot de passe",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget loginButton() {
    return GestureDetector(
      onTap: () => {
        userVm.login(context, emailController.text, passwordController.text),
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => homePage()))
      },
      child: userVm.getLoading()
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
                'Se connecter',
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
    );
  }
}
