import 'dart:convert';

import 'package:flutter_app/data/models/post_model.dart';
import 'package:http/http.dart' as http;

// Interface que define um contrato para a fonte de dados remota
abstract class RemoteDataSource {
  Future<List<PostModel>> getPosts();
}

// Implementação da interface RemoteDataSource que realiza chamadas HTTP para obter posts
class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpl({required this.client});

  @override
  Future<List<PostModel>> getPosts() async {
    try {
      final response = await client.get(Uri.parse(
          'http://192.168.X.XXX:3000/posts')); //TODO ALTERAR IP PARA O IP DA SUA MÁQUINA

      // Verifica se a requisição foi bem-sucedida
      if (response.statusCode == 200) {
        // Converte a resposta JSON em uma lista de objetos PostModel
        List jsonResponse = json.decode(response.body);
        return jsonResponse.map((post) => PostModel.fromJson(post)).toList();
      } else {
        return []; // Retorna uma lista vazia se não houver posts disponíveis
      }
    } catch (e) {
      throw Exception(
          'Falha ao buscar os posts!\nERRO: $e'); // Lança uma exceção em caso de erro na requisição
    }
  }
}
