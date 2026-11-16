import 'package:test/test.dart';
import '../lib/game/quiz_session.dart';

void main() {
  test('correct and incorrect answers update score and progress', () {
    final game = QuizSession([
      QuizQuestion('Capital?', ['Paris', 'Rome'], 0),
      QuizQuestion('2+2?', ['3', '4'], 1),
    ]);
    expect(game.answer(0), isTrue);
    expect(game.score, 100);
    expect(game.progress, 0.5);
    expect(game.answer(0), isFalse);
    expect(game.completed, isTrue);
    expect(game.correctAnswers, 1);
    expect(game.answers, [0, 0]);
  });

  test('invalid answer does not consume a question', () {
    final game = QuizSession([QuizQuestion('A?', ['a', 'b'], 0)]);
    expect(() => game.answer(3), throwsRangeError);
    expect(game.index, 0);
    expect(game.score, 0);
  });

  test('restart resets a completed game', () {
    final game = QuizSession([QuizQuestion('A?', ['a', 'b'], 0)]);
    game.answer(0);
    expect(() => game.answer(0), throwsStateError);
    game.restart();
    expect(game.completed, isFalse);
    expect(game.score, 0);
    expect(game.answers, isEmpty);
  });

  test('invalid questions are rejected', () {
    expect(() => QuizSession([]), throwsArgumentError);
    expect(() => QuizQuestion('', ['a', 'b'], 0), throwsArgumentError);
    expect(() => QuizQuestion('x', ['a', 'a'], 0), throwsArgumentError);
  });
}
