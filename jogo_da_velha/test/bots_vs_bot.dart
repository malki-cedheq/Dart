// arquivo: bot_vs_bot.dart
// descrição: teste do jogo da velha com 2 bots com jogadas aleatórias
// autor: Malki-çedheq Benjamim
// data: 08/01/2021

import '../model/tabuleiro.dart';
import 'dart:math';

main() {
  bool resultado = false;
  List<int> coordenada = [0, 0];
  Tabuleiro jogoDaVelha = new Tabuleiro(
      fundo: ' ',
      j1Nome: 'Bot Maria',
      j2Nome: 'Bot José',
      j1Peca: 'x',
      j2Peca: 'o');

  print(
      'Jogo da velha iniciado! ${jogoDaVelha.espacosVazios()} espaços vazios.');
  int jogadas = 1;
  while (jogoDaVelha.espacosVazios() > 0) {
    coordenada[0] = Random().nextInt(3) + 1;
    coordenada[1] = Random().nextInt(3) + 1;
    if (jogadas % 2 == 0) {
      resultado = jogoDaVelha.fazerJogada(
          coordenada[0], coordenada[1], jogoDaVelha.jogador1);
    } else {
      resultado = jogoDaVelha.fazerJogada(
          coordenada[0], coordenada[1], jogoDaVelha.jogador2);
    }
    if (resultado) break;
    jogadas++;
  }
  jogoDaVelha.resumoDaPartida();
}
