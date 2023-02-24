import 'package:flutter/material.dart';
import 'package:lesson3/model/tttgame_model.dart';

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
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          for(int r=0; r<3; r++)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int n = 0; n < 3; n++)

                SizedBox(
                 
                  width: MediaQuery.of(context).size.width / 4,
                   height: MediaQuery.of(context).size.width / 4,
                  child: OutlinedButton(
                    onPressed: null,
                    style:OutlinedButton.styleFrom(
                      side: const BorderSide(
                        width:3.0,
                        color:Colors.blue,
                      )
                    )
                    child: images[gameModel.board[r *3 +n]]!,
                  ),
                ),
            ],
          ),
        ],
      )),
    );
  }
}

class _Controller {
  _GameScreenState state;
  _Controller(this.state);
}
