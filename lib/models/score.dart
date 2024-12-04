class Score {
  final String playerName;
  final int score;
  final DateTime date;

  Score({required this.playerName, required this.score, required this.date});

  Map<String, dynamic> toMap() {
    return {'playerName': playerName, 'score': score, 'date': date.toIso8601String()};
  }

  factory Score.fromMap(Map<String, dynamic> map) {
    return Score(
      playerName: map['playerName'],
      score: map['score'],
      date: DateTime.parse(map['date']),
    );
  }
}
