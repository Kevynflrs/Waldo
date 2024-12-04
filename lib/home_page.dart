import 'package:flutter/material.dart';
import 'game_service.dart';
import 'game_page.dart';
import 'rules_page.dart';

class HomeScreen extends StatelessWidget {
  final GameService gameService;

  const HomeScreen({super.key, required this.gameService});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/8.jpg"),
          fit: BoxFit.cover,
        ),
      ), // Image de fond
      child: Scaffold(
        backgroundColor: Color.fromRGBO(0, 0, 0, 0.35),//met la couleur de fond en transparent pour voir l'image de fond
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                  Text(
                    "Where's Waldo ?",
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,// épaisseur de la police
                      color: Colors.white,
                    ),
                  ),
              const SizedBox(height: 40),// br
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameScreen(gameService: gameService),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[400],
                ),
                child: Text(
                  "Start Games",
                  style: TextStyle(
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 4.0,// flou
                        color: Colors.black,// couleur de l'ombre
                        offset: Offset(2, 2),// décalage de l'ombre
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20), // br
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RulesScreen(gameService: gameService),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[400],
                ),
                child: Text(
                  "Rules",
                  style: TextStyle(
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 4.0,// flou
                        color: Colors.black, // couleur de l'ombre
                        offset: Offset(2, 2), // décalage de l'ombre
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
