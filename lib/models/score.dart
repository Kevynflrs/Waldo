class Score {
  final String playerName;
  final int score;
  final int level;
  final DateTime date;

  Score({required this.playerName, required this.score, required this.level, required this.date});

  Map<String, dynamic> toMap() {
    return {'playerName': playerName, 'score': score, 'level': level, 'date': date.toIso8601String()};
  }

  factory Score.fromMap(Map<String, dynamic> map) {
    return Score(
      playerName: map['playerName'],
      score: map['score'],
      level: map['level'],
      date: DateTime.parse(map['date']),
    );
  }
}
