import 'package:ceiba_app/app/pages/posts/posts_view.dart';
import 'package:ceiba_app/app/widgets/card.dart';
import 'package:ceiba_app/app/widgets/user_info.dart';
import 'package:ceiba_app/domain/entities/user.dart';
import 'package:ceiba_app/global.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key, required this.user}) : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.85;
    double height = MediaQuery.of(context).size.width * 0.25;
    var childrens = [
      UserInfo(height: height, user: user),
      Padding(
        padding: const EdgeInsets.only(bottom: 32, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          //crossAxisAlignment: CrossAxisAlignment.end,
          //mainAxisSize: MainAxisSize.max,
          children: [
            InkWell(
              onTap: () async {
                print("details");
                final back = await Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => PostsPage(user: user),
                  ),
                );
              },
              child: Text('VER PUBLICACIONES',
                  style: TextStyle(
                      color: titleColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      )
    ];
    return GenericCard(
      children: childrens,
    );
  }
}

