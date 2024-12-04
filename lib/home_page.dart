import 'package:flutter/material.dart';
import 'game_service.dart';
import 'game_page.dart';

class HomeScreen extends StatelessWidget {
  final GameService gameService;

  const HomeScreen({super.key, required this.gameService});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/8.jpg"), // <-- BACKGROUND IMAGE
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 0.35),
      body:Center(
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
      ),
    );
  }
}
