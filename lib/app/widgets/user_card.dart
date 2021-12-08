import 'package:ceiba_app/domain/entities/user.dart';
import 'package:ceiba_app/global.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key,required this.user}) : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.85;
    double height = MediaQuery.of(context).size.width * 0.25;
    return SizedBox(
      child: Material(
        borderRadius: BorderRadius.circular(5.0),
        elevation:5,
        child: ClipPath(
          clipper: ShapeBorderClipper(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            )
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(left:16,right:16),
                //width: width,
                height: height,
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(user.name,style: TextStyle(
                      color: titleColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),),
                    Row(
                      children: [
                        Icon(Icons.phone,color: titleColor,),
                        Text(user.phone),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.mail,color: titleColor,),
                        Text(user.email),
                      ],
                    ),
                  ],
                )
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 32,right:16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  //mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      onTap: (){
                        print("details");
                      },
                      child: Text('VER PUBLICACIONES',style: TextStyle(
                        color: titleColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      )),
                    ),
                  ],
                ),
              )
            ],
          )
        ),
      )
    );
  }
}