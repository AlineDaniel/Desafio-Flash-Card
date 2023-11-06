import 'package:fase_4/models/deck.model.dart';
import 'package:fase_4/repositories/deck.repository.dart';
import 'package:fase_4/repositories/question.repository.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../models/question.model.dart';

part 'decks.store.g.dart';

class DecksStore = DecksStoreBase with _$DecksStore;

abstract class DecksStoreBase with Store {
  @observable
  ObservableList<Deck> decks = <Deck>[].asObservable();

  @observable
  bool isLoading = false;

  @action
  Future<void> loadDecks() async {
    isLoading = true;

    final deckRepository = GetIt.I.get<DeckRepository>();
    final questionRepository = GetIt.I.get<QuestionRepository>();

    // final allDecks = await Future.wait(
    //   (await deckRepository.getAllDecks()).map(
    //     (deck) async {
    //       final questions = await questionRepository.getQuestionsByDeck(
    //         deckId: deck.id,
    //       );
    //       return deck.copyWith(questions: questions);
    //     },
    //   ),
    // );

    final allDecks = await deckRepository.getAllDecks();

    for (var i = 0; i < allDecks.length; i++) {
      final questions = await questionRepository.getQuestionsByDeck(
        deckId: allDecks[i].id,
      );
      allDecks[i] = allDecks[i].copyWith(questions: questions);
    }

    decks = allDecks.asObservable();

    isLoading = false;
  }

  @action
  Future<void> addDeck(String deckTitle) async {
    isLoading = true;

    final repository = GetIt.I.get<DeckRepository>();

    final deck = Deck(
      id: DateTime.now().millisecond.toString(),
      name: deckTitle,
    );

    await repository.addNewDeck(deck);

    decks.add(deck);

    isLoading = false;
  }

  @action
  Future<void> removeDeck(String deckId) async {
    isLoading = true;

    final repository = GetIt.I.get<DeckRepository>();

    await repository.removeDeck(deckId);

    decks.removeWhere((deck) => deck.id == deckId);

    isLoading = false;
  }
}
