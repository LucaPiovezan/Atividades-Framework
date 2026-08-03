import 'package:flutter/material.dart';

class TelaPedido extends StatefulWidget {
  @override
  State<TelaPedido> createState() => _TelaPedidoState();
}

class _TelaPedidoState extends State<TelaPedido> {
  final nomeController = TextEditingController();
  final produtoController = TextEditingController();
  final observacaoController = TextEditingController();

  int pedidosEnviados = 0;

  void enviarPedido() {
    if (nomeController.text.isEmpty || produtoController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Preencha o nome e o produto antes de enviar.')),
      );
      return;
    }

    setState(() {
      pedidosEnviados++;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Pedido enviado com sucesso!')),
    );

    nomeController.clear();
    produtoController.clear();
    observacaoController.clear();
  }

  @override
  void dispose() {
    nomeController.dispose();
    produtoController.dispose();
    observacaoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double largura = MediaQuery.of(context).size.width;
        bool isDesktop = largura >= 900;

        return Scaffold(
          appBar: AppBar(
            title: Text('Fazer Pedido'),
          ),
          body: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: isDesktop ? 600 : double.infinity),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pedidos enviados: $pedidosEnviados',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: nomeController,
                        decoration: InputDecoration(
                          labelText: 'Nome do cliente',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 12),
                      TextField(
                        controller: produtoController,
                        decoration: InputDecoration(
                          labelText: 'Produto desejado',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 12),
                      TextField(
                        controller: observacaoController,
                        decoration: InputDecoration(
                          labelText: 'Observação do pedido',
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 3,
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: enviarPedido,
                          child: Text('Enviar Pedido'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
