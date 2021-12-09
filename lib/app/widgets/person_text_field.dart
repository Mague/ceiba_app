import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PersonTextField extends StatelessWidget {
  final String inputText;
  final String hintText;
  final controller;
  final iconButton;
  final Function(String)? onChanged;
  final FilteringTextInputFormatter inputFormatter;
  PersonTextField(
    {
      required this.inputText,
      this.hintText = '',
      this.controller,
      this.iconButton,
      required this.inputFormatter,
      this.onChanged
    }
  );
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
          labelText: this.inputText,
          suffixIcon: this.iconButton != null ? this.iconButton : null,
          
          //hintText: this.hintText
        ),
        onChanged: onChanged,
        inputFormatters:
            this.inputFormatter != null ? [this.inputFormatter] : [],
        controller: this.controller,
        validator: (value) {
          if (value!.isEmpty) {
            return "El campo no puede estar vacio";
          }
          return null;
        });
  }
}
