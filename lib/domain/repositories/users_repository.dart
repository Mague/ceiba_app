

import 'package:ceiba_app/domain/entities/user.dart';

abstract class UsersRepository {
  Future<User> getUser(int id);
  Future<List<User>> getAllUsers();
}
