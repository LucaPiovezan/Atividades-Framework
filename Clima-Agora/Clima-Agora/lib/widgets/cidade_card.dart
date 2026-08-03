import 'package:flutter/material.dart';
import '../models/cidade_clima.dart';

class CidadeCard extends StatelessWidget {
  final CidadeClima cidade;

  CidadeCard(this.cidade);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
  cidade.imagem,
  height: 90,
  fit: BoxFit.cover,
  errorBuilder: (context, error, stackTrace) {
    return Container(
      height: 90,
      color: Colors.blue.shade100,
      child: Center(
        child: Icon(
          cidade.icone,
          size: 36,
          color: Colors.blue.shade700,
        ),
      ),
    );
  },
),

          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        cidade.icone,
                        size: 20,
                        color: Colors.blue.shade700,
                      ),
                      SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          cidade.nome,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    '${cidade.temperatura.toInt()}°C',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    cidade.condicao,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade700,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 8),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '${cidade.nome}: ${cidade.temperatura.toInt()}°C - ${cidade.condicao}',
                            ),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      child: Text(
                        'Ver detalhes',
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}