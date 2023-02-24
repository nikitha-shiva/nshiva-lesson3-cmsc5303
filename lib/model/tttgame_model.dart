enum Marking { O, X, U }

class TTTGame {
  Marking? winner; // null: game in-progress,U: draw
  int moves = 0;
  Marking turn = Marking.X;

  List<Marking> board = [
    for (int i = 0; i < 9; i++) Marking.U,
  ];
}
