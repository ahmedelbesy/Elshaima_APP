import 'package:elshaima/shared/styles/colors.dart';
import 'package:flutter/material.dart';

Widget defaultButton({
  double wid = double.infinity,
  double r = 10.0,
  @required String text,
  double fontSize,
  Color color,
  Color back = Colors.blue,
  @required Function function,
}) =>
    MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),
        //    padding: EdgeInsets.all(4),
        onPressed: function,
        color: primaryColor,
        child: CustomText(
          text: text,
          fontweight: FontWeight.bold,
          alignment: Alignment.center,
          fontSize: fontSize,
          color: color,
        ));

Widget defaultFormField({
  @required controller,
  hint = '',
  @required type,
  Function onType,
  isPassword = false,
  Icon suffixIcon,
  IconData prefixIcon,
  @required Function onFieldSubmitted,
  @required Function onpressedPrefix,
  @required Function validator,
}) =>
    TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onChanged: onType,
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: primaryColor),
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
        suffixIcon: suffixIcon,
        prefixIcon: GestureDetector(
          onTap: onpressedPrefix,
          child: Icon(
            prefixIcon,
            color: Colors.grey,
          ),
        ),
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: BorderSide(color: primaryColor, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300, width: 2.0),
          borderRadius: BorderRadius.circular(9),
        ),
      ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

Widget buildSeparator() => Container(
      height: 1.0,
      width: double.infinity,
      color: Colors.grey[300],
    );

// ignore: non_constant_identifier_names
Widget CustomText({
  String text,
  double fontSize,
  Color color,
  Alignment alignment,
  FontWeight fontweight,
  String fontFamily,
}) =>
    Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: fontweight,
          fontFamily: fontFamily,
        ),
        textDirection: TextDirection.rtl,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (Route<dynamic> route) => false,
    );
