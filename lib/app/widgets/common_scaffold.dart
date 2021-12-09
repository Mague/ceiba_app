import 'package:ceiba_app/global.dart';
import 'package:flutter/material.dart';

class CommonScafoold extends StatelessWidget {
  const CommonScafoold({Key? key, this.title, required this.bodyData, this.globalKey}) : super(key: key);
  final title;
  final bodyData;
  final globalKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: appColor,
        title:Text(title),
      ),
      key: globalKey,
      backgroundColor: backgroundColor,
      body:bodyData,
    );
  }
}