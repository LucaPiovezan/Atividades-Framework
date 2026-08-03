import 'package:flutter/material.dart';

class CardPokemon extends StatelessWidget {
  final String nome;
  final String tipo;
  final String nivel;
  final String treinador;
  final String procura;
  final VoidCallback aoClicar;

  CardPokemon({
    required this.nome,
    required this.tipo,
    required this.nivel,
    required this.treinador,
    required this.procura,
    required this.aoClicar,
  });

  Color corDoTipo() {
    if (tipo == 'Elétrico') return Colors.amber;
    if (tipo == 'Fogo') return Colors.orange;
    if (tipo == 'Grama/Venenoso') return Colors.green;
    if (tipo == 'Água') return Colors.blue;
    if (tipo == 'Normal') return Colors.brown;
    return Colors.grey;
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: corDoTipo().withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      'Tipo: $tipo',
                      style: TextStyle(color: corDoTipo(), fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text('Nível: $nivel'),
                  SizedBox(height: 2),
                  Text('Treinador: $treinador'),
                  SizedBox(height: 2),
                  Text('Procura: $procura'),
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
