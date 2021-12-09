import 'package:ceiba_app/app/pages/home/home_presenter.dart';
import 'package:ceiba_app/domain/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomeController extends Controller{
  
  User? _user;
  List<User> _users;
  List<User> _filterUsers=[];
  List<User> _usersTemp =[];
  String filter="";
  User? get user => _user; // data used by the View
  List<User> get users => _users; // data used by the View
  final HomePresenter homePresenter;

  HomeController(usersRepo)
      : _users = [],
        homePresenter = HomePresenter(usersRepo),
        super();

  @override
  void initListeners() {
    homePresenter.getUserOnNext = (User user) {
      print(user.toString());
      _user = user;
      refreshUI(); // Refreshes the UI manually
    };
    homePresenter.getUserOnComplete = () {
      print('User retrieved');
      refreshUI();
    };
    homePresenter.getUsersOnComplete = () {
      print('Users retrieved');
      _usersTemp= users;
      refreshUI();
    };

    homePresenter.getUsersOnNext = (List<User> users){
      print(user.toString());
      _users = users;
      refreshUI();
    };
    // On error, show a snackbar, remove the user, and refresh the UI
    homePresenter.getUserOnError = (e) {
      print('Could not retrieve user.');
      ScaffoldMessenger.of(getContext())
          .showSnackBar(SnackBar(content: Text(e.message)));
      _user = null;
      refreshUI(); // Refreshes the UI manually
    };
    homePresenter.getUsersOnError = (e) {
      print('Could not retrieve user.');
      ScaffoldMessenger.of(getContext())
          .showSnackBar(SnackBar(content: Text(e.message)));
      _user = null;
      refreshUI(); // Refreshes the UI manually
    };
  }
  void getUser() => homePresenter.getUser(1);
  void getUsers(){
    if(users.isEmpty){
      homePresenter.getUsers();
    }
  }
  void getUserwithError() => homePresenter.getUser(1);

  void buttonPressed() {
    
    refreshUI();
  }
  void filterUsers(String str){
    List<User> filterUsers =[];
    
    for (var i = 0; i < _usersTemp.length; i++) {
      if(_usersTemp[i].name.toLowerCase().startsWith(str.toLowerCase())){
        filterUsers.add(_usersTemp[i]);
      }
    }
    if(str.isNotEmpty){
      _users=filterUsers;
    }else{
      _users=_usersTemp;
    }
    refreshUI();
  }
  @override
  void onResumed() => print('On resumed');

  @override
  void onReassembled() => print('View is about to be reassembled');

  @override
  void onDeactivated() => print('View is about to be deactivated');

  @override
  void onDisposed() {
    homePresenter.dispose(); // don't forget to dispose of the presenter
    super.onDisposed();
  }
}