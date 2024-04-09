import 'package:flutter/material.dart';
import 'menu.dart'; // Importando o arquivo de menu.dart
import 'imc.dart';
import 'contador.dart';
import 'cadastro_usua.dart';
import 'cadastro_prod.dart';

void main() { // Função principal que inicia o aplicativo Flutter
  runApp(const MyApp()); // Chama a função myApp para iniciar o aplicativo
}

class MyApp extends StatelessWidget { // Classe MyApp, que é um StatelessWidget
  const MyApp({super.key}); // Construtor para a classe MyApp

  @override
  Widget build(BuildContext context) { // Método build para construir a interface do aplicativo
    return MaterialApp( // Retorna um MaterialApp, que é a raiz do aplicativo Flutter
      debugShowCheckedModeBanner: false, // Define para não mostrar o banner de debug no canto superior direito
      home: Menu(), // Define a tela inicial do aplicativo como a tela Menu()
    );
  }
}
