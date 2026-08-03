import 'package:flutter/material.dart';
import 'telaListaCursos.dart';

class TelaInicial extends StatelessWidget {
  void abrirInfoCategoria(BuildContext context, String label) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Categoria: $label',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Text(
                'Veja os cursos disponíveis na categoria $label.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double largura = MediaQuery.of(context).size.width;

        bool isCelular = largura < 600;
        bool isDesktop = largura >= 900;

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
                          colors: [Colors.indigo.shade800, Colors.indigo.shade400],
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
                                Icon(Icons.school, size: 40, color: Colors.yellow),
                                SizedBox(width: 8),
                                Text(
                                  'Catálogo de Cursos',
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
                              'Veja os cursos disponíveis e registre seu interesse.',
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
                        'Cursos atualizados regularmente.',
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
                      _CategoriaChip('Básico', Icons.star, () => abrirInfoCategoria(context, 'Básico')),
                      _CategoriaChip('Intermediário', Icons.trending_up, () => abrirInfoCategoria(context, 'Intermediário')),
                      _CategoriaChip('Avançado', Icons.diamond, () => abrirInfoCategoria(context, 'Avançado')),
                      _CategoriaChip('Flutter', Icons.flutter_dash, () => abrirInfoCategoria(context, 'Flutter')),
                      _CategoriaChip('Dart', Icons.code, () => abrirInfoCategoria(context, 'Dart')),
                      _CategoriaChip('Animação', Icons.movie, () => abrirInfoCategoria(context, 'Animação')),
                    ],
                  ),

                  SizedBox(height: 24),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TelaListaCursos()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text('Ver cursos', style: TextStyle(fontSize: 16)),
                    ),
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
  final VoidCallback aoClicar;

  _CategoriaChip(this.label, this.icone, this.aoClicar);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: aoClicar,
      child: Container(
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
          border: Border.all(color: Colors.indigo.shade100),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icone, size: 16, color: Colors.indigo.shade700),
            SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
