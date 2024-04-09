import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de produtos'), // Título da barra de navegação
        centerTitle: true, // Centraliza o título
        backgroundColor: Colors.blueGrey, // Cor de fundo da barra de navegação
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
          child: Text('Voltar'), // Texto do botão
        ),
      ),
    );
  }
}

class Cadastro_prod extends StatefulWidget {
  const Cadastro_prod({Key? key}) : super(key: key);

  @override
  State<Cadastro_prod> createState() => _Cadastro_prodState();
}

class _Cadastro_prodState extends State<Cadastro_prod> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  String _textInfo = "Informe seus dados";

  void _cadastro() {
    setState(() {
      String nome = nomeController.text;
      String descricao = descricaoController.text;
      if (nome.isEmpty || descricao.isEmpty) {
        _textInfo =
            "Os campos estão vazios"; // Mensagem de erro se os campos estiverem vazios
      } else {
        _textInfo =
            "Produto foi cadastrado com sucesso"; // Mensagem de sucesso após o cadastro do produto
      }
    });
  }

  void _limpar_tela() {
    nomeController.text = ""; // Limpa o campo de entrada do nome do produto
    descricaoController.text =
        ""; // Limpa o campo de entrada da descrição do produto
    setState(() {
      _textInfo =
          "Informe os dados do produto"; // Define o texto informativo padrão
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de produto"),
        // Título da barra de navegação
        centerTitle: true,
        // Centraliza o título
        backgroundColor: Colors.pinkAccent,
        // Cor de fundo da barra de navegação
        actions: <Widget>[
          IconButton(
            onPressed: _limpar_tela,
            icon: Icon(Icons.refresh), // Ícone do botão para limpar os campos
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        // Preenchimento do corpo da tela
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // Alinhamento dos widgets esticando horizontalmente
          children: <Widget>[
            const Icon(
              Icons.production_quantity_limits,
              // Ícone: produção de quantidade limitada
              size: 120.0, // Tamanho do ícone
              color: Colors.pinkAccent, // Cor do ícone
            ),
            TextField(
              keyboardType: TextInputType.text,
              // Tipo de teclado para entrada de texto
              decoration: InputDecoration(
                labelText: "Nome do produto",
                // Rótulo do campo de entrada do nome do produto
                labelStyle:
                    TextStyle(color: Colors.pinkAccent), // Estilo do rótulo
              ),
              textAlign: TextAlign.center,
              // Alinhamento do texto no centro
              style: TextStyle(fontSize: 25.0),
              // Estilo do texto
              controller:
                  nomeController, // Controlador para o campo de entrada do nome do produto
            ),
            TextField(
              keyboardType: TextInputType.text,
              // Tipo de teclado para entrada de texto
              decoration: InputDecoration(
                labelText: "Descrição do produto",
                // Rótulo do campo de entrada da descrição do produto
                labelStyle:
                    TextStyle(color: Colors.pinkAccent), // Estilo do rótulo
              ),
              textAlign: TextAlign.center,
              // Alinhamento do texto no centro
              style: TextStyle(fontSize: 25.0),
              // Estilo do texto
              obscureText: true,
              // Texto oculto
              controller:
                  descricaoController, // Controlador para o campo de entrada da descrição do produto
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              // Preenchimento entre widgets
              child: SizedBox(
                height: 50.0, // Altura fixa do botão
                child: ElevatedButton(
                  onPressed: _cadastro, // Ação quando o botão é pressionado
                  child: const Text("Cadastre-se"), // Texto do botão
                ),
              ),
            ),
            Text(
              _textInfo,
              // Texto para exibir informações sobre o cadastro do produto
              textAlign: TextAlign.center, // Alinhamento do texto no centro
              style: TextStyle(
                  color: Colors.pinkAccent, fontSize: 25.0), // Estilo do texto
            )
          ],
        ),
      ),
    );
  }
}
