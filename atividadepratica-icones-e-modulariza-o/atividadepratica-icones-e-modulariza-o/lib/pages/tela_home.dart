import 'package:flutter/material.dart';
import 'package:pubsec/pages/tela_adicionar.dart';
import 'package:pubsec/pages/tela_bolt.dart';
import 'package:pubsec/pages/tela_exluir.dart';
import '../widgets/card_icones.dart';

class TelaHome extends StatefulWidget {
  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  String mensagem = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu App de icones'),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 16, bottom: 24),
        children: [
          if (mensagem.isNotEmpty)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                mensagem,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFD4A853),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          CardIcone(
            icone: Icons.home,
            titulo: 'Home',
            descricao: 'Volte para a pgina inicial do aplicativo ',
            textoBotao: 'Ir para Home',
            cor: Colors.indigo,
            onBotaoPressed: () {
              setState(() {
                mensagem = 'clicou em Home';
              });
            },
          ),
          CardIcone(
            icone: Icons.add_circle,
            titulo: 'Adicionar',
            descricao: 'adicione conteúdo ao aplicativo.',
            textoBotao: 'Adicionar',
            cor: Colors.green,
            onBotaoPressed: () {
             Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => TelaAdicionar(),
  ),
);
            },
          ),
          CardIcone(
            icone: Icons.delete,
            titulo: 'Excluir',
            descricao: 'Remova itens',
            textoBotao: 'Excluir',
            cor: Colors.red,
            onBotaoPressed: () {
              Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => TelaExluir(),
  ),
);
            },
          ),
          CardIcone(
            icone: Icons.bolt,
            titulo: 'Bolt',
            descricao: 'Acesse açoes rapidas',
            textoBotao: 'Açao Rapida',
            cor: Colors.amber,
            onBotaoPressed: () {
              Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => TelaBolt(),
  ),
);
            },
          ),
        ],
      ),
    );
  }
}