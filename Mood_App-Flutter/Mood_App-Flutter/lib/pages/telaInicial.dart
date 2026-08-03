import 'package:flutter/material.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {

  String humorAtual = "Feliz";
  bool mostrarMensagem = false;

  Color corAtual = Colors.amber;
  IconData iconeAtual = Icons.sentiment_very_satisfied;
  String textoAtual = "Hoje estou feliz!";
  String mensagemAtual = "Hoje estou Feliz";
  double bordaAtual = 20;

  void mudarHumor(
    String humor,
    Color cor,
    IconData icone,
    String texto,
    String mensagem,
    double borda,
  ) {
    setState(() {
      humorAtual = humor;
      corAtual = cor;
      iconeAtual = icone;
      textoAtual = texto;
      mensagemAtual = mensagem;
      bordaAtual = borda;
      mostrarMensagem = true; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mood App"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Título
                const Text(
                  "Como você está hoje?",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  "Escolha um humor e veja a tela mudar!",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),

               
                AnimatedContainer(
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeInOut,
                  width: double.infinity,
                  height: 220,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: corAtual,
                    borderRadius: BorderRadius.circular(bordaAtual),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(iconeAtual, size: 70, color: Colors.white),
                      const SizedBox(height: 12),
                      Text(
                        textoAtual,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                AnimatedOpacity(
                  opacity: mostrarMensagem ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 700),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: corAtual.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: corAtual, width: 1.5),
                    ),
                    child: Text(
                      mensagemAtual,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: corAtual,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                ElevatedButton.icon(
                  onPressed: () => mudarHumor(
                    "Feliz",
                    Colors.amber,
                    Icons.sentiment_very_satisfied,
                    "Feliz",
                    "Hoje estou feliz",
                    20,
                  ),
                  icon: const Icon(Icons.sentiment_very_satisfied),
                  label: const Text("Feliz"),
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () => mudarHumor(
                    "Triste",
                    Colors.blueGrey,
                    Icons.sentiment_very_dissatisfied,
                    "Triste",
                    "Hoje estou triste",
                    20,
                  ),
                  icon: const Icon(Icons.sentiment_very_dissatisfied),
                  label: const Text("Triste"),
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () => mudarHumor(
                    "Animado",
                    Colors.deepOrange,
                    Icons.bolt,
                    "Animado",
                    "Hoje estou animado",
                    20,
                  ),
                  icon: const Icon(Icons.bolt),
                  label: const Text("Animado"),
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () => mudarHumor(
                    "Calmo",
                    Colors.teal,
                    Icons.cloud,
                    "Tranquilo",
                    "Hoje estou tranquilo",
                    60, 
                  ),
                  icon: const Icon(Icons.cloud),
                  label: const Text("Calmo"),
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () => mudarHumor(
                    "Raiva",
                    Colors.red,
                    Icons.mood_bad,
                    "Raiva",
                    "Hoje estou com raiva",
                    20,
                  ),
                  icon: const Icon(Icons.mood_bad),
                  label: const Text("Bravo"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}