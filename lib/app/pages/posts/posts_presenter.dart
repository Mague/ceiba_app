import 'package:ceiba_app/domain/usecases/get_user_posts_usecase.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class PostsPresenter extends Presenter{
  Function? getUserPostsOnComplete;
  Function? getUserPostsOnError;
  Function? getUserPostsOnNext;

  final GetUserPostsUseCase getUserPostsUseCase;

  PostsPresenter(userRepo):
    getUserPostsUseCase = GetUserPostsUseCase(userRepo);

  void getPosts(int id){
    getUserPostsUseCase.execute(
      _GetUserPostsUseCaseObserver(this), GetUserPostsUseCaseParams(id)
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
  }

}

class _GetUserPostsUseCaseObserver extends Observer<GetUserPostsUseCaseResponse> {
  final PostsPresenter presenter;
  _GetUserPostsUseCaseObserver(this.presenter);

  @override
  void onComplete() {
    assert(presenter.getUserPostsOnComplete!=null);
    presenter.getUserPostsOnComplete!();
  }

  @override
  void onError(e) {
    assert(presenter.getUserPostsOnError != null);
    presenter.getUserPostsOnError!(e);
  }

  @override
  void onNext(GetUserPostsUseCaseResponse? response) {
    assert(presenter.getUserPostsOnNext != null);
    presenter.getUserPostsOnNext!(response!.posts);
  }

  
}