import 'package:flutter/material.dart';
import '../models/cidade_clima.dart';
import '../widgets/area_cidades.dart';
import '../widgets/painel_informacoes.dart';

class TelaClima extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double largura = MediaQuery.of(context).size.width;

        bool isCelular = largura < 600;
        bool isTablet = largura >= 600 && largura < 900;
        bool isDesktop = largura >= 900;

        int colunas = 1;
        if (isTablet) colunas = 2;
        if (isDesktop) colunas = 4;

        return Scaffold(
          backgroundColor: Colors.grey.shade100,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: isCelular ? 16 / 5 : 16 / 4,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.blue.shade800, Colors.blue.shade400],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.wb_sunny, size: 40, color: Colors.yellow),
                                SizedBox(width: 8),
                                Text(
                                  'Clima Agora',
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Confira as condições do tempo em diversas cidades.',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white.withOpacity(0.9),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  if (isDesktop) ...[
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.green.shade300),
                      ),
                      child: Text(
                        'Dados climáticos atualizados em tempo real.',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],

                  SizedBox(height: 20),

                  Text(
                    'Categorias',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),

                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _CategoriaChip('Ensolarado', Icons.wb_sunny),
                      _CategoriaChip('Chuvoso', Icons.water_drop),
                      _CategoriaChip('Frio', Icons.ac_unit),
                      _CategoriaChip('Quente', Icons.whatshot),
                      _CategoriaChip('Nublado', Icons.cloud),
                      _CategoriaChip('Vento Forte', Icons.air),
                    ],
                  ),

                  SizedBox(height: 24),

                  if (isDesktop)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: AreaCidades(cidades, colunas, isCelular, isTablet),
                        ),
                        SizedBox(width: 16),
                        SizedBox(
                          width: 260,
                          child: PainelInformacoes(),
                        ),
                      ],
                    )
                  else
                    Column(
                      children: [
                        AreaCidades(cidades, colunas, isCelular, isTablet),
                        SizedBox(height: 20),
                        PainelInformacoes(),
                      ],
                    ),

                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _CategoriaChip extends StatelessWidget {
  final String label;
  final IconData icone;

  _CategoriaChip(this.label, this.icone);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.blue.shade100),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icone, size: 16, color: Colors.blue.shade700),
          SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
          ),
        ],
      ),
    );
  }
}