import 'package:flutter/material.dart';
import '../models/cidade_clima.dart';
import 'cidade_card.dart';

class AreaCidades extends StatelessWidget {
  final List<CidadeClima> cidades;
  final int colunas;
  final bool isCelular;
  final bool isTablet;

  AreaCidades(this.cidades, this.colunas, this.isCelular, this.isTablet);

  @override
  Widget build(BuildContext context) {
    List<CidadeClima> cidadesExibidas = cidades;
    if (isCelular) {
      cidadesExibidas = cidades.take(4).toList();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isCelular) ...[
          Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Colors.blue.shade300),
            ),
            child: Padding(
              padding: EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cidade em destaque',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.blue.shade700,
                    ),
                  ),
                  Text(
                    'Fortaleza — melhor clima da semana!',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.blue.shade500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
        ],

        if (isTablet) ...[
          Center(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.calendar_month),
              label: Text('Ver previsão para 7 dias'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo.shade600,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
        ],

        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: colunas,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.65,
          ),
          itemCount: cidadesExibidas.length,
          itemBuilder: (context, index) {
            return CidadeCard(cidadesExibidas[index]);
          },
        ),
      ],
    );
  }
}