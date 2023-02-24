import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    con = _Controller(this);
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
      body: const Text('Tic Tac Toe game board'),
    );
  }
}

class _Controller {
  _GameScreenState state;
  _Controller(this.state);
}
