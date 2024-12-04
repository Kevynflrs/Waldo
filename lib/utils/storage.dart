import 'dart:convert';
import 'dart:io';
import '../models/score.dart';

class Storage {
  static const String _fileName = 'scores.json';

  static Future<void> saveScores(List<Score> scores) async {
    final file = File(_fileName);
    final json = jsonEncode(scores.map((s) => s.toMap()).toList());
    await file.writeAsString(json);
  }

  static Future<List<Score>> loadScores() async {
    final file = File(_fileName);
    if (await file.exists()) {
      final json = await file.readAsString();
      final List<dynamic> jsonData = jsonDecode(json);
      return jsonData.map((e) => Score.fromMap(e)).toList();
    }
    return [];
  }
}
