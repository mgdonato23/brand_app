import 'package:flutter_app/data/datasource/remote_data_source.dart';
import 'package:flutter_app/domain/entities/post.dart';
import 'package:flutter_app/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final RemoteDataSource remoteDataSource;

  PostRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Post>> getPosts() async {
    return await remoteDataSource.getPosts();
  }
}
