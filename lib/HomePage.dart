import 'package:flutter/material.dart';
import 'game_service.dart';
import 'GamePage.dart';

class HomeScreen extends StatelessWidget {
  final GameService gameService;

  const HomeScreen({super.key, required this.gameService});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Où est Charlie ?')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => GameScreen(gameService: gameService)),
            );
          },
          child: const Text("Commencer le jeu"),
        ),
      ),
    );
  }
}
