import 'package:flutter/material.dart';

import '../model/tictactoe_model.dart';

class GameScreen extends StatefulWidget {
  static const routeName = '/gameScreen';

  const GameScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _GameScreenState();
  }
}

class _GameScreenState extends State<GameScreen> {
  late _Controller con;
  late TTTGame gameModel;

  final Map<Marking, Widget> images = {
    Marking.O: Image.asset('images/O.png'),
    Marking.X: Image.asset('images/X.png'),
    Marking.U: Image.asset('images/U.png'),
  };

  @override
  void initState() {
    super.initState();
    con = _Controller(this);
    gameModel = TTTGame();
  }

  void render(fn) {
    setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TicTacToe Game'),
        actions: [
          ElevatedButton(
            onPressed: gameModel.winner != null ? con.newGame : null,
            child: const Text('New'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (gameModel.winner == Marking.O)
                Text('Winner is O with ${gameModel.moves} moves',
                    style: const TextStyle(fontSize: 24.0))
              else if (gameModel.winner == Marking.X)
                Text('Winner is X with ${gameModel.moves} moves',
                    style: const TextStyle(fontSize: 24.0))
              else if (gameModel.winner == Marking.U)
                const Text('No winner Draw', style: TextStyle(fontSize: 24.0)),
              Row(
                children: [
                  const Text(
                    'Next Turn: ',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 30.0,
                    child: images[gameModel.turn],
                  ),
                  Text(
                    '    (Moves = ${gameModel.moves})',
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              for (int r = 0; r < 3; r++)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int n = 0; n < 3; n++)
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 4,
                        height: MediaQuery.of(context).size.width / 4,
                        child: OutlinedButton(
                          onPressed: gameModel.winner == null &&
                                  gameModel.board[r * 3 + n] == Marking.U
                              ? () => con.onBoardPressed(r * 3 + n)
                              : null,
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              width: 3.0,
                              color: Colors.blue,
                            ),
                          ),
                          child: images[gameModel.board[r * 3 + n]],
                        ),
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Controller {
  _GameScreenState state;
  _Controller(this.state);

  void onBoardPressed(int index) {
    state.render(() {
      state.gameModel.board[index] = state.gameModel.turn;
      state.gameModel.toggleTurns();
      state.gameModel.setWinner();
    });
  }

  void newGame() {
    state.render(() {
      state.gameModel = TTTGame();
    });
  }
}
