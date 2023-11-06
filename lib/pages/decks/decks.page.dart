import 'package:fase_4/pages/decks/decks.store.dart';
import 'package:fase_4/pages/decks/widgets/deck_list.widget.dart';
import 'package:fase_4/pages/decks/widgets/empty_decks.widget.dart';
import 'package:fase_4/pages/new_deck/new_deck.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class DecksPage extends StatelessWidget {
  final _store = DecksStore();

  DecksPage({super.key}) {
    GetIt.I.allReady().then((_) => _store.loadDecks());
  }

  Future<void> _navigateToNewDeck(BuildContext context) async {
    final deckTitle = await Navigator.of(context).push<String>(
      MaterialPageRoute(
        builder: (_) => const NewDeckPage(),
      ),
    );

    if (deckTitle != null) {
      _store.addDeck(deckTitle);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Decks"),
        centerTitle: true,
      ),
      body: Observer(
        builder: (_) {
          if (_store.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }

          return _store.decks.isEmpty
              ? EmptyDecks(addDeck: () => _navigateToNewDeck(context))
              : DeckList(store: _store);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _navigateToNewDeck(context),
        label: const Text("Adicionar"),
        key:const Key("btnAdicionar"),
        backgroundColor: Colors.black,
      ),
    );
  }
}
