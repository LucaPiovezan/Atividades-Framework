import 'package:flutter/material.dart';

class CardCurso extends StatelessWidget {
  final String nome;
  final String carga;
  final String nivel;
  final VoidCallback aoClicar;

  CardCurso({
    required this.nome,
    required this.carga,
    required this.nivel,
    required this.aoClicar,
  });

  Color corDoNivel() {
    if (nivel == 'Básico') {
      return Colors.green;
    } else if (nivel == 'Intermediário') {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

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
                  SizedBox(height: 6),
                  Text('Carga horária: $carga'),
                  SizedBox(height: 4),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: corDoNivel().withOpacity(0.15),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      nivel,
                      style: TextStyle(color: corDoNivel(), fontWeight: FontWeight.w600),
                    ),
                  ),
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
