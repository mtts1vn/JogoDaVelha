import 'dart:io';

void limparConsole() {
  if (Platform.isWindows) {
    Process.runSync("cls", [], runInShell: true);
  } else {
    Process.runSync("clear", [], runInShell: true);
  }
}

void main() {
  bool play = true;

  String jgd = 'X';
  Jogo jogo = Jogo();
  print('O jogo começa com $jgd');

  while (play) {
    print('\nTabuleiro atual');
    jogo.mostrarTabuleiro();
    print('\nJogador atual: $jgd');
    print('\n\nOnde você gostaria de jogar? (Coluna e index)');

    print('Coluna: ');
    int col = int.parse(stdin.readLineSync().toString());
    print('Index: ');
    int idx = int.parse(stdin.readLineSync().toString());

    jogo.rplc(jgd, col, idx);
    jogo.mostrarTabuleiro();
    limparConsole();

    if (jogo.checarJogo()) {
      print('$jgd GANHOU O JOGO!!!');
      play = false;
    }
    jgd = jgd == 'X' ? 'O' : 'X';
  }
}

class Jogo {
  List<List<dynamic>> tab = [
    [' ', ' ', ' '],
    [' ', ' ', ' '],
    [' ', ' ', ' '],
  ];

  void rplc(String jgd, int cln, int idx) {
    tab[cln][idx] = jgd;
  }

  void mostrarTabuleiro() {
    print('C:0  ${tab[0][0]} | ${tab[0][1]} | ${tab[0][2]}');
    print('      --------');
    print('C:1  ${tab[1][0]} | ${tab[1][1]} | ${tab[1][2]}');
    print('      --------');
    print('C:2  ${tab[2][0]} | ${tab[2][1]} | ${tab[2][2]}');
  }

  bool checarJogo() {
    for (int i = 0; i < 3; i++) {
      if (tab[i][0] != ' ' &&
          tab[i][0] == tab[i][1] &&
          tab[i][0] == tab[i][2]) {
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (tab[0][i] != ' ' &&
          tab[0][i] == tab[1][i] &&
          tab[0][i] == tab[2][i]) {
        return true;
      }
    }
    if (tab[0][0] != ' ' && tab[0][0] == tab[1][1] && tab[0][0] == tab[2][2]) {
      return true;
    }
    if (tab[0][2] != ' ' && tab[0][2] == tab[1][1] && tab[0][2] == tab[2][0]) {
      return true;
    }
    return false;
  }
}
