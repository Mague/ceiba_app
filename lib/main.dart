import 'package:ceiba_app/app/pages/home/home_view.dart';
import 'package:ceiba_app/global.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ceiba App',
      theme: themeOne,
      home: HomePage(title: 'Prueba de Ingreso'),
    );
  }
 
}