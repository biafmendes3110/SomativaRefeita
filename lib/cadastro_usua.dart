import 'package:flutter/material.dart';
import 'cadastro_prod.dart'; // Importa o arquivo de cadastro de produtos

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tela imc'), // Título da barra de navegação
          centerTitle: true, // Centraliza o título
          backgroundColor:
              Colors.deepPurple, // Cor de fundo da barra de navegação
        ),
        body: Center(
          child: ElevatedButton(
              child: const Text('Leva pra tela de cadastro dos usuarios'),
              // Texto do botão
              onPressed: () {
                Navigator.pushNamed(
                    // Navega para uma tela nomeada
                    context, // Contexto do aplicativo
                    '/CadastroUser' // Nome da rota para a tela de cadastro de usuários
                    );
              }),
        ));
  }
}

class Cadastro_usua extends StatefulWidget {
  // Classe Cadastro_usua que é um StatefulWidget
  const Cadastro_usua({super.key}); // Construtor para a classe Cadastro_usua

  @override
  State<Cadastro_usua> createState() =>
      _Cadastro_usuaState(); // Criação do estado para a classe Cadastro_usua
}

class _Cadastro_usuaState extends State<Cadastro_usua> {
  // Estado para a classe Cadastro_usua
  TextEditingController usuarioController =
      TextEditingController(); // Controlador para o campo de entrada de usuário
  TextEditingController senhaController =
      TextEditingController(); // Controlador para o campo de entrada de senha
  String _textInfo =
      "Informe seus dados"; // String para exibir informações sobre o cadastro

  void _cadastro() {
    // Método para realizar o cadastro de usuário
    setState(() {
      // Atualiza o estado
      String user = usuarioController
          .text; // Obtém o texto do campo de entrada de usuário
      String senha =
          senhaController.text; // Obtém o texto do campo de entrada de senha
      if (user.isEmpty || senha.isEmpty) {
        // Verifica se os campos estão vazios
        _textInfo = "Os campos estão vazios"; // Define mensagem de erro
      } else {
        _textInfo =
            "Usuário foi cadastrado com sucesso"; // Define mensagem de sucesso
      }
    });
  }

  void _limpar_tela() {
    // Método para limpar os campos de entrada e redefinir o texto informativo
    usuarioController.text = ""; // Limpa o campo de entrada de usuário
    senhaController.text = ""; // Limpa o campo de entrada de senha
    setState(() {
      // Atualiza o estado
      _textInfo = "Informe seus dados"; // Define o texto informativo padrão
    });
  }

  @override
  Widget build(BuildContext context) {
    // Método para construir a interface do aplicativo
    return Scaffold(
      // Estrutura básica da tela
      appBar: AppBar(
        // Barra superior da tela
        title: Text("Cadastro de usuário"),
        // Título da barra de navegação
        centerTitle: true,
        // Centraliza o título
        backgroundColor: Colors.deepPurple,
        // Cor de fundo da barra de navegação
        actions: <Widget>[
          // Lista de ações na barra de navegação
          IconButton(
              // Ícone de botão na barra de navegação
              onPressed: _limpar_tela, // Ação quando o botão é pressionado
              icon: Icon(Icons.refresh) // Ícone do botão de atualização
              )
        ],
      ),
      body: SingleChildScrollView(
        // Corpo da tela com rolagem habilitada
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        // Preenchimento do corpo da tela
        child: Column(
          // Coluna de widgets
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // Alinhamento dos widgets na coluna esticando horizontalmente
          children: <Widget>[
            // Lista de widgets
            const Icon(
              // Ícone
              Icons.person, // Ícone: pessoa
              size: 120.0, // Tamanho do ícone
              color: Colors.deepPurple, // Cor do ícone
            ),
            TextField(
              // Campo de entrada para usuário
              keyboardType: TextInputType.text,
              // Tipo de teclado para entrada de texto
              decoration: InputDecoration(
                  // Decoração do campo de entrada
                  labelText: "Usuário", // Rótulo do campo de entrada
                  labelStyle: TextStyle(color: Colors.deepPurple)),
              // Estilo do rótulo
              textAlign: TextAlign.center,
              // Alinhamento do texto no centro
              style: TextStyle(fontSize: 25.0),
              // Estilo do texto
              controller:
                  usuarioController, // Controlador para o campo de entrada
            ),
            TextField(
              // Campo de entrada para senha
              keyboardType: TextInputType.text,
              // Tipo de teclado para entrada de texto
              decoration: InputDecoration(
                  // Decoração do campo de entrada
                  labelText: "Senha", // Rótulo do campo de entrada
                  labelStyle: TextStyle(color: Colors.deepPurple)),
              // Estilo do rótulo
              textAlign: TextAlign.center,
              // Alinhamento do texto no centro
              style: TextStyle(fontSize: 25.0),
              // Estilo do texto
              obscureText: true,
              // Texto oculto
              controller:
                  senhaController, // Controlador para o campo de entrada
            ),
            Padding(
              // Preenchimento entre widgets
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              // Preenchimento superior e inferior
              child: SizedBox(
                // Widget de tamanho fixo
                height: 50.0, // Altura fixa
                child: ElevatedButton(
                  // Botão elevado
                  onPressed: _cadastro, // Ação quando o botão é pressionado
                  child: const Text("Cadastre-se"), // Texto do botão
                ),
              ),
            ),
            Text(
              // Texto para exibir informações sobre o cadastro
              _textInfo, // Conteúdo do texto
              textAlign: TextAlign.center, // Alinhamento do texto no centro
              style: TextStyle(
                  color: Colors.deepPurple, fontSize: 25.0), // Estilo do texto
            )
          ],
        ),
      ),
    );
  }
}
