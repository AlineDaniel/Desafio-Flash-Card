// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

import 'package:fase_4/models/question.model.dart';

part 'deck.model.g.dart';

@HiveType(typeId: 1)
class Deck {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  final List<Question> questions;

  Deck({
    required this.id,
    required this.name,
    this.questions = const [],
  });

  Deck copyWith({
    String? id,
    String? name,
    List<Question>? questions,
  }) {
    return Deck(
      id: id ?? this.id,
      name: name ?? this.name,
      questions: questions ?? this.questions,
    );
  }
}
