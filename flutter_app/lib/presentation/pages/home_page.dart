import 'package:flutter/material.dart';
import 'package:flutter_app/data/datasource/remote_data_source.dart';
import 'package:flutter_app/data/repositories/post_repository_impl.dart';
import 'package:flutter_app/presentation/pages/login_page.dart';
import 'package:flutter_app/presentation/stores/post_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

class HomePage extends StatelessWidget {
  final PostStore postStore = PostStore(
    PostRepositoryImpl(
      remoteDataSource: RemoteDataSourceImpl(client: http.Client()),
    ),
  );

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    postStore.fetchPosts();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bem-vindo!'),
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
              onChanged: (value) => postStore.setFilter(value),
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
                      return const Center(child: CircularProgressIndicator());
                    case FutureStatus.rejected:
                      return const Center(child: Text('Falha ao carregar os posts!'));
                    case FutureStatus.fulfilled:
                      final posts = postStore.filteredPosts;
                      return ListView.builder(
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          final post = posts[index];
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            color: Colors.grey.shade200,
                            child: ListTile(
                              dense: true,
                              title: Text(post.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                              subtitle: Text(post.body, style: const TextStyle(fontSize: 14),),
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
