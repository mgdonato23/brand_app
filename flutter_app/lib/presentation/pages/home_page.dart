import 'package:flutter/material.dart';
import 'package:flutter_app/data/datasource/remote_data_source.dart';
import 'package:flutter_app/data/repositories/post_repository_impl.dart';
import 'package:flutter_app/presentation/pages/login_page.dart';
import 'package:flutter_app/presentation/stores/post_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

// Página principal que exibe uma lista de posts filtrável
class HomePage extends StatelessWidget {
  final PostStore postStore = PostStore(
    PostRepositoryImpl(
      remoteDataSource: RemoteDataSourceImpl(client: http.Client()),
    ),
  );

  HomePage({super.key}); // Construtor da classe HomePage

  @override
  Widget build(BuildContext context) {
    postStore
        .fetchPosts(); // Chama o método para carregar os posts ao construir a página

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bem-vindo!'), // Título da barra de navegação
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (value) => postStore.setFilter(
                  value), // Define o filtro de posts pelo valor digitado
              decoration: const InputDecoration(
                labelText: 'Filtrar por Marca',
                border: OutlineInputBorder(),
              ),
            ),
            Expanded(
              child: Observer(
                builder: (_) {
                  switch (postStore.postsFuture?.status) {
                    case FutureStatus.pending:
                      return const Center(
                        child: CircularProgressIndicator(),
                      ); // Exibe indicador de carregamento se os posts estiverem sendo carregados
                    case FutureStatus.rejected:
                      return const Center(
                        child: Text('Falha ao carregar os posts!'),
                      ); // Exibe mensagem de erro se ocorrer uma falha ao carregar os posts
                    case FutureStatus.fulfilled:
                      final posts = postStore
                          .filteredPosts; // Obtém os posts filtrados pelo critério definido
                      return ListView.builder(
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          final post = posts[index];
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            color: Colors.grey.shade200,
                            child: ListTile(
                              dense: true,
                              title: Text(
                                post.title,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ), // Título do post
                              subtitle: Text(
                                post.body,
                                style: const TextStyle(fontSize: 14),
                              ), // Corpo do post
                            ),
                          );
                        },
                      );
                    default:
                      return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
