import 'package:flutter/material.dart';

import 'login_page.dart';

// Classe principal que configura e inicializa o aplicativo
class App extends StatelessWidget {
  const App({super.key}); // Construtor da classe App

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Desativa a faixa de debug no canto superior direito
      title: 'Brand APP', // Título do aplicativo
      theme: ThemeData(
        primarySwatch: Colors.blue, // Define a cor primária do tema como azul
      ),
      home: LoginPage(), // Define a tela inicial do aplicativo como LoginPage
    );
  }
}
