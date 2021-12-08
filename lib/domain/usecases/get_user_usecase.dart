import 'dart:async';


import 'package:ceiba_app/domain/entities/user.dart';
import 'package:ceiba_app/domain/repositories/users_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GetUserUseCase
    extends UseCase<GetUserUseCaseResponse, GetUserUseCaseParams> {
  final UsersRepository usersRepository;
  GetUserUseCase(this.usersRepository);

  @override
  Future<Stream<GetUserUseCaseResponse>> buildUseCaseStream(
      GetUserUseCaseParams? params) async {
    final controller = StreamController<GetUserUseCaseResponse>();
    try {
      // get user
      final user = await usersRepository.getUser(params!.id);
      // Adding it triggers the .onNext() in the `Observer`
      // It is usually better to wrap the reponse inside a respose object.
      controller.add(GetUserUseCaseResponse(user));
      logger.finest('GetUserUseCase successful.');
      controller.close();
    } catch (e) {
      logger.severe('GetUserUseCase unsuccessful.');
      // Trigger .onError
      controller.addError(e);
    }
    return controller.stream;
  }
}

/// Wrapping params inside an object makes it easier to change later
class GetUserUseCaseParams {
  final int id;
  GetUserUseCaseParams(this.id);
}

/// Wrapping response inside an object makes it easier to change later
class GetUserUseCaseResponse {
  final User user;
  GetUserUseCaseResponse(this.user);
}