import 'package:elshaima/shared/components/components.dart';

import 'package:elshaima/shared/styles/colors.dart';
import 'package:elshaima/modules/drawer/drawer_view.dart';
import 'package:elshaima/modules/notification/notifications_view.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class HomeScreen extends StatefulWidget {
  static final routname = "/home";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void add() {
    setState(() {
      if (_n != 7) {
        _n++;
      }
    });
  }

  int _n = 1;
  void minus() {
    setState(() {
      if (_n != 1) _n--;
    });
  }

  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white,
        drawer: Drawer(
          child: Drawe_view(),
        ),
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
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Builder(
                        builder: (context) => IconButton(
                          icon: Icon(
                            Icons.segment,
                            color: Colors.white,
                            size: 35,
                          ),
                          onPressed: () => Scaffold.of(context).openDrawer(),
                        ),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.notifications_sharp,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => Notifications_View()))),
                    ],
                  ),
                ),
                CustomText(
                  text: "??????????",
                  alignment: Alignment.center,
                  fontSize: 26,
                  color: Colors.white,
                  fontweight: FontWeight.w900,
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 5, right: 5),
                height: height * 0.67,
                width: double.infinity,
                child: ListView(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 10, left: 10, top: 15),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: "??/????/????????",
                                  fontSize: 25,
                                  fontweight: FontWeight.bold,
                                  color: primaryColor,
                                ),
                                CustomText(
                                  text: "??????????",
                                  color: primaryColor,
                                  fontSize: 25,
                                  fontweight: FontWeight.bold,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: height * 0.21,
                            width: double.infinity,
                            child: Card(
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none),
                              elevation: 1,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.ac_unit_outlined,
                                          color: primaryColor,
                                        ),
                                        CustomText(
                                          text: "??????????",
                                          fontSize: 25,
                                          fontweight: FontWeight.bold,
                                          color: primaryColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          text: "??:??",
                                          fontSize: 23,
                                          fontweight: FontWeight.bold,
                                          color: primaryColor,
                                        ),
                                        CustomText(
                                          text: "????????????????",
                                          fontSize: 23,
                                          fontweight: FontWeight.bold,
                                          color: primaryColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: height * 0.28,
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Card(
                              color: Colors.grey.shade100,
                              elevation: 1,
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: CustomText(
                                      text: "?????? ????????????",
                                      alignment: Alignment.center,
                                      fontSize: 23,
                                      fontweight: FontWeight.bold,
                                      color: primaryColor,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          text: "????????????????+ ??????",
                                          fontSize: 23,
                                          fontweight: FontWeight.bold,
                                          color: primaryColor,
                                        ),
                                        CustomText(
                                          text: "????????????",
                                          fontSize: 25,
                                          fontweight: FontWeight.bold,
                                          color: primaryColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          text: "????????+????????????????",
                                          fontSize: 23,
                                          fontweight: FontWeight.bold,
                                          color: primaryColor,
                                        ),
                                        CustomText(
                                          text: "????????????",
                                          fontSize: 23,
                                          fontweight: FontWeight.bold,
                                          color: primaryColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: height * 0.2,
                            width: double.infinity,
                            child: Card(
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none),
                              elevation: 1,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: CustomText(
                                      text: "????????????",
                                      alignment: Alignment.center,
                                      fontSize: 25,
                                      fontweight: FontWeight.bold,
                                      color: primaryColor,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CustomText(
                                          alignment: Alignment.center,
                                          text: "????????????????+ ??????",
                                          fontSize: 23,
                                          fontweight: FontWeight.bold,
                                          color: primaryColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              height: height * 0.29,
                              width: double.infinity,
                              child: Card(
                                color: Colors.grey.shade100,
                                elevation: 1,
                                shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide.none),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: CustomText(
                                        text: "???????????? ??????????????",
                                        alignment: Alignment.center,
                                        fontSize: 25,
                                        fontweight: FontWeight.bold,
                                        color: primaryColor,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(
                                            text: "??????????",
                                            color: primaryColor,
                                            fontSize: 23,
                                            fontweight: FontWeight.bold,
                                          ),
                                          CustomText(
                                            text: "??????????",
                                            color: primaryColor,
                                            fontSize: 25,
                                            fontweight: FontWeight.bold,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(
                                            text: "????????+????????????????",
                                            color: primaryColor,
                                            fontSize: 23,
                                            fontweight: FontWeight.bold,
                                          ),
                                          CustomText(
                                            text: "????????????",
                                            color: primaryColor,
                                            fontSize: 23,
                                            fontweight: FontWeight.bold,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              height: height * 0.29,
                              width: double.infinity,
                              child: Card(
                                elevation: 1,
                                shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide.none),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: CustomText(
                                        text: "???????????? ????????????",
                                        alignment: Alignment.center,
                                        fontSize: 25,
                                        fontweight: FontWeight.bold,
                                        color: primaryColor,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(
                                            text: "??????",
                                            fontSize: 23,
                                            fontweight: FontWeight.bold,
                                            color: primaryColor,
                                          ),
                                          CustomText(
                                            text: "????????????",
                                            fontSize: 25,
                                            fontweight: FontWeight.bold,
                                            color: primaryColor,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(
                                            text: "????????????",
                                            fontSize: 23,
                                            fontweight: FontWeight.bold,
                                            color: primaryColor,
                                          ),
                                          CustomText(
                                            text: "?????? ????????????",
                                            fontSize: 23,
                                            fontweight: FontWeight.bold,
                                            color: primaryColor,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Container(
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: CircleAvatar(
                            backgroundColor: primaryColor,
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                return minus();
                              },
                            )),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      CustomText(
                        text: "$_n",
                        color: primaryColor,
                        fontweight: FontWeight.bold,
                        fontSize: 30,
                        alignment: Alignment.center,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        child: CircleAvatar(
                            backgroundColor: primaryColor,
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                return add();
                              },
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
