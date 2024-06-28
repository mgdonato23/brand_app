import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/pages/home_page.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

// Página de login da aplicação
class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Chave global para o formulário de login

  LoginPage({super.key}); // Construtor da classe LoginPage

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Form(
          key: _formKey, // Define a chave global para o formulário
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'LOGIN',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ), // Título da página de login
              const SizedBox(height: 20), // Espaçamento entre elementos
              Observer(
                builder: (_) => TextFormField(
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
              const SizedBox(height: 10), // Espaçamento entre elementos
              Observer(
                builder: (_) => TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Senha: ',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true, // Esconde o texto da senha
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return 'Senha deve ter pelo menos 6 caracteres';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20), // Espaçamento entre elementos
              Observer(
                builder: (_) => ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState?.validate() ?? false) {// Valida o formulário antes de tentar fazer login
                      Navigator.pushReplacement(// Navega para a HomePage se o login for bem-sucedido
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Credenciais inválidas!'), // Exibe um snackbar se as credenciais forem inválidas
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
