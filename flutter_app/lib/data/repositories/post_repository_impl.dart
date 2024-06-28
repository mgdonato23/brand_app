import 'package:flutter_app/data/datasource/remote_data_source.dart';
import 'package:flutter_app/domain/entities/post.dart';
import 'package:flutter_app/domain/repositories/post_repository.dart';

// Implementação concreta da interface PostRepository
class PostRepositoryImpl implements PostRepository {
  final RemoteDataSource remoteDataSource;

  // Construtor que requer uma instância de RemoteDataSource para funcionar
  PostRepositoryImpl({required this.remoteDataSource});

  // Método que implementa a função de obter posts da interface PostRepository
  @override
  Future<List<Post>> getPosts() async {
    return await remoteDataSource.getPosts(); // Chama o método getPosts da fonte de dados remota
  }
}
