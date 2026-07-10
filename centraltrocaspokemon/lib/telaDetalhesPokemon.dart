import 'package:flutter/material.dart';
import 'telaListaPokemons.dart';

class TelaDetalhesPokemon extends StatefulWidget {
  final PokemonTroca pokemon;

  TelaDetalhesPokemon({required this.pokemon});

  @override
  State<TelaDetalhesPokemon> createState() => _TelaDetalhesPokemonState();
}

class _TelaDetalhesPokemonState extends State<TelaDetalhesPokemon> {
  bool propostaEnviada = false;

  void enviarProposta() {
    setState(() {
      propostaEnviada = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pokemon = widget.pokemon;

    return LayoutBuilder(
      builder: (context, constraints) {
        double largura = MediaQuery.of(context).size.width;
        bool isDesktop = largura >= 900;

        return Scaffold(
          appBar: AppBar(
            title: Text(pokemon.nome),
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
                          color: propostaEnviada ? Colors.green[100] : Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: propostaEnviada ? Colors.green : Colors.grey,
                            width: propostaEnviada ? 2 : 1,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.catching_pokemon, size: 28, color: Colors.red),
                                SizedBox(width: 8),
                                Text(
                                  pokemon.nome,
                                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text('Tipo: ${pokemon.tipo}'),
                            SizedBox(height: 4),
                            Text('Nível: ${pokemon.nivel}'),
                            SizedBox(height: 4),
                            Text('Treinador: ${pokemon.treinador}'),
                            SizedBox(height: 4),
                            Text('Pokémon desejado: ${pokemon.procura}'),
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
                        pokemon.descricao,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 24),
                      AnimatedOpacity(
                        opacity: propostaEnviada ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 500),
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.green[50],
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.green),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.check_circle, color: Colors.green, size: 24),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Proposta enviada! Aguardando resposta do treinador.',
                                  style: TextStyle(
                                    color: Colors.green[800],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: propostaEnviada ? null : enviarProposta,
                              child: Text(
                                propostaEnviada ? 'Proposta enviada' : 'Enviar proposta',
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
