import 'dart:convert';

import 'package:flutter_app/data/models/post_model.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<List<PostModel>> getPosts();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpl({required this.client});

  @override
  Future<List<PostModel>> getPosts() async {
    try {
      final response = await client.get(Uri.parse(
          'http://192.168.X.XXX:3000/posts')); //TODO ALTERAR IP PARA O IP DA SUA MÁQUINA
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        return jsonResponse.map((post) => PostModel.fromJson(post)).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('Falha ao buscar os posts!\nERRO: $e');
    }
  }
}
