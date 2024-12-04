import 'package:flutter/material.dart';
import 'game_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final GameService _gameService = GameService();

  MyApp({Key? key}) : super(key: key) {
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

  const HomeScreen({Key? key, required this.gameService}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Où est Charlie ?')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GameScreen(gameService: gameService)),
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

  const GameScreen({Key? key, required this.gameService}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trouve Charlie !')),
      body: Stack(
        children: [
          Image.asset('assets/background.png', fit: BoxFit.cover, width: double.infinity, height: double.infinity),
          Positioned(
            left: 200,
            top: 300,
            child: GestureDetector(
              onTap: () {
                gameService.addScore("Tzvetan", 100, 1);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScoreScreen(gameService: gameService)),
                );
              },
              child: Image.asset('assets/charlie.png', width: 50, height: 50),
            ),
          ),
        ],
      ),
    );
  }
}

class ScoreScreen extends StatelessWidget {
  final GameService gameService;

  const ScoreScreen({Key? key, required this.gameService}) : super(key: key);

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
            subtitle: Text('Niveau ${score.level}'),
          );
        },
      ),
    );
  }
}
