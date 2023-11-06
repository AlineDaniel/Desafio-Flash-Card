import 'package:fase_4/repositories/question.repository.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../models/question.model.dart';

part 'add_question.store.g.dart';

class AddQuestionStore = AddQuestionStoreBase with _$AddQuestionStore;

abstract class AddQuestionStoreBase with Store {
  @observable
  bool isLoading = false;

  @action
  Future<Question> addNewQuestion(
      {required String ask,
      required String answer,
      required String deckId}) async {
    isLoading = true;

    final repository = GetIt.I.get<QuestionRepository>();

    final question = Question(
      id: DateTime.now().millisecond.toString(),
      ask: ask,
      answer: answer,
    );

    await repository.addQuestion(
      question: question,
      deckId: deckId,
    );

    isLoading = false;

    return question;
  }
}
