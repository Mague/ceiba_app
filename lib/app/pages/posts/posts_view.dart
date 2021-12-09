import 'package:ceiba_app/app/pages/posts/posts_controller.dart';
import 'package:ceiba_app/app/widgets/common_scaffold.dart';
import 'package:ceiba_app/app/widgets/post_list.dart';
import 'package:ceiba_app/app/widgets/user_info.dart';
import 'package:ceiba_app/data/repositories/data_users_repository.dart';
import 'package:ceiba_app/domain/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class PostsPage extends View {
  PostsPage({Key? key,required this.user}) : super(key: key);
  final User user;
  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends ViewState<PostsPage, PostsController> {
  _PostsPageState() : super(PostsController(DataUsersRepository()));
  
  @override
  Widget get view{
    return _scaffold(context);
  }
  Widget _scaffold(BuildContext context) {
    return CommonScafoold(
      bodyData: bodyData(context),
      title: "Publicaciones",
      key: globalKey
    );
  }

  Widget bodyData(BuildContext context) {
    double height = MediaQuery.of(context).size.width * 0.25;
    return ControlledWidgetBuilder<PostsController>(
      builder: (context, controller) {
        controller.getUserPosts(widget.user.id);
        return Center(
          child: Column(
            children: [
              UserInfo(
                user: widget.user,
                height: height,

              ),
              if(controller.posts.isNotEmpty)
                PostList(posts:controller.posts),
            ],
          ),
        );
      },
    );
  }
}