import 'package:ceiba_app/app/widgets/user_card.dart';
import 'package:ceiba_app/domain/entities/user.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key,required this.users}) : super(key: key);
  final List<User> users;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            //print("Hay {.length} productos");
            final user = users[index];
            return userCard(user);
          }),
    );
  }

  Padding userCard(User user) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: UserCard(user: user),
    );
  }
}