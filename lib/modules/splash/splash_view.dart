import 'dart:async';

import 'package:elshaima/modules/child/child_view.dart';
import 'package:elshaima/shared/components/components.dart';
import 'package:elshaima/shared/components/constance.dart';

import 'package:elshaima/shared/styles/colors.dart';

import 'package:flutter/material.dart';


import '../login/login_view.dart';

class Splash extends StatefulWidget {
//  static final routname="/splash";
  @override
  _SplashState createState() => _SplashState();
}

@override
class _SplashState extends State<Splash> {
// ignore: must_call_super

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 1), () {
      if(Token !=null){
        Navigator.push(
            context, MaterialPageRoute(builder: (ctx) => ChildScreen()));
      }else{
        Navigator.push(
            context, MaterialPageRoute(builder: (ctx) => LoginScreen()));
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
                radius: 80,
                backgroundColor: Colors.white,
                child: Image.asset(
                  "assets/images/logoo.png",
                  fit: BoxFit.cover,
                )),
            SizedBox(
              height: 10,
            ),
            CustomText(
              text: "دار الشيماء لتحفيظ",
              alignment: Alignment.center,
              color: Colors.white,
              fontSize: 30,
              fontFamily: 'ArefRuqaa',
              fontweight: FontWeight.bold,
            ),
            CustomText(
              text: "القران الكريم",
              alignment: Alignment.center,
              color: Colors.white,
              fontSize: 30,
              fontFamily: 'ArefRuqaa',
              fontweight: FontWeight.bold,
            )
          ],
        ));
  }
}
