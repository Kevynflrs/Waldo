import 'package:flutter/material.dart';
import 'game_service.dart';
import 'HomePage.dart';

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