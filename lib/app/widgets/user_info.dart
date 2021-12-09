import 'package:ceiba_app/domain/entities/user.dart';
import 'package:ceiba_app/global.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key? key,
    required this.height,
    required this.user,
  }) : super(key: key);

  final double height;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 16, right: 16),
        //width: width,
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              user.name,
              style: TextStyle(
                  color: titleColor, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Icon(
                  Icons.phone,
                  color: titleColor,
                ),
                Text(user.phone),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.mail,
                  color: titleColor,
                ),
                Text(user.email),
              ],
            ),
          ],
        ));
  }
}
