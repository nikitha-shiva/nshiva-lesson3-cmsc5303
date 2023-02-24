import 'package:flutter/material.dart';
import 'package:lesson3/viewscreen/game_screen.dart';

void main() {
  runApp(const TicTacToeApp());
}

class TicTacToeApp extends StatelessWidget {
  const TicTacToeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: GameScreen.routeName, routes: {
      GameScreen.routeName: (context) => const GameScreen(),
    });
  }
}
