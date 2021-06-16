import 'package:elshaima/modules/home/home_view.dart';
import 'package:elshaima/shared/components/components.dart';
import 'package:elshaima/shared/network/local/chach_helper.dart';

import 'package:elshaima/shared/styles/colors.dart';

import 'package:flutter/material.dart';



class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
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
                    text: "الملف الشخصي",
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
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
          child: Column(
            children: [
              Container(
                height: height * 0.3,
                width: double.infinity,
                child: Card(
                  elevation: 1,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: kColor,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: "${CacheHelper.getData(key: 'name')}",
                            color: primaryColor,
                            fontSize: 24,
                            fontweight: FontWeight.bold,
                            alignment: Alignment.center,
                          ),
                          Icon(
                            Icons.edit,
                            color: kColor,
                            size: 30,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: height * 0.25,
                width: double.infinity,
                child: Card(
                  elevation: 1,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "رقم الهاتف",
                              color: primaryColor,
                              fontSize: 20,
                              fontweight: FontWeight.bold,
                            ),
                            CustomText(
                              text: " ${CacheHelper.getData(key: 'phone')}",
                              color: primaryColor,
                              fontSize: 20,
                              fontweight: FontWeight.bold,
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "الحضانه التابع لها",
                              color: primaryColor,
                              fontSize: 20,
                              fontweight: FontWeight.bold,
                            ),
                            CustomText(
                              text: " التليس",
                              color: primaryColor,
                              fontSize: 20,
                              fontweight: FontWeight.bold,
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "مشرف الطفل",
                              color: primaryColor,
                              fontSize: 20,
                              fontweight: FontWeight.bold,
                            ),
                            CustomText(
                              text: " حماده",
                              color: primaryColor,
                              fontSize: 20,
                              fontweight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // تابع الحضانه
            ],
          ),
        ),
      ),
    );
  }
}
