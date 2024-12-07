import 'dart:async';
import 'package:flutter/material.dart';
import 'game_service.dart';
import 'result_page.dart';

class GameScreen extends StatefulWidget {
  final GameService gameService;

  const GameScreen({super.key, required this.gameService});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int level = 1;
  late Timer _timer;
  int _elapsedTime = 0;
  bool charlieFound = false;

  final List<Map<String, double>> charlieCoordinates = [
    {'x': 135, 'y': 290},
    {'x': 18, 'y': 328},
    {'x': 260, 'y': 265},
  ];

  final TransformationController _viewTransformationController =
      TransformationController();

  @override
  void initState() {
    super.initState();
    startTimer();

    // Initialisation du zoom et de la translation
    const zoomFactor = 3.0;
    const xTranslate = 500.0;
    const yTranslate = 600.0;
    _viewTransformationController.value.setEntry(0, 0, zoomFactor);
    _viewTransformationController.value.setEntry(1, 1, zoomFactor);
    _viewTransformationController.value.setEntry(2, 2, zoomFactor);
    _viewTransformationController.value.setEntry(0, 3, -xTranslate);
    _viewTransformationController.value.setEntry(1, 3, -yTranslate);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  // Fonction pour démarrer le chronomètre
  void startTimer() {
    _elapsedTime = 0;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedTime++;
      });
    });
  }

  // Fonction pour gérer la victoire
  void onCharlieFound() {
    setState(() {
      charlieFound = true;
    });
    _timer.cancel();

    widget.gameService.addScore("Joueur", calculateScore());
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Bravo !"),
        content: Text(
          "Vous avez trouvé Charlie en $_elapsedTime secondes !\n"
          "Score : ${calculateScore()}",
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              nextLevel();
            },
            child: const Text("Niveau suivant"),
          ),
        ],
      ),
    );
  }

  // Calcul du score basé sur le temps
  int calculateScore() {
    return 1000 ~/ (_elapsedTime + 1);
  }

  // Passer au niveau suivant
  void nextLevel() {
    if (level < charlieCoordinates.length) {
      setState(() {
        level++;
        charlieFound = false;
        startTimer();
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            score: widget.gameService.getScore(),
            totalTime: _elapsedTime,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Coordonnées actuelles de Charlie
    final charliePos = charlieCoordinates[level - 1];

    return Scaffold(
      appBar: AppBar(
        title: Text('Niveau $level'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text("Temps : $_elapsedTime s"),
            ),
          ),
        ],
      ),
      body: Center(
        child: InteractiveViewer(
          transformationController: _viewTransformationController,
          panEnabled: true,
          scaleEnabled: true,
          minScale: 1.0,
          maxScale: 5.0,
          child: Stack(
            children: [
              // Image de fond
              Image.asset(
                'images/$level.jpg',
                fit: BoxFit.scaleDown,
                width: double.infinity,
                height: double.infinity,
              ),
              // Zone cliquable de Charlie
              Positioned(
                left: charliePos['x']!,
                top: charliePos['y']!,
                child: GestureDetector(
                  onTap: () {
                    if (!charlieFound) onCharlieFound();
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.transparent,
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
