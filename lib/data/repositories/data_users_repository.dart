import 'package:ceiba_app/domain/entities/address.dart';
import 'package:ceiba_app/domain/entities/company.dart';
import 'package:ceiba_app/domain/entities/geo.dart';
import 'package:ceiba_app/domain/entities/user.dart';
import 'package:ceiba_app/domain/repositories/users_repository.dart';
import 'package:ceiba_app/global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class DataUsersRepository extends UsersRepository {
  List<User> users=[];

  static final DataUsersRepository _instance = DataUsersRepository._internal();
  DataUsersRepository._internal() {
    users = <User>[];
    Geo geo=Geo('-37.3159', '81.1496');
    Address address = Address(
      'Kulas Light','Apt. 556','Gwenborough','92998-3874', geo
    );

    Company company = Company("Romaguera-Crona","Multi-layered client-server neural-net","harness real-time e-markets");
    users.addAll([
      User(
        1, 'Leanne Graham', 'Bret',
        'Sincere@april.biz',address,
        '1-770-736-8031 x56442','hildegard.org',
        company
      )
    ]);
    
  }

  factory DataUsersRepository() => _instance;
  
  @override
  Future<List<User>> getAllUsers() async{
    var response = await http.get(
        Uri.parse(apiUsers));
    List<User> users=[];
    if(response.statusCode == 200){
      var body = response.body;
      List<dynamic> jsonResponse = convert.jsonDecode(body);
			
      for (var i = 0; i < jsonResponse.length; i++) {
        print(jsonResponse[i]);
        User data = User.fromJson(jsonResponse[i]);
        users.add(data);
      }
    }else{
			print('Request failed with status: ${response.statusCode}.');
    }
    return users;
  }

  @override
  Future<User> getUser(int id) async {
     return users.firstWhere((user) => user.id == id);
  }
  
}