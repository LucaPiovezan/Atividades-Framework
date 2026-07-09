import 'package:flutter/material.dart';

class TelaDetalhesProduto extends StatefulWidget {
  final Map<String, String> produto;

  TelaDetalhesProduto({required this.produto});

  @override
  State<TelaDetalhesProduto> createState() => _TelaDetalhesProdutoState();
}

class _TelaDetalhesProdutoState extends State<TelaDetalhesProduto> {
  bool destacado = false;

  void alternarDestaque() {
    setState(() {
      destacado = !destacado;
    });
  }

  @override
  Widget build(BuildContext context) {
    final produto = widget.produto;

    return LayoutBuilder(
      builder: (context, constraints) {
        double largura = MediaQuery.of(context).size.width;
        bool isDesktop = largura >= 900;

        return Scaffold(
          appBar: AppBar(
            title: Text(produto['nome']!),
          ),
          body: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: isDesktop ? 700 : double.infinity),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 400),
                      width: double.infinity,
                      padding: EdgeInsets.all(destacado ? 24 : 16),
                      decoration: BoxDecoration(
                        color: destacado ? Colors.orange[100] : Colors.grey[200],
                        borderRadius: BorderRadius.circular(destacado ? 20 : 8),
                        border: Border.all(
                          color: destacado ? Colors.orange : Colors.grey,
                          width: destacado ? 3 : 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            produto['nome']!,
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text(
                            produto['preco']!,
                            style: TextStyle(fontSize: 18, color: Colors.orange[800]),
                          ),
                          SizedBox(height: 8),
                          Text(produto['descricao']!, style: TextStyle(fontSize: 16)),
                          if (destacado) ...[
                            SizedBox(height: 12),
                            Text(
                              'Produto mais pedido da semana!',
                              style: TextStyle(
                                color: Colors.orange[900],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: alternarDestaque,
                            child: Text('Adicionar destaque'),
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Voltar'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
