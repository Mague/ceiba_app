import 'package:ceiba_app/domain/usecases/get_user_usecase.dart';
import 'package:ceiba_app/domain/usecases/get_users_usercase.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomePresenter extends Presenter {
  Function? getUserOnNext;
  Function? getUserOnComplete;
  Function? getUserOnError;
  
  Function? getUsersOnNext;
  Function? getUsersOnComplete;
  Function? getUsersOnError;

  final GetUserUseCase getUserUseCase;
  final GetUsersUseCase getUsersUseCase;
  HomePresenter(usersRepo) : 
  getUserUseCase = GetUserUseCase(usersRepo),
  getUsersUseCase = GetUsersUseCase(usersRepo);

  void getUser(int id) {
    // execute getUseruserCase
    getUserUseCase.execute(
        _GetUserUseCaseObserver(this), GetUserUseCaseParams(id));
  }

  void getUsers(){
    getUsersUseCase.execute(
        _GetUsersUseCaseObserver(this), GetUsersUseCaseParams());
  }
  @override
  void dispose() {
    getUserUseCase.dispose();
  }
}

class _GetUserUseCaseObserver extends Observer<GetUserUseCaseResponse> {
  final HomePresenter presenter;
  _GetUserUseCaseObserver(this.presenter);
  @override
  void onComplete() {
    assert(presenter.getUserOnComplete != null);
    presenter.getUserOnComplete!();
  }

  @override
  void onError(e) {
    assert(presenter.getUserOnError != null);
    presenter.getUserOnError!(e);
  }

  @override
  void onNext(response) {
    assert(presenter.getUserOnNext != null);
    presenter.getUserOnNext!(response!.user);
  }
}

class _GetUsersUseCaseObserver extends Observer<GetUsersCaseResponse> {
  final HomePresenter presenter;
  _GetUsersUseCaseObserver(this.presenter);
  @override
  void onComplete() {
    assert(presenter.getUsersOnComplete != null);
    presenter.getUsersOnComplete!();
  }

  @override
  void onError(e) {
    assert(presenter.getUsersOnError != null);
    presenter.getUsersOnError!(e);
  }

  @override
  void onNext(response) {
    assert(presenter.getUsersOnNext != null);
    presenter.getUsersOnNext!(response!.users);
  }
}
