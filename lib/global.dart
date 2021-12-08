import 'package:flutter/material.dart';

//string
final String dataSource="https://jsonplaceholder.typicode.com";
final String apiUsers=dataSource+"/users";
final String apiPost=dataSource+"/posts";
final String apiPostByUser=dataSource+"/posts?userId=";
//theme
Color appColor=Color.fromRGBO(42, 95, 46, 1);
Color titleColor=Color.fromRGBO(70, 105, 71, 1);
Color backgroundColor=Color.fromRGBO(244,245,242,1);
ThemeData themeOne = ThemeData(
  primaryColor: appColor,
  backgroundColor: backgroundColor,
  scaffoldBackgroundColor: backgroundColor,
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(
      color: appColor,
    ),
    focusedBorder: UnderlineInputBorder(
      // width: 0.0 produces a thin "hairline" border
      borderSide: BorderSide(color: appColor, width: 0.0),
    ),
    
    enabledBorder: UnderlineInputBorder(
      // width: 0.0 produces a thin "hairline" border
      borderSide: BorderSide(color: appColor, width: 0.0),
    )
  ),
);
