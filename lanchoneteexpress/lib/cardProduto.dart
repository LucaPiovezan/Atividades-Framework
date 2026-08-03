import 'package:flutter/material.dart';

class CardProduto extends StatelessWidget {
  final String nome;
  final String preco;
  final String descricao;
  final VoidCallback aoClicar;

  CardProduto({
    required this.nome,
    required this.preco,
    required this.descricao,
    required this.aoClicar,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nome,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    preco,
                    style: TextStyle(color: Colors.orange[800], fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 4),
                  Text(descricao, style: TextStyle(color: Colors.grey[700])),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: aoClicar,
              child: Text('Ver detalhes'),
            ),
          ],
        ),
      ),
    );
  }
}
