import 'package:elshaima/modules/login/login_view.dart';
import 'package:elshaima/modules/child/child_view.dart';
import 'package:elshaima/shared/components/components.dart';
import 'package:elshaima/shared/components/widgets/custom_drawer.dart';
import 'package:elshaima/shared/network/local/chach_helper.dart';
import 'package:elshaima/shared/styles/colors.dart';

import 'package:flutter/material.dart';

import '../notification/notifications_view.dart';

import '../report/report_view.dart';
import '../profile/profile_view.dart';

class Drawe_view extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(top: height * 0.15, left: 30),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (ctx) => ChildScreen())),
            child: Custom_Drawer_Icons(
              icon: Icon(
                Icons.home_work,
                color: kColor,
              ),
              name: "الطفل",
              colortext: primaryColor,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (ctx) => ProfileScreen())),
            child: Custom_Drawer_Icons(
              icon: Icon(
                Icons.person,
                color: kColor,
              ),
              name: "الملف الشخصي",
              colortext: primaryColor,
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (ctx) => Notifications_View())),
            child: Custom_Drawer_Icons(
              icon: Icon(
                Icons.notification_important,
                color: kColor,
              ),
              name: "الاشعارات",
              colortext: primaryColor,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (ctx) => ReportsScreen())),
            child: Custom_Drawer_Icons(
              icon: Icon(
                Icons.report,
                color: kColor,
              ),
              name: "التقرير الشهري",
              colortext: primaryColor,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(right: 20),
            color: Colors.grey,
            height: 1,
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              CacheHelper.removeData(key: "token").then((value){
                if(value){
                  navigateAndFinish(context,LoginScreen());
                }
              });
            },
               
            child: Custom_Drawer_Icons(
              icon: Icon(
                Icons.logout,
                color: primaryColor,
              ),
              name: "تسجيل الخروج",
              colortext: kColor,
            ),
          ),
        ],
      ),
    );
  }
}
