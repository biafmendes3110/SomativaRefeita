import 'dart:math';

import 'package:flutter/material.dart';
import 'contador.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Método para construir a interface do aplicativo
    return Scaffold(
        // Retorna um Scaffold, que é uma estrutura básica de tela
        appBar: AppBar(
          // Define uma AppBar na parte superior da tela
          title: const Text('Tela imc'), // Título da AppBar
          centerTitle: true, // Centraliza o título
          backgroundColor: Colors.amber, // Cor de fundo da AppBar
        ),
        body: Center(
          // Define o corpo da tela centralizado
          child: ElevatedButton(
              // Botão elevado
              child: const Text('Leva pra tela de contador'), // Texto do botão
              onPressed: () {
                // Ação quando o botão é pressionado
                Navigator.pushNamed(
                    // Navega para uma tela nomeada
                    context, // Contexto do aplicativo
                    '/contador' // Nome da rota para a tela de contador
                    );
              }),
        ));
  }
}

class Imc extends StatefulWidget {
  const Imc({super.key});

  @override
  State<Imc> createState() =>
      _ImcPageState(); // Criação do estado para a classe Imc
}

class _ImcPageState extends State<Imc> {
  // Estado para a classe Imc
  TextEditingController pesoController =
      new TextEditingController(); // Controlador para o campo de entrada de peso
  TextEditingController alturaController =
      new TextEditingController(); // Controlador para o campo de entrada de altura
  String _textoInfo =
      "Informe seus dados"; // String para exibir informações do IMC

  void _limpar_tela() {
    // Método para limpar os campos de entrada e redefinir o texto informativo
    pesoController.text = ""; // Limpa o campo de entrada de peso
    alturaController.text = ""; // Limpa o campo de entrada de altura
    setState(() {
      // Atualiza o estado
      _textoInfo = "Informe seus dados"; // Define o texto informativo padrão
    });
  }

  void _calcular_Imc() {
    // Método para calcular o IMC e exibir o resultado
    setState(() {
      // Atualiza o estado
      double peso = double.parse(pesoController
          .text); // Converte o texto do campo de entrada de peso para um número
      double altura = double.parse(alturaController
          .text); // Converte o texto do campo de entrada de altura para um número

      double imc = peso / pow((altura / 100), 2); // Calcula o IMC

      if (imc < 16.5) {
        // Verifica a faixa de IMC e atribui a mensagem correspondente
        _textoInfo = "Desnutrido (${imc})";
      } else if (imc <= 18.5) {
        _textoInfo = "Abaixo do peso (${imc})";
      } else if (imc <= 24.9) {
        _textoInfo = "Peso ideal (${imc})";
      } else if (imc <= 29.9) {
        _textoInfo = "Sobre peso (${imc})";
      } else if (imc <= 34.9) {
        _textoInfo = "Obesidade grau 1(${imc})";
      } else if (imc <= 39.9) {
        _textoInfo = "Obesidade grau 2(${imc})";
      } else {
        _textoInfo = "Obesidade grau 3(${imc})";
      }
    });
  }

  @override
  @override
  Widget build(BuildContext context) {// Método para construir a interface do aplicativo
    return Scaffold(// Retorna um Scaffold, que é uma estrutura básica de tela
      appBar: AppBar(// Define uma AppBar na parte superior da tela
        title: Text("Calculadora IMC"), // Título da AppBar
        centerTitle: true, // Centraliza o título
        backgroundColor: Colors.teal, // Cor de fundo da AppBar
        actions: <Widget>[ // Lista de ações na AppBar
          IconButton(// Ícone de botão na AppBar
              onPressed: _limpar_tela, // Ação quando o botão é pressionado
              icon: Icon(Icons.refresh) // Ícone do botão de atualização
              )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Icon(
                Icons.person_outline,
                size: 120.0,
                color: Colors.teal,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "PESO(Kg)",
                    labelStyle: TextStyle(color: Colors.teal)),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0),
                controller: pesoController,
              ),
              //Segundo input para a altura
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "ALTURA(CM)",
                    labelStyle: TextStyle(color: Colors.teal)),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0),
                controller: alturaController,
              ),
              //Botão para executar o calculo do imc
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: SizedBox(
                  height: 50.0,
                  child: ElevatedButton(
                      onPressed: _calcular_Imc, child: const Text("Calcular")),
                ),
              ),
              Text(
                _textoInfo,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.teal, fontSize: 25.0),
              ),
            ]),
      ),
    );
  }
}
