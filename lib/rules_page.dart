import 'package:flutter/material.dart';
import 'game_service.dart';
import 'game_page.dart';
import 'home_page.dart';

class RulesScreen extends StatelessWidget {
  final GameService gameService;

  const RulesScreen({super.key, required this.gameService});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/19.jpg"),
          fit: BoxFit.cover,
        ),
      ), // Image de fond
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0.35), // Fond transparent pour voir l'image de fond
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Rules",
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold, // Épaisseur de la police
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20), //br
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F2F6).withOpacity(0.75),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "Le but du jeu est simple : trouvez Waldo, caché dans l'image !"
                  "Utilisez vos doigts pour zoomer et déplacer l'image afin d'explorer tous les détails. "
                  "Une fois que vous avez repéré Waldo, touchez-le pour terminer le niveau. "
                  "Plus vous avancez, plus les niveaux deviennent difficiles, avec des images plus grandes et Waldo mieux caché. "
                  "Soyez rapide, car votre score dépend du temps que vous mettez !",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(height: 40), //br
              Row(
                mainAxisAlignment: MainAxisAlignment.center,// centre les boutons
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(gameService: gameService), // Retour à l'écran d'accueil
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[400],
                    ),
                    child: const Text(
                      "Back",
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
                  const SizedBox(width: 20), // br
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GameScreen(gameService: gameService),// Commencer le jeu
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[400],
                    ),
                    child: const Text(
                      "Start Game",
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
            ],
          ),
        ),
      ),
    );
  }
}
