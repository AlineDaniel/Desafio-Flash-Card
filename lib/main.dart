import 'package:fase_4/models/deck.model.dart';
import 'package:fase_4/models/question.model.dart';
import 'package:fase_4/repositories/deck.repository.dart';
import 'package:fase_4/repositories/question.repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'pages/decks/decks.page.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(DeckAdapter());
  Hive.registerAdapter(QuestionAdapter());
}

void initServiceLocator() {
  GetIt.I.registerSingletonAsync<DeckRepository>(() async {
    final box = await Hive.openBox<Deck>("decks");
    return DeckRepository(box: box);
  });
  GetIt.I.registerSingletonAsync<QuestionRepository>(() async {
    final box = await Hive.openBox<List>("questions");
    return QuestionRepository(box: box);
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  initServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlashCard App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: DecksPage(),
    );
  }
}
