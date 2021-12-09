import 'package:ceiba_app/app/widgets/post_card.dart';
import 'package:ceiba_app/app/widgets/user_card.dart';
import 'package:ceiba_app/domain/entities/post.dart';
import 'package:ceiba_app/domain/entities/user.dart';
import 'package:flutter/material.dart';

class PostList extends StatelessWidget {
  const PostList({Key? key, required this.posts}) : super(key: key);
  final List<Post> posts;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            return postCard(post);
          }),
    );
  }

  Padding postCard(Post post) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: PostCard(post:post),
    );
  }
}
