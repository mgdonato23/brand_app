import 'package:flutter_app/domain/entities/post.dart';

// PostModel é uma extensão da entidade Post, adaptada para o uso em camadas de dados
class PostModel extends Post {
  // Construtor que chama o construtor da superclasse Post
  PostModel({required super.id, required super.title, required super.body});

  // Factory method para criar uma instância de PostModel a partir de um mapa JSON
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'], // Atribui o valor 'id' do JSON ao parâmetro 'id' da superclasse Post
      title: json['title'], // Atribui o valor 'title' do JSON ao parâmetro 'title' da superclasse Post
      body: json['body'], // Atribui o valor 'body' do JSON ao parâmetro 'body' da superclasse Post
    );
  }
}
