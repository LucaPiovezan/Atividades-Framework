import 'package:flutter/material.dart';
import 'package:pubsec/pages/tela_home.dart';
import '../widgets/card_icones.dart';

class TelaBolt extends StatefulWidget {
  @override
  State<TelaBolt> createState() => _TelaBoltState();
}

class _TelaBoltState extends State<TelaBolt> {
  String mensagem = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela Adicionar'),
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
            icone: Icons.bolt,
            titulo: 'Bolt',
            descricao: 'Acoes rapidas',
            textoBotao: 'Acoes rapidas',
            cor: Colors.amber,
            onBotaoPressed: () {
              setState(() {
                mensagem = 'Voce esta na tela Bolt';
              });
            },
          ),
        ],
      ),
    );
  }
}