class GameService {
  int _totalScore = 0;

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

