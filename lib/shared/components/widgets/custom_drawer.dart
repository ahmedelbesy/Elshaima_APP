import 'package:flutter/material.dart';


import '../components.dart';


// ignore: camel_case_types
class Custom_Drawer_Icons extends StatelessWidget {
  final String name;
  final Icon icon;

  final Color colortext;

  Custom_Drawer_Icons({this.name, this.icon,this.colortext});

  @override
  Widget build(BuildContext context) {


    return Column(
      children: [
        Row(
          children: [

           IconButton(icon: icon,),
            CustomText(

              text: name,
              color: colortext,
              fontSize: 20,
              fontweight: FontWeight.w900,
            ),
          ],
        ),
      ],
    );
  }
}
