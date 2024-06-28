import 'package:flutter_app/domain/entities/post.dart';
import 'package:flutter_app/domain/repositories/post_repository.dart';
import 'package:mobx/mobx.dart';

part 'post_store.g.dart';

class PostStore = _PostStore with _$PostStore;

abstract class _PostStore with Store {
  final PostRepository postRepository;

  _PostStore(this.postRepository);

  @observable
  ObservableFuture<List<Post>>? postsFuture;

  @observable
  String filter = '';

  @observable
  ObservableList<Post> filteredPosts = ObservableList<Post>();

  @action
  Future<void> fetchPosts() async {
    postsFuture = ObservableFuture(postRepository.getPosts());
    final posts = await postsFuture;
    filteredPosts = ObservableList<Post>.of(posts ?? []);
    applyFilter();
  }

  @action
  void setFilter(String value) {
    filter = value;
    applyFilter();
  }

  @action
  void applyFilter() {
    if (filter.isEmpty) {
      filteredPosts = ObservableList<Post>.of(postsFuture?.value ?? []);
    } else {
      filteredPosts = ObservableList<Post>.of(
        postsFuture?.value?.where((post) => post.title.toLowerCase().contains(filter.toLowerCase())) ?? [],
      );
    }
  }
}
