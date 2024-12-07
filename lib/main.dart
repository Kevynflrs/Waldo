import 'package:flutter/material.dart';
import 'game_service.dart';
import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final GameService _gameService = GameService();

  MyApp({super.key}) {
    _gameService.getScore();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(gameService: _gameService),
    );
  }
}