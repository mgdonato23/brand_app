import 'package:flutter_app/domain/entities/post.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts();
}
