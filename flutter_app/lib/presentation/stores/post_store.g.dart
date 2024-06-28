// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PostStore on _PostStore, Store {
  late final _$postsFutureAtom =
      Atom(name: '_PostStore.postsFuture', context: context);

  @override
  ObservableFuture<List<Post>>? get postsFuture {
    _$postsFutureAtom.reportRead();
    return super.postsFuture;
  }

  @override
  set postsFuture(ObservableFuture<List<Post>>? value) {
    _$postsFutureAtom.reportWrite(value, super.postsFuture, () {
      super.postsFuture = value;
    });
  }

  late final _$filterAtom = Atom(name: '_PostStore.filter', context: context);

  @override
  String get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(String value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  late final _$filteredPostsAtom =
      Atom(name: '_PostStore.filteredPosts', context: context);

  @override
  ObservableList<Post> get filteredPosts {
    _$filteredPostsAtom.reportRead();
    return super.filteredPosts;
  }

  @override
  set filteredPosts(ObservableList<Post> value) {
    _$filteredPostsAtom.reportWrite(value, super.filteredPosts, () {
      super.filteredPosts = value;
    });
  }

  late final _$fetchPostsAsyncAction =
      AsyncAction('_PostStore.fetchPosts', context: context);

  @override
  Future<void> fetchPosts() {
    return _$fetchPostsAsyncAction.run(() => super.fetchPosts());
  }

  late final _$_PostStoreActionController =
      ActionController(name: '_PostStore', context: context);

  @override
  void setFilter(String value) {
    final _$actionInfo =
        _$_PostStoreActionController.startAction(name: '_PostStore.setFilter');
    try {
      return super.setFilter(value);
    } finally {
      _$_PostStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void applyFilter() {
    final _$actionInfo = _$_PostStoreActionController.startAction(
        name: '_PostStore.applyFilter');
    try {
      return super.applyFilter();
    } finally {
      _$_PostStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
postsFuture: ${postsFuture},
filter: ${filter},
filteredPosts: ${filteredPosts}
    ''';
  }
}
