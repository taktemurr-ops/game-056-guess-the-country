/// Deterministic multiple-choice session engine; no Flutter dependency.
class QuizQuestion {
  final String prompt;
  final List<String> options;
  final int correctIndex;
  final String explanation;

  QuizQuestion(this.prompt, List<String> options, this.correctIndex,
      {this.explanation = ''})
      : options = List.unmodifiable(options) {
    if (prompt.trim().isEmpty || options.length < 2 ||
        options.toSet().length != options.length ||
        options.any((o) => o.trim().isEmpty) ||
        correctIndex < 0 || correctIndex >= options.length) {
      throw ArgumentError('Invalid quiz question');
    }
  }
}

class QuizSession {
  final List<QuizQuestion> questions;
  int index = 0;
  int score = 0;
  int correctAnswers = 0;
  final List<int> answers = [];

  QuizSession(List<QuizQuestion> questions)
      : questions = List.unmodifiable(questions) {
    if (questions.isEmpty) throw ArgumentError('At least one question required');
  }

  bool get completed => index >= questions.length;
  QuizQuestion? get current => completed ? null : questions[index];
  double get progress => index / questions.length;

  /// Returns true for a correct answer. Invalid inputs do not advance.
  bool answer(int selectedIndex) {
    final q = current;
    if (q == null) throw StateError('Session already completed');
    if (selectedIndex < 0 || selectedIndex >= q.options.length) {
      throw RangeError.index(selectedIndex, q.options, 'selectedIndex');
    }
    answers.add(selectedIndex);
    final correct = selectedIndex == q.correctIndex;
    if (correct) {
      correctAnswers++;
      score += 100;
    }
    index++;
    return correct;
  }

  void restart() {
    index = 0;
    score = 0;
    correctAnswers = 0;
    answers.clear();
  }
}
