import 'dart:async';

import 'package:ceiba_app/domain/entities/user.dart';
import 'package:ceiba_app/domain/repositories/users_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GetUsersUseCase extends UseCase<GetUsersCaseResponse,GetUsersUseCaseParams>{
  final UsersRepository usersRepository;
  GetUsersUseCase(this.usersRepository);
  @override
  Future<Stream<GetUsersCaseResponse>> buildUseCaseStream(GetUsersCaseResponseparams) async{
    final controller = StreamController<GetUsersCaseResponse>();
    try{
      final users = await usersRepository.getAllUsers();

      controller.add(GetUsersCaseResponse(users));
      logger.finest('GetUsersCase successful.');
      controller.close();
    }catch (e){
      logger.severe('GetUsersCase unsuccessful.');
      controller.addError(e);
    }
    return controller.stream;
  }

}
class GetUsersUseCaseParams {
  GetUsersUseCaseParams();
}

class GetUsersCaseResponse{
  final List<User> users;
  GetUsersCaseResponse(this.users);
}