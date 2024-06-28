import 'package:flutter_app/domain/entities/post.dart';
import 'package:flutter_app/domain/repositories/post_repository.dart';
import 'package:mobx/mobx.dart';

part 'post_store.g.dart';

// Classe que gerencia o estado dos posts utilizando MobX
class PostStore = _PostStore with _$PostStore;

// Classe abstrata que implementa o gerenciamento de estado dos posts
abstract class _PostStore with Store {
  final PostRepository postRepository; // Repositório responsável por buscar os posts

  _PostStore(this.postRepository); // Construtor que inicializa com o repositório

  @observable
  ObservableFuture<List<Post>>? postsFuture; // Futuro observável que armazena a lista de posts

  @observable
  String filter = ''; // String observável que armazena o filtro aplicado aos posts

  @observable
  ObservableList<Post> filteredPosts = ObservableList<Post>(); // Lista observável de posts filtrados

  // Ação para buscar os posts
  @action
  Future<void> fetchPosts() async {
    postsFuture = ObservableFuture(postRepository.getPosts()); // Inicia a busca dos posts
    final posts = await postsFuture; // Aguarda a conclusão da busca
    filteredPosts = ObservableList<Post>.of(posts ?? []); // Atualiza a lista de posts filtrados com os obtidos
    applyFilter(); // Aplica o filtro atualmente definido
  }

  // Ação para definir o filtro
  @action
  void setFilter(String value) {
    filter = value; // Define o filtro com o valor fornecido
    applyFilter(); // Aplica o filtro
  }

  // Ação para aplicar o filtro aos posts
  @action
  void applyFilter() {
    if (filter.isEmpty) {
      // Se o filtro estiver vazio, mostra todos os posts
      filteredPosts = ObservableList<Post>.of(postsFuture?.value ?? []);
    } else {
      // Caso contrário, filtra os posts pelo título que contenha o texto do filtro, ignorando maiúsculas e minúsculas
      filteredPosts = ObservableList<Post>.of(
        postsFuture?.value?.where((post) =>
                post.title.toLowerCase().contains(filter.toLowerCase())) ??
            [],
      );
    }
  }
}
