import 'package:hive/hive.dart';

part 'question.model.g.dart';

@HiveType(typeId: 2)
class Question {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String ask;
  @HiveField(2)
  final String answer;

  Question({
    required this.id,
    required this.ask,
    required this.answer,
  });
}
