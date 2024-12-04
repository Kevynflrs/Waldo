import 'package:flutter/material.dart';
import 'game_service.dart';
import 'ScorePage.dart';

class GameScreen extends StatelessWidget {
  final GameService gameService;

  const GameScreen({super.key, required this.gameService});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trouve Charlie !')),
      body: Stack(
        children: [
          Image.asset('images/1.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity),
          Positioned(
            left: 200,
            top: 300,
            child: GestureDetector(
              onTap: () {
                gameService.addScore("Joueur", 100);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ScoreScreen(gameService: gameService)),
                );
              },
              child: Image.asset('images/waldo.png', width: 50, height: 50),
            ),
          ),
        ],
      ),
    );
  }
}