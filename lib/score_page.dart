import 'package:flutter/material.dart';
import 'game_service.dart';

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