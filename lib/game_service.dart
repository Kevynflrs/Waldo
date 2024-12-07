// import 'models/score.dart';
// import 'utils/storage.dart';

class GameService {
  int _totalScore = 0; // Variable privée pour stocker le score total

  // Ajoute des points au score total
  void addScore(String player, int score) {
    _totalScore += score;
  }

  // Retourne le score total
  int getScore() {
    return _totalScore;
  }

  // Réinitialise le score (optionnel)
  void resetScore() {
    _totalScore = 0;
  }
}

