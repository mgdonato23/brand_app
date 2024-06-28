import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  bool isLoggedIn = false;

  @action
  void setEmail(String value) {
    email = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  Future<void> login() async {
    if (email.contains('@') && password.length >= 6) {
      isLoggedIn = true;
    } else {
      throw Exception('Invalid credentials');
    }
  }
}
