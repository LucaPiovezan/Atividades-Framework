import 'package:flutter/material.dart';

class TelaDetalhesCurso extends StatefulWidget {
  final Map<String, String> curso;

  TelaDetalhesCurso({required this.curso});

  @override
  State<TelaDetalhesCurso> createState() => _TelaDetalhesCursoState();
}

class _TelaDetalhesCursoState extends State<TelaDetalhesCurso> {
  final nomeController = TextEditingController();
  bool interesseRegistrado = false;

  void registrarInteresse() {
    String nome = nomeController.text;

    if (nome.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Digite seu nome antes de registrar interesse.')),
      );
      return;
    }

    setState(() {
      interesseRegistrado = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Interesse registrado com sucesso, $nome!')),
    );
  }

  @override
  void dispose() {
    nomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final curso = widget.curso;

    return LayoutBuilder(
      builder: (context, constraints) {
        double largura = MediaQuery.of(context).size.width;
        bool isDesktop = largura >= 900;

        return Scaffold(
          appBar: AppBar(
            title: Text(curso['nome']!),
          ),
          body: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: isDesktop ? 700 : double.infinity),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 400),
                        padding: EdgeInsets.all(16),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: interesseRegistrado ? Colors.green[100] : Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: interesseRegistrado ? Colors.green : Colors.grey,
                            width: 2,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              curso['nome']!,
                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text('Carga horária: ${curso['carga']}'),
                            SizedBox(height: 4),
                            Text('Nível: ${curso['nivel']}'),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Descrição completa',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        curso['descricao']!,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 24),

                      TextField(
                        controller: nomeController,
                        decoration: InputDecoration(
                          labelText: 'Seu nome',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 12),

                      AnimatedOpacity(
                        opacity: interesseRegistrado ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 500),
                        child: Row(
                          children: [
                            Icon(Icons.check_circle, color: Colors.green),
                            SizedBox(width: 8),
                            Text(
                              'Interesse registrado!',
                              style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),

                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: interesseRegistrado ? null : registrarInteresse,
                              child: Text(
                                interesseRegistrado ? 'Interesse registrado' : 'Tenho interesse',
                              ),
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
          ),
        );
      },
    );
  }
}
