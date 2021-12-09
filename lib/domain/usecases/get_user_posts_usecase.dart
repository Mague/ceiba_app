
import 'dart:async';

import 'package:ceiba_app/domain/entities/post.dart';
import 'package:ceiba_app/domain/repositories/users_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GetUserPostsUseCase extends UseCase<GetUserPostsUseCaseResponse,GetUserPostsUseCaseParams>{
  final UsersRepository userRepository;
  GetUserPostsUseCase(this.userRepository);

  @override
  Future<Stream<GetUserPostsUseCaseResponse>> buildUseCaseStream(
      GetUserPostsUseCaseParams? params) async {
    final controller = StreamController<GetUserPostsUseCaseResponse>();
    try{
      final posts=await userRepository.getUserPosts(params!.id);
      controller.add(GetUserPostsUseCaseResponse(posts));
      logger.finest('GetUserPostsUseCase successful.');
    }catch (e){
      logger.severe('GetUserPostsUseCase unsuccessful.');
      controller.addError(e);
    }
     return controller.stream;
  }
}

class GetUserPostsUseCaseParams{
  final int id;
  GetUserPostsUseCaseParams(this.id);
}

class GetUserPostsUseCaseResponse{
  final List<Post> posts;
  GetUserPostsUseCaseResponse(this.posts);
}