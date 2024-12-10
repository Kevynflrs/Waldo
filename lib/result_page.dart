import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalTime;

  const ResultScreen({super.key, required this.score, required this.totalTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/8.jpg"),
          fit: BoxFit.cover, // Image de fond
        ),
      ),
      child: Scaffold(
        backgroundColor:
            Colors.transparent, // Fond transparent pour voir l'image
        body: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize:
                    MainAxisSize.min, // Ajuste la taille en fonction du contenu
                children: [
                  // Div semi-transparente pour les textes
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.black
                          .withOpacity(0.5), // Fond semi-transparent
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // Ajuste la taille
                      children: [
                        Text(
                          "Score final : $score",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  // Bouton pour rejouer
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[400],
                    ),
                    child: const Text(
                      "Rejouer",
                      style: TextStyle(
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 4.0, // Flou
                            color: Colors.black, // Couleur de l'ombre
                            offset: Offset(2, 2), // Décalage de l'ombre
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
