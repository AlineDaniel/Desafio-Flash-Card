import 'package:fase_4/pages/deck_detail/deck_detail.store.dart';
import 'package:flutter/material.dart';

import '../../../models/deck.model.dart';
import '../../quiz/quiz.page.dart';

class StartQuizButton extends StatelessWidget {
  final DeckDetailStore store;
  const StartQuizButton({
    Key? key,
    required this.store,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 250,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => QuizPage(deck: store.deck!),
            ),
          );
        },
        child: const Text(
          key: Key("startQuiz"),
          "Iniciar Quiz",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
