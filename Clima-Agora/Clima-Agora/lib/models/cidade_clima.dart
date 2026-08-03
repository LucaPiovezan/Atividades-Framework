import 'package:flutter/material.dart';

class CidadeClima {
  String nome;
  double temperatura;
  String condicao;
  IconData icone;
  String imagem;

  CidadeClima({
    required this.nome,
    required this.temperatura,
    required this.condicao,
    required this.icone,
    required this.imagem,
  });
}

final List<CidadeClima> cidades = [
  CidadeClima(
    nome: 'Belo Horizonte',
    temperatura: 28,
    condicao: 'Ensolarado',
     icone: Icons.wb_sunny,
    imagem: 'https://unsplash.com',
  ),
  CidadeClima(
    nome: 'Curitiba',
    temperatura: 17,
    condicao: 'Chuvoso',
    icone: Icons.water_drop,
    imagem: 'https://unsplash.com',
  ),
  CidadeClima(
    nome: 'São Paulo',
    temperatura: 22,
    condicao: 'Nublado',
     icone: Icons.cloud,
    imagem: 'https://unsplash.com',
  ),
  CidadeClima(
    nome: 'Rio de Janeiro',
    temperatura: 32,
    condicao: 'Ensolarado',
    icone: Icons.wb_sunny,
    imagem: 'https://unsplash.com',
  ),
];
