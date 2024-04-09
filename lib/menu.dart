import 'package:flutter/material.dart';
import 'imc.dart'; // Importando arquivos Dart necessários
import 'contador.dart';
import 'cadastro_prod.dart';
import 'cadastro_usua.dart';

class Menu extends StatefulWidget {
  // Definindo um StatefulWidget chamado Menu
  const Menu({super.key}); // Construtor para a classe Menu

  @override
  State<Menu> createState() => _MenuState(); // Criando o estado para o Menu
}

class _MenuState extends State<Menu> {
  // Classe de estado para o Menu
  @override
  Widget build(BuildContext context) {
    // Construindo a interface do usuário para o Menu
    return Scaffold(
      // Scaffold para a tela inteira
      appBar: AppBar(
        // AppBar no topo da tela
        title: Text("MENU"), // Título da app bar
        centerTitle: true, // Centralizando o título
        backgroundColor: Colors.deepOrangeAccent, // Cor de fundo da app bar
      ),

      body: SingleChildScrollView(
        // SingleChildScrollView para tornar a tela rolável
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        // Definindo o preenchimento para o corpo
        child: Column(
          // Widget de coluna para arranjar os filhos verticalmente
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // Alinhando os filhos para esticar horizontalmente
          children: <Widget>[
            // Lista de widgets filhos
            const Icon(
              // Widget de ícone
              Icons.add_business_sharp, // Ícone: add_business_sharp
              size: 120.0, // Tamanho do ícone
              color: Colors.deepOrangeAccent, // Cor do ícone
            ),
            Text(
              // Widget de texto
              "Aplicação Principal", // Conteúdo do texto
              textAlign: TextAlign.center, // Alinhando o texto ao centro
              style: TextStyle(
                  color: Colors.blueGrey, fontSize: 25.0), // Estilo do texto
            ),
            Text(
              // Widget de texto vazio para espaçamento
              "",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blueGrey, fontSize: 25.0),
            ),
            Column(
                // Outro widget de coluna para os botões
                crossAxisAlignment: CrossAxisAlignment.stretch,
                // Esticando os botões horizontalmente
                children: <Widget>[
                  // Lista de widgets de botões
                  ElevatedButton(
                      // Widget de botão elevado
                      child: const Text("IMC"), // Texto do botão
                      onPressed: () {
                        // Ação quando o botão é pressionado
                        Navigator.push(
                            // Navegando para a tela IMC
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const Imc())); // Construindo a tela IMC
                      }),
                  ElevatedButton(
                      // Widget de botão elevado
                      child: const Text("Contador"), // Texto do botão
                      onPressed: () {
                        // Ação quando o botão é pressionado
                        Navigator.push(
                            // Navegando para a tela Contador
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const Contador())); // Construindo a tela Contador
                      }),
                  ElevatedButton(
                      // Widget de botão elevado
                      child: const Text("Cadastro Usuario"), // Texto do botão
                      onPressed: () {
                        // Ação quando o botão é pressionado
                        Navigator.push(
                            // Navegando para a tela CadastroUsuario
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const Cadastro_usua())); // Construindo a tela CadastroUsuario
                      }),
                  ElevatedButton(
                      // Widget de botão elevado
                      child: const Text("Cadastro de produtos"),
                      // Texto do botão
                      onPressed: () {
                        // Ação quando o botão é pressionado
                        Navigator.push(
                            // Navegando para a tela CadastroProduto
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const Cadastro_prod())); // Construindo a tela CadastroProduto
                      }),
                ]),
          ],
        ),
      ), // Botão para executar o cálculo do IMC,
    );
  }
}
