// arquivo: humano_vs_bot.dart
// descrição: teste do jogo da velha com um jogador humano e um bot com jogadas aleatórias
// autor: Malki-çedheq Benjamim
// data: 08/01/2021

import '../model/tabuleiro.dart';
import 'dart:io';
import 'dart:math';

List<int> entradaDeCoordenada() {
  stdout.write('Informe a linha: ');
  int l = int.parse(stdin.readLineSync());
  stdout.write('Informe a coluna: ');
  int c = int.parse(stdin.readLineSync());
  return [l, c];
}

main() {
  bool resultado = false;
  List<int> coordenada = [0, 0];
  Tabuleiro jogoDaVelha = new Tabuleiro(
      fundo: ' ', j1Nome: 'Você', j2Nome: 'Bot José', j1Peca: 'x', j2Peca: 'o');

  print(
      'Jogo da velha iniciado! ${jogoDaVelha.espacosVazios()} espaços vazios.');
  int jogadas = 1;
  while (jogoDaVelha.espacosVazios() > 0) {
    coordenada[0] = Random().nextInt(3) + 1;
    coordenada[1] = Random().nextInt(3) + 1;
    if (jogadas % 2 == 0) {
      coordenada = entradaDeCoordenada();
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
