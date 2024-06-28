import 'package:flutter_app/domain/entities/post.dart';

// Interface que define um contrato para o repositório de posts
abstract class PostRepository {
  // Método assíncrono para obter uma lista de posts
  Future<List<Post>> getPosts();
}
