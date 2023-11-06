import 'package:hive/hive.dart';

import '../models/deck.model.dart';

class DeckRepository {
  final Box<Deck> _box;

  DeckRepository({
    required Box<Deck> box,
  }) : _box = box;

  Future<List<Deck>> getAllDecks() async {
    await Future.delayed(const Duration(seconds: 1));
    final decks = _box.keys.map((key) => _box.get(key)!).toList();
    return decks;
  }

  Future<void> addNewDeck(Deck deck) async {
    await Future.delayed(const Duration(seconds: 1));
    await _box.put("decks:${deck.id}", deck);
  }

  Future<void> removeDeck(String deckId) async {
    await Future.delayed(const Duration(seconds: 1));
    await _box.delete("decks:$deckId");
  }
}
