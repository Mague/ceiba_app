import 'package:ceiba_app/app/pages/home/home_controller.dart';
import 'package:ceiba_app/app/widgets/person_text_field.dart';
import 'package:ceiba_app/app/widgets/user_list.dart';
import 'package:ceiba_app/data/repositories/data_users_repository.dart';
import 'package:ceiba_app/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomePage extends View {
  HomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ViewState<HomePage,HomeController> {
  _HomePageState() : super(HomeController(DataUsersRepository()));
  
  
  @override
  Widget get view{
    return Scaffold(
      appBar:AppBar(
        backgroundColor: appColor,
        title:Text(widget.title),
      ),
      key: globalKey,
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ControlledWidgetBuilder<HomeController>(
              builder: (context, controller) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: PersonTextField(
                    inputText: 'Buscar Usuario',
                    controller:null,
                    inputFormatter: FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
                    onChanged: (e){
                      controller.filterUsers(e);
                    },
                  ),
                );
                
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ControlledWidgetBuilder<HomeController>(
              builder: (context, controller) {
                controller.getUsers();
                if(controller.users.isEmpty && controller.usersTemp.isEmpty){
                  return const CircularProgressIndicator(
                    backgroundColor: Colors.greenAccent,
                  );
                }else if(controller.users.isNotEmpty){
                  return UserList(users: controller.users);
                }else{
                  return const Center(
                    child: Text("List is empty"),
                  );
                }
              },
            ),
            
          ]
        ),
      ),
    );
  }
}