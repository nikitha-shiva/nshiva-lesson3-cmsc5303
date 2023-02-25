enum Marking { O, X, U }

class TTTGame {
  Marking? winner;
  int moves = 0;
  Marking turn = Marking.X;

  List<Marking> board = [
    for (int i = 0; i < 9; i++) Marking.U,
  ];

  void toggleTurns() {
    turn = turn == Marking.O ? Marking.X : Marking.O;
    ++moves;
  }

  void setWinner() {
    for (int i = 0; i < 3; i++) {
      winner = _checkRow(i);
      if (winner != null) return;
      winner = _checkCol(i);
      if (winner != null) return;
    }

    winner = _checkDiag1();
    if (winner != null) return;
    winner = _checkDiag2();
    if (winner != null) return;

    if (moves == 9) {
      winner = Marking.U;
      return;
    }

    winner = null;
  }

  Marking? _checkRow(int n) {
    if (board[n * 3] != Marking.U &&
        board[n * 3] == board[n * 3 + 1] &&
        board[n * 3] == board[n * 3 + 2]) {
      return board[n * 3];
    } else {
      return null;
    }
  }

  Marking? _checkCol(int n) {
    if (board[n] != Marking.U &&
        board[n] == board[n + 3] &&
        board[n] == board[n + 6]) {
      return board[n];
    } else {
      return null;
    }
  }

  Marking? _checkDiag1() {
    if (board[0] != Marking.U && board[0] == board[4] && board[0] == board[8]) {
      return board[0];
    } else {
      return null;
    }
  }

  Marking? _checkDiag2() {
    if (board[2] != Marking.U && board[2] == board[4] && board[2] == board[6]) {
      return board[2];
    } else {
      return null;
    }
  }
}
