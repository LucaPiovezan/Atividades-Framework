import 'package:flutter/material.dart';
import 'cardProduto.dart';
import 'telaDetalhesProduto.dart';
import 'telaPedido.dart';

class TelaInicial extends StatelessWidget {
  final List<Map<String, String>> produtos = [
    {
      'nome': 'X-Burguer',
      'preco': 'R\$ 18,00',
      'descricao': 'Pão, carne, queijo e molho especial.',
    },
    {
      'nome': 'Batata Frita',
      'preco': 'R\$ 12,00',
      'descricao': 'Porção individual crocante.',
    },
    {
      'nome': 'Suco Natural',
      'preco': 'R\$ 8,00',
      'descricao': 'Suco gelado da fruta.',
    },
    {
      'nome': 'Combo Especial',
      'preco': 'R\$ 28,00',
      'descricao': 'X-Burguer, batata e suco.',
    },
  ];

  void abrirPromocao(BuildContext context) {
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
                'Promoção do dia',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Text(
                'Na compra de um X-Burguer, o suco sai pela metade do preço!',
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
                          colors: [Colors.orange.shade800, Colors.orange.shade400],
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
                                Icon(Icons.restaurant_menu, size: 40, color: Colors.yellow),
                                SizedBox(width: 8),
                                Text(
                                  'Lanchonete Express',
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
                              'Confira nosso cardápio e faça seu pedido.',
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
                        'Cardápio atualizado diariamente.',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],

                  SizedBox(height: 20),

                  Text(
                    'Cardápio',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),

                  if (isDesktop)
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: produtos.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: colunas,
                        childAspectRatio: 3.0,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemBuilder: (context, index) {
                        final produto = produtos[index];
                        return CardProduto(
                          nome: produto['nome']!,
                          preco: produto['preco']!,
                          descricao: produto['descricao']!,
                          aoClicar: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TelaDetalhesProduto(produto: produto),
                              ),
                            );
                          },
                        );
                      },
                    )
                  else
                    Column(
                      children: produtos.map((produto) {
                        return CardProduto(
                          nome: produto['nome']!,
                          preco: produto['preco']!,
                          descricao: produto['descricao']!,
                          aoClicar: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TelaDetalhesProduto(produto: produto),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),

                  SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => TelaPedido()),
                            );
                          },
                          child: Text('Fazer Pedido'),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => abrirPromocao(context),
                          child: Text('Ver promoção'),
                        ),
                      ),
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
