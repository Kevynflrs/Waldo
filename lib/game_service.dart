import 'models/score.dart';
import 'utils/storage.dart';

class GameService {
  List<Score> _scores = [];

  void addScore(String playerName, int score) {
    final newScore = Score(playerName: playerName, score: score, date: DateTime.now());
    _scores.add(newScore);
    _saveScores();
  }

  List<Score> getScores() {
    _scores.sort((a, b) => b.score.compareTo(a.score));
    return _scores;
  }

  void _saveScores() {
    Storage.saveScores(_scores);
  }

  void loadScores() async {
    _scores = await Storage.loadScores();
  }
}
