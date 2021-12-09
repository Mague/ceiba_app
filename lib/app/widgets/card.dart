import 'package:flutter/material.dart';

class GenericCard extends StatelessWidget {
  const GenericCard({Key? key,this.children}) : super(key: key);
  final children;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Material(
      borderRadius: BorderRadius.circular(5.0),
      elevation: 5,
      child: ClipPath(
          clipper: ShapeBorderClipper(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:children,
          )),
    ));
  }
}