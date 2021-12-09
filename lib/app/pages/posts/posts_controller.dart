import 'package:ceiba_app/app/pages/posts/posts_presenter.dart';
import 'package:ceiba_app/domain/entities/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class PostsController extends Controller{
  
  final PostsPresenter postsPresenter;
  List<Post> _posts;
  List<Post> get posts => _posts;
  PostsController(usersRepo):
    _posts=[],
    postsPresenter=PostsPresenter(usersRepo),
    super();

  @override
  void initListeners() {
    postsPresenter.getUserPostsOnNext = (List<Post> posts){
      _posts = posts;
      refreshUI();
    };
    postsPresenter.getUserPostsOnComplete = (){
      refreshUI();
    };
    postsPresenter.getUserPostsOnError = (e){
      print('Could not retrieve user.');
      ScaffoldMessenger.of(getContext())
          .showSnackBar(SnackBar(content: Text(e.message)));
      _posts = [];
      refreshUI();
    };
  }
  void getUserPosts(int id) => postsPresenter.getPosts(id);
  @override
  void onDisposed() {
    postsPresenter.dispose(); // don't forget to dispose of the presenter
    super.onDisposed();
  }
}