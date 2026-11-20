import 'package:flutter/material.dart';

import '../app/game_api.dart';
import 'quiz_view.dart';
import 'rules.dart';

final gameConfig = GameConfig(
  gameId: 'game-056-guess-the-country',
  title: const ['Ülkeyi Tahmin Et', 'Guess The Country', 'Errate das Land', 'Adivina el País', 'Devine le Pays'],
  tagline: const ['Bayrak, başkent ve kıtalarla dünyayı keşfet!', 'Explore the world through flags and capitals!', 'Flaggen und Hauptstädte der Welt!', '¡Banderas y capitales del mundo!', 'Drapeaux et capitales du monde !'],
  seedColor: const Color(0xFF0077B6),
  icon: Icons.public,
  rules: CountryRules(),
  buildPlay: (ctx) => QuizView(ctx: ctx),
  tutorial: const [
    TutorialStep(Icons.flag, ['Bayrak hangi ülkenin?', 'Whose flag is it?', 'Wessen Flagge?', '¿De quién es la bandera?', 'À qui est ce drapeau ?']),
    TutorialStep(Icons.location_city, ['Başkent ve kıta soruları da var.', 'There are capital and continent questions too.', 'Auch Hauptstädte und Kontinente.', 'También capitales y continentes.', 'Aussi capitales et continents.']),
    TutorialStep(Icons.public, ['Zor bölümlerde şıklar aynı kıtadandır.', 'In hard levels options come from the same continent.', 'Schwer: Optionen vom selben Kontinent.', 'En difícil: mismo continente.', 'Difficile : même continent.']),
  ],
);
