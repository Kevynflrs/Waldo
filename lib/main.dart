import 'package:flutter/material.dart';
import 'game_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final GameService _gameService = GameService();

  MyApp({super.key}) {
    _gameService.loadScores();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(gameService: _gameService),
    );
  }
}

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

class ScoreScreen extends StatelessWidget {
  final GameService gameService;

  const ScoreScreen({super.key, required this.gameService});

  @override
  Widget build(BuildContext context) {
    final scores = gameService.getScores();
    return Scaffold(
      appBar: AppBar(title: const Text('Classement')),
      body: ListView.builder(
        itemCount: scores.length,
        itemBuilder: (context, index) {
          final score = scores[index];
          return ListTile(
            title: Text('${score.playerName} - ${score.score} points'),
          );
        },
      ),
    );
  }
}
