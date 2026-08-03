import 'package:flutter/material.dart';
import 'package:pubsec/pages/tela_home.dart';
import '../widgets/card_icones.dart';

class TelaExluir extends StatefulWidget {
  @override
  State<TelaExluir> createState() => _TelaExluirState();
}

class _TelaExluirState extends State<TelaExluir> {
  String mensagem = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela Excluir'),
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
            icone: Icons.delete,
            titulo: 'Excluir',
            descricao: 'Exclua coisas',
            textoBotao: 'Exclua coisas',
            cor: const Color.fromARGB(255, 53, 96, 187),
            onBotaoPressed: () {
              setState(() {
                mensagem = 'Voce esta na tela Excluir';
              });
            },
          ),
        ],
      ),
    );
  }
}