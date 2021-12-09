import 'package:ceiba_app/domain/entities/address.dart';
import 'package:ceiba_app/domain/entities/company.dart';
import 'package:ceiba_app/domain/entities/geo.dart';
import 'package:ceiba_app/domain/entities/post.dart';
import 'package:ceiba_app/domain/entities/user.dart';
import 'package:ceiba_app/domain/repositories/users_repository.dart';
import 'package:ceiba_app/global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DataUsersRepository extends UsersRepository {
  List<User> users=[];
  final box = GetStorage('ceiba_app');
  Map storageUserList = {};
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
    List<User> users=[];
    //box.erase();
    users=await restoreUsers();
    if(users.isEmpty){
      var response = await http.get(
          Uri.parse(apiUsers));
      if(response.statusCode == 200){
        var body = response.body;
        List<dynamic> jsonResponse = convert.jsonDecode(body);
        
        for (var i = 0; i < jsonResponse.length; i++) {
          User data = User.fromJson(jsonResponse[i]);
          users.add(data);
        }
        addAndStorageUsers(users);
      }else{
        print('Request failed with status: ${response.statusCode}.');
      }
    }
    return users;
  }

  @override
  Future<User> getUser(int id) async {
     return users.firstWhere((user) => user.id == id);
  }

  @override
  Future<List<Post>> getUserPosts(int id) async{
    List<Post> posts = [];
    posts=await restorePost(id);
    if(posts.isEmpty){
      var response = await http.get(
        Uri.parse(apiPostByUser+id.toString())
      );

      if(response.statusCode==200){
        var body = response.body;
        List<dynamic> jsonResponse = convert.jsonDecode(body);

        for(var i=0;i<jsonResponse.length;i++) {
          Post post=Post.fromJson(jsonResponse[i]);
          posts.add(post);
        }
        addAndStorageUserPost(posts);
      }
    }
    return posts;
  }
  void addAndStorageUsers(List<User> users) async{
    
    
    for(var i=0;i<users.length;i++){
      Map storageMap = {};
      User user=users[i];
      storageMap['id']=user.id;
      storageMap['name']=user.name;
      storageMap['userName']=user.userName;
      storageMap['email']=user.email;
      storageMap['phone']=user.phone;
      storageMap['website']=user.website;
      storageMap['address']=user.address.toJson();
      storageMap['company']=user.company.toJson();
      storageUserList[user.id.toString()] = storageMap;
    }
    await box.write('users', storageUserList);
  }
  void addAndStorageUserPost(List<Post> posts) async{
    
    Map storageUserPostsList = {};
    for(var i=0;i<posts.length;i++){
      Map storageMap = {};
      Post post=posts[i];
      storageMap['id']=post.id;
      storageMap['userId']=post.userId;
      storageMap['title']=post.title;
      storageMap['body']=post.body;
      
      storageUserPostsList[post.id.toString()+"_"+post.userId.toString()] = storageMap;
    }
    await box.write('posts', storageUserPostsList);
  }
  Future<List<User>> restoreUsers() async{
    
    storageUserList = box.read("users") != null ? box.read("users") : {};
    List<User> _users = [];
    if(storageUserList.isNotEmpty){
      var storageMapEntries= storageUserList.entries;
      for (int i = 0; i < storageMapEntries.length; i++) {
        MapEntry tokenMap = storageMapEntries.elementAt(i);
        var user = tokenMap.key;
        var values = tokenMap.value;
        print(values);
        if (values['name'].length > 0) {
          User userTemp = User(
            values['id'],
            values['name'],
            values['userName'],
            values['email'],
            Address.fromJson(values['address']),
            values['phone'],
            values['website'],
            Company.fromJson(values['company'])
          );
          _users.add(userTemp);
        }
      }
    }
    return _users;
  }
  
  Future<List<Post>> restorePost(int id) async{
    
    storageUserList = box.read("posts") ?? {};
    List<Post> _posts = [];
    if(storageUserList.isNotEmpty){
      var storageMapEntries= storageUserList.entries;
      for (int i = 0; i < storageMapEntries.length; i++) {
        MapEntry tokenMap = storageMapEntries.elementAt(i);
        
        var key = tokenMap.key;
        var values = tokenMap.value;
        var postId=values["id"];
        String find='${postId}_$id';
        bool isEqual=(key==find)?true:false;
        
        if (isEqual) {
          Post postTemp = Post(
            values['userId'],
            values['id'],
            values['title'],
            values['body'],
          );
          _posts.add(postTemp);
        }
      }
    }
    return _posts;
  }
}