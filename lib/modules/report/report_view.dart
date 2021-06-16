
import 'package:elshaima/modules/home/home_view.dart';
import 'package:elshaima/shared/components/components.dart';

import 'package:elshaima/shared/styles/colors.dart';

import 'package:flutter/material.dart';



class ReportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar:PreferredSize(
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
                    text: "التقرير الشهري",
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
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: ListView(

          children: [
            Container(
              height: height*0.3,
              child: Card(
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none
                ),
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: kColor,
                          radius: 30,
                          child: Icon(Icons.report,color: Colors.white,size: 30,)),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(text: "4",fontSize: 25,fontweight: FontWeight.bold,color: primaryColor,),
                          CustomText(text: "عدد ايام الغياب",fontSize: 25,fontweight: FontWeight.bold,color: primaryColor,),

                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(text: "جيد",fontSize: 25,fontweight: FontWeight.bold,color: primaryColor,),
                          CustomText(text: "مستوي الطفل",fontSize: 25,fontweight: FontWeight.bold,color: primaryColor,),
                        ],
                      ),
                    ],
                  ),
                ),

              ),
            ),

            Container(
              height: height*0.22,
              child: Card(
                elevation: 1,
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(text: "١/٢/٢٠٢١ ",fontSize: 25,fontweight: FontWeight.bold,color: primaryColor,),
                          CustomText(text: "سداد الشهر ",fontSize: 25,fontweight: FontWeight.bold,color: primaryColor,),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(text: "تم الدفع ",fontSize: 25,fontweight: FontWeight.bold,color: Colors.green,),

                          CustomText(text: "حاله الدفع",fontSize: 25,fontweight: FontWeight.bold,color: primaryColor,),
                        ],
                      ),


                    ],
                  ),
                ),
              ),
            ),









          ],
        ),
      ),
    );
  }
}
