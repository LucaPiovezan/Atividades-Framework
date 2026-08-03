import 'package:flutter/material.dart';

class CardIcone extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final String descricao;
  final String textoBotao;
  final Color cor;
  final VoidCallback onBotaoPressed;

  CardIcone({
    Key? key,
    required this.icone,
    required this.titulo,
    required this.descricao,
    required this.textoBotao,
    required this.cor,
    required this.onBotaoPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icone, color: cor, size: 40),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(descricao),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: onBotaoPressed,
                    child: Text(textoBotao),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}