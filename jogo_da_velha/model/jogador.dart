// arquivo:jogador.dart
// descrição: classe para os jogadores do jogo da velha
// autor: Malki-çedheq Benjamim
// data: 08/01/2021

import 'tabuleiro.dart';

class Jogador {
  int nJogadas = 0;
  int nJogadasValidas = 0;
  int nJogadasInvalidas = 0;
  String peca;
  String nome;

  Jogador({this.nome, this.peca});
}
