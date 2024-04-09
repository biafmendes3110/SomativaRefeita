import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Estrutura básica da tela
        appBar: AppBar(
          // Barra superior da tela
          title: const Text('Tela contador'), // Título da barra superior
          centerTitle: true, // Centraliza o título
          backgroundColor: Colors.blueGrey, // Cor de fundo da barra superior
        ),
        body: Center(
          // Corpo centralizado da tela
          child: ElevatedButton(
              // Botão elevado
              child: const Text('Leva pra tela de cadastro dos usuarios'),
              // Texto do botão
              onPressed: () {
                // Ação quando o botão é pressionado
                Navigator.pushNamed(
                    // Navega para uma tela nomeada
                    context, // Contexto do aplicativo
                    '/CadastroUser' // Nome da rota para a tela de cadastro de usuários
                    );
              }),
        ));
  }
}

class Contador extends StatefulWidget {
  // Classe Contador que é um StatefulWidget
  const Contador({super.key}); // Construtor para a classe Contador

  @override
  State<Contador> createState() =>
      _ContPageState(); // Criação do estado para a classe Contador
}

class _ContPageState extends State<Contador> {
  // Estado para a classe Contador
  int _counter = 0; // Variável para armazenar o contador

  void _incrementCounter() {
    // Método para incrementar o contador
    setState(() {
      // Atualiza o estado
      _counter++; // Incrementa o contador
    });
  }

  void _decrementCounter() {
    // Método para decrementar o contador
    setState(() {
      // Atualiza o estado
      _counter--; // Decrementa o contador
    });
  }

  @override
  Widget build(BuildContext context) {
    // Método para construir a interface do aplicativo
    return Scaffold(
      // Estrutura básica da tela
      appBar: AppBar(
        // Barra superior da tela
        backgroundColor: Theme.of(context)
            .colorScheme
            .inversePrimary, // Cor de fundo da barra superior
        title: Text("Contador"), // Título da barra superior
      ),
      body: Center(
        // Corpo centralizado da tela
        child: Column(
          // Coluna de widgets
          mainAxisAlignment: MainAxisAlignment.center,
          // Alinhamento principal no centro
          children: <Widget>[
            const Text(
              // Texto estático
              'TESTE:', // Conteúdo do texto
            ),
            Text(
              // Texto dinâmico para exibir o contador
              '$_counter', // Valor do contador convertido para string
              style:
                  Theme.of(context).textTheme.headlineMedium, // Estilo do texto
            ),
            Row(
              // Linha de widgets
              mainAxisAlignment: MainAxisAlignment.center,
              // Alinhamento principal no centro
              children: [
                ElevatedButton(
                  // Botão elevado para incrementar o contador
                  onPressed: _incrementCounter,
                  // Ação quando o botão é pressionado
                  child: const Icon(Icons.add), // Ícone do botão
                ),
                ElevatedButton(
                  // Botão elevado para decrementar o contador
                  onPressed: _decrementCounter,
                  // Ação quando o botão é pressionado
                  child: const Icon(Icons.remove), // Ícone do botão
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
