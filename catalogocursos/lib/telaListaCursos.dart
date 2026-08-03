import 'package:flutter/material.dart';
import 'cardCurso.dart';
import 'telaDetalhesCurso.dart';

class TelaListaCursos extends StatelessWidget {
  final List<Map<String, String>> cursos = [
    {
      'nome': 'Flutter Básico',
      'carga': '20h',
      'nivel': 'Básico',
      'descricao':
          'Curso introdutório sobre Flutter, ideal para quem está começando a desenvolver aplicativos.',
    },
    {
      'nome': 'Dart Essencial',
      'carga': '15h',
      'nivel': 'Básico',
      'descricao':
          'Aprenda os fundamentos da linguagem Dart, usada como base para o Flutter.',
    },
    {
      'nome': 'Interfaces Responsivas',
      'carga': '18h',
      'nivel': 'Intermediário',
      'descricao':
          'Aprenda a criar layouts que se adaptam a diferentes tamanhos de tela usando MediaQuery, Expanded e Flexible.',
    },
    {
      'nome': 'Animações no Flutter',
      'carga': '22h',
      'nivel': 'Intermediário',
      'descricao':
          'Explore AnimatedContainer, AnimatedOpacity e outras formas de dar vida à interface do app.',
    },
    {
      'nome': 'Navegação entre Telas',
      'carga': '12h',
      'nivel': 'Avançado',
      'descricao':
          'Domine o uso de Navigator.push e Navigator.pop para criar fluxos completos entre telas.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double largura = MediaQuery.of(context).size.width;

        bool isTablet = largura >= 600 && largura < 900;
        bool isDesktop = largura >= 900;

        int colunas = 1;
        if (isTablet) colunas = 2;
        if (isDesktop) colunas = 3;

        return Scaffold(
          appBar: AppBar(
            title: Text('Lista de Cursos'),
          ),
          body: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: isDesktop ? 900 : double.infinity),
              child: isDesktop
                  ? GridView.builder(
                      padding: EdgeInsets.all(12),
                      itemCount: cursos.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: colunas,
                        childAspectRatio: 3.5,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemBuilder: (context, index) {
                        final curso = cursos[index];
                        return CardCurso(
                          nome: curso['nome']!,
                          carga: curso['carga']!,
                          nivel: curso['nivel']!,
                          aoClicar: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TelaDetalhesCurso(curso: curso),
                              ),
                            );
                          },
                        );
                      },
                    )
                  : ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      itemCount: cursos.length,
                      itemBuilder: (context, index) {
                        final curso = cursos[index];
                        return CardCurso(
                          nome: curso['nome']!,
                          carga: curso['carga']!,
                          nivel: curso['nivel']!,
                          aoClicar: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TelaDetalhesCurso(curso: curso),
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
          ),
        );
      },
    );
  }
}
