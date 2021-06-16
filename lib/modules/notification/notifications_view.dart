import 'package:elshaima/shared/components/components.dart';

import 'package:elshaima/shared/styles/colors.dart';




import 'package:flutter/material.dart';


import '../home/home_view.dart';

// ignore: camel_case_types
class Notifications_View extends StatefulWidget {
  static final routname = "/Notifications";
  @override
  _Notifications_ViewState createState() => _Notifications_ViewState();
}

// ignore: camel_case_types
class _Notifications_ViewState extends State<Notifications_View> {


@override


@override

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.14),
        child: Container(
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () =>
                      Navigator.pushNamed(context, HomeScreen.routname)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "الاشعارات",
                    alignment: Alignment.center,
                    fontSize: 26,
                    color: Colors.white,
                    fontweight: FontWeight.w900,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding:
        const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        child: Container(
          child: Card(
            elevation: 1,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none),
            child: Padding(
              padding: const EdgeInsets.only(right: 30, left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    child: Icon(
                      Icons.notifications_sharp,
                      color: Colors.white,
                      size: 30,
                    ),
                    backgroundColor: kColor,
                    radius: 30,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    text:
                    "notification.title ",
                    fontSize: 22,
                    color: primaryColor,
                    fontweight: FontWeight.bold,
                    alignment: Alignment.center,
                  )
                ],
              ),
            ),
          ),
          height: height * 0.3,
        ),

      )
    );
  }


}
