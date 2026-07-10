import 'package:flutter/material.dart';
import 'cardPokemon.dart';
import 'telaDetalhesPokemon.dart';

class PokemonTroca {
  final String nome;
  final String tipo;
  final String nivel;
  final String treinador;
  final String procura;
  final String descricao;

  PokemonTroca({
    required this.nome,
    required this.tipo,
    required this.nivel,
    required this.treinador,
    required this.procura,
    required this.descricao,
  });
}

class TelaListaPokemons extends StatelessWidget {
  final List<PokemonTroca> pokemons = [
    PokemonTroca(
      nome: 'Pikachu',
      tipo: 'Elétrico',
      nivel: '18',
      treinador: 'Ash',
      procura: 'Bulbasaur',
      descricao:
          'Pikachu rápido e amigável, ótimo para batalhas elétricas e aventuras em equipe.',
    ),
    PokemonTroca(
      nome: 'Charmander',
      tipo: 'Fogo',
      nivel: '16',
      treinador: 'Misty',
      procura: 'Squirtle',
      descricao:
          'Charmander determinado, com grande potencial de evolução e ataques de fogo.',
    ),
    PokemonTroca(
      nome: 'Bulbasaur',
      tipo: 'Grama/Venenoso',
      nivel: '14',
      treinador: 'Brock',
      procura: 'Pikachu',
      descricao:
          'Bulbasaur equilibrado, ideal para treinadores que gostam de estratégia e resistência.',
    ),
    PokemonTroca(
      nome: 'Squirtle',
      tipo: 'Água',
      nivel: '15',
      treinador: 'May',
      procura: 'Charmander',
      descricao:
          'Squirtle tranquilo e resistente, muito útil em batalhas contra Pokémons do tipo fogo.',
    ),
    PokemonTroca(
      nome: 'Eevee',
      tipo: 'Normal',
      nivel: '20',
      treinador: 'Gary',
      procura: 'Pikachu',
      descricao:
          'Eevee raro e versátil, conhecido por suas várias possibilidades de evolução.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double largura = MediaQuery.of(context).size.width;
        bool isDesktop = largura >= 900;

        return Scaffold(
          appBar: AppBar(
            title: Text('Pokémons para Troca'),
          ),
          body: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: isDesktop ? 900 : double.infinity),
              child: isDesktop
                  ? GridView.builder(
                      padding: EdgeInsets.all(12),
                      itemCount: pokemons.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2.8,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemBuilder: (context, index) {
                        final pokemon = pokemons[index];
                        return CardPokemon(
                          nome: pokemon.nome,
                          tipo: pokemon.tipo,
                          nivel: pokemon.nivel,
                          treinador: pokemon.treinador,
                          procura: pokemon.procura,
                          aoClicar: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TelaDetalhesPokemon(pokemon: pokemon),
                              ),
                            );
                          },
                        );
                      },
                    )
                  : ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      itemCount: pokemons.length,
                      itemBuilder: (context, index) {
                        final pokemon = pokemons[index];
                        return CardPokemon(
                          nome: pokemon.nome,
                          tipo: pokemon.tipo,
                          nivel: pokemon.nivel,
                          treinador: pokemon.treinador,
                          procura: pokemon.procura,
                          aoClicar: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TelaDetalhesPokemon(pokemon: pokemon),
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
