// arquivo:tabuleiro.dart
// descrição: classe para o tabuleiro do jogo da velha, contendo as regras
// autor: Malki-çedheq Benjamim
// data: 08/01/2021

import 'dart:io';
import 'jogador.dart';

class Tabuleiro {
  Jogador jogador1 = new Jogador(nome: 'Jogador1', peca: 'x');
  Jogador jogador2 = new Jogador(nome: 'Jogador2', peca: 'o');
  String vazio = '-';
  String vencedor = 'Empate';
  List<List<String>> tabuleiro = [
    ['-', '-', '-'],
    ['-', '-', '-'],
    ['-', '-', '-']
  ];

  Tabuleiro(
      {String fundo,
      String j1Nome,
      String j1Peca,
      String j2Nome,
      String j2Peca}) {
    String v = fundo;
    this.vazio = v;
    this.tabuleiro = [
      [v, v, v],
      [v, v, v],
      [v, v, v]
    ];
    this.jogador1.nome = j1Nome;
    this.jogador2.nome = j2Nome;
    this.jogador1.peca = j1Peca;
    this.jogador2.peca = j2Peca;
  }

  int espacosVazios() {
    int espacos = 0;
    for (var e1 in this.tabuleiro) {
      for (var e2 in e1) {
        if (e2 == this.vazio) {
          espacos++;
        }
      }
    }
    return espacos;
  }

  bool fazerJogada(int l, int c, Jogador jogador) {
    stdout.write('${jogador.nome} tentou jogar na posição $l,$c.');
    bool resultado = jogadaValida(l, c);
    if (resultado) {
      print('(Jogada válida!)');
      jogador.nJogadasValidas++;
      marcarPosicao(l, c, jogador.peca);
      print(tabuleiro[0]);
      print(tabuleiro[1]);
      print(tabuleiro[2]);
    } else {
      print('(Jogada inválida! Perdeu a vez.)');
      jogador.nJogadasInvalidas++;
    }
    jogador.nJogadas++;
    return checarVencedor(jogador); //true continua, false fim do jogo
  }

  bool jogadaValida(int l, int c) => this.tabuleiro[l - 1][c - 1] == this.vazio;

  void marcarPosicao(int l, int c, String peca) {
    this.tabuleiro[l - 1][c - 1] = peca;
  }

  bool checarVencedor(Jogador jogador) {
    bool vitoria;
    if (
        //vitoria por linhas
        this.tabuleiro[0][0] == jogador.peca &&
                this.tabuleiro[0][1] == jogador.peca &&
                this.tabuleiro[0][2] == jogador.peca ||
            this.tabuleiro[1][0] == jogador.peca &&
                this.tabuleiro[1][1] == jogador.peca &&
                this.tabuleiro[1][2] == jogador.peca ||
            this.tabuleiro[2][0] == jogador.peca &&
                this.tabuleiro[2][1] == jogador.peca &&
                this.tabuleiro[2][2] == jogador.peca
            //vitoria por colunas
            ||
            this.tabuleiro[0][0] == jogador.peca &&
                this.tabuleiro[1][0] == jogador.peca &&
                this.tabuleiro[2][0] == jogador.peca ||
            this.tabuleiro[0][1] == jogador.peca &&
                this.tabuleiro[1][1] == jogador.peca &&
                this.tabuleiro[2][1] == jogador.peca ||
            this.tabuleiro[0][2] == jogador.peca &&
                this.tabuleiro[1][2] == jogador.peca &&
                this.tabuleiro[2][2] == jogador.peca
            //vitoria por diagonais
            ||
            this.tabuleiro[0][0] == jogador.peca &&
                this.tabuleiro[1][1] == jogador.peca &&
                this.tabuleiro[2][2] == jogador.peca ||
            this.tabuleiro[0][2] == jogador.peca &&
                this.tabuleiro[1][1] == jogador.peca &&
                this.tabuleiro[2][0] == jogador.peca) {
      vitoria = true;
      this.vencedor = jogador.nome;
    } else {
      vitoria = false;
    }
    return vitoria;
  }

  String nomeVencedor() => this.vencedor;

  void resumoDaPartida() {
    print('__________________________________________________________');
    print('Detalhes de ${this.jogador1.nome}');
    print('Número de jogadas : ${this.jogador1.nJogadas}');
    print('Número de jogadas válidas : ${this.jogador1.nJogadasValidas}');
    print('Número de jogadas inválidas: ${this.jogador1.nJogadasInvalidas}');
    print('__________________________________________________________');
    print('Detalhes de ${this.jogador2.nome}:');
    print('Número de jogadas : ${this.jogador2.nJogadas}');
    print('Número de jogadas válidas: ${this.jogador2.nJogadasValidas}');
    print('Número de jogadas inválidas: ${this.jogador2.nJogadasInvalidas}');
    print('__________________________________________________________');
    print('Detalhes da partida');
    print(
        'Número total de jogadas na partida:${this.jogador1.nJogadas + this.jogador2.nJogadas}');
    print(
        'Número total de jogadas válidas:${this.jogador1.nJogadasValidas + this.jogador2.nJogadasValidas}');
    print(
        'Número total de jogadas inválidas:${this.jogador1.nJogadasInvalidas + this.jogador2.nJogadasInvalidas}');
    print('__________________________________________________________');
    print('Vencedor? ${this.nomeVencedor()} .');
  }
}
