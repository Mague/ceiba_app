import 'package:ceiba_app/app/widgets/card.dart';
import 'package:ceiba_app/domain/entities/post.dart';
import 'package:flutter/material.dart';
import 'package:ceiba_app/global.dart';

class PostCard extends StatelessWidget {
  const PostCard({Key? key,required this.post}) : super(key: key);
  final Post post;

  
  @override
  Widget build(BuildContext context) {
    return GenericCard(children:bodyData(context)) ;
  }
  List<Widget> bodyData(BuildContext context){
    return [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(post.title,style:TextStyle(
            color: titleColor,
            fontSize: 18,
          )
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(
          bottom:16.0,
          left:16.0,
          right:16.0,
        ),
        child: Text(
          post.body,
          textAlign: TextAlign.justify,
        ),
      )
    ];
  }
}