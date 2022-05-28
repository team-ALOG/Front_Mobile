import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      height: height,
      child: Stack(
        children: <Widget>[
          // Positioned(
          //   top: -MediaQuery.of(context).size.height * .15,
          //   right: -MediaQuery.of(context).size.width * .4,
          //   child: Container(
          //       child: Transform.rotate(
          //     angle: -pi / 3.5,
          //     child: ClipPath(
          //       clipper: ClipPainter(),
          //       child: Container(
          //         height: MediaQuery.of(context).size.height * .5,
          //         width: MediaQuery.of(context).size.width,
          //         decoration: BoxDecoration(
          //           gradient: LinearGradient(
          //             begin: Alignment.topCenter,
          //             end: Alignment.bottomCenter,
          //             colors: [
          //               Color(0xffE6E6E6),
          //               Color(0xff14279B),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //   )),
          // ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: height * .2),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: 'My',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff14279B),
                        ),
                        children: [
                          TextSpan(
                            text: 'App',
                            style: TextStyle(color: Colors.black, fontSize: 30),
                          ),
                        ]),
                  ),
                  SizedBox(height: 50),
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Username",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextField(
                                obscureText: false,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    fillColor: Color(0xfff3f3f4),
                                    filled: true))
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Password",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    fillColor: Color(0xfff3f3f4),
                                    filled: true))
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    // onTap: () => Navigator.pushReplacement(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => HomeScreen(),
                    //       ),
                    //     ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.grey.shade200,
                              offset: Offset(2, 4),
                              blurRadius: 5,
                              spreadRadius: 2)
                        ],
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xff14279B),
                            Color(0xff14279B),
                          ],
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.centerRight,
                    child: Text('Forgot Password ?',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(height: height * .055),
                  // InkWell(
                  //   onTap: () {
                  //     // Navigator.push(
                  //     //     context,
                  //     //     MaterialPageRoute(
                  //     //         builder: (context) => SignUpScreen()));
                  //   },
                  //   child: Container(
                  //     margin: EdgeInsets.symmetric(vertical: 20),
                  //     padding: EdgeInsets.all(15),
                  //     alignment: Alignment.bottomCenter,
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: <Widget>[
                  //         Text(
                  //           'Don\'t have an account ?',
                  //           style: TextStyle(
                  //               fontSize: 13, fontWeight: FontWeight.w600),
                  //         ),
                  //         SizedBox(
                  //           width: 10,
                  //         ),
                  //         Text(
                  //           'Register',
                  //           style: TextStyle(
                  //               color: Color(0xff14279B),
                  //               fontSize: 13,
                  //               fontWeight: FontWeight.w600),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
