import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/pages/home_page.dart';
import 'package:flutter_app/presentation/stores/login_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginPage extends StatelessWidget {
  final LoginStore loginStore = LoginStore();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('LOGIN', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Observer(
                builder: (_) => TextFormField(
                  onChanged: loginStore.setEmail,
                  decoration: const InputDecoration(
                    labelText: 'E-mail: ',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || !value.contains('@')) {
                      return 'Entre com um e-mail válido, deve conter um "@".';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 10),
              Observer(
                builder: (_) => TextFormField(
                  onChanged: loginStore.setPassword,
                  decoration: const InputDecoration(
                    labelText: 'Senha: ',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return 'Senha deve ter pelo menos 6 caracteres';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              Observer(
                builder: (_) => ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      await loginStore.login();
                      if (loginStore.isLoggedIn) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Credenciais inválidas!'),
                        ),
                      );
                    }
                  },
                  child: const Text('Entrar', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
