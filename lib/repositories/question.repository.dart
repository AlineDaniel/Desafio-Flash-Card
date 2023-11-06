import 'package:hive/hive.dart';

import '../models/question.model.dart';

class QuestionRepository {
  final Box<List> _box;

  QuestionRepository({required Box<List> box}) : _box = box;

  Future<List<Question>> getQuestionsByDeck({required String deckId}) async {
    await Future.delayed(const Duration(seconds: 1));
    final questions = _box.get("questions:$deckId", defaultValue: [])!;
    return List<Question>.from(questions);
  }

  Future<void> addQuestion({
    required Question question,
    required String deckId,
  }) async {
    final questions = await getQuestionsByDeck(deckId: deckId);
    questions.add(question);
    await _box.put("questions:$deckId", questions);
  }
}
