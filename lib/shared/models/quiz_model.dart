import 'dart:convert';

import 'package:DevQuiz/shared/models/question_model.dart';

enum Level {
  easy,
  medium,
  hard,
  challenger,
}

extension LevelStringExt on String {
  Level get levelParse => {
        "easy": Level.easy,
        "medium": Level.medium,
        "hard": Level.hard,
        "challenger": Level.challenger
      }[this]!;
}

extension LevelExt on Level {
  String parse(String key) => {
        Level.easy: "easy",
        Level.medium: "medium",
        Level.hard: "hard",
       Level.challenger:  "challenger"
      }[key]!;
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionsAnswered;
  final String image;
  final Level level;

  QuizModel({
    required this.title,
    required this.questions,
    this.questionsAnswered = 0,
    required this.image,
    required this.level,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'questionsAnswered': questionsAnswered,
      'image': image,
      'level': level.parse,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'],
      questions: List<QuestionModel>.from(
          map['questions'].map((x) => QuestionModel.fromMap(x))),
      questionsAnswered: map['questionsAnswered'] ?? 0,
      image: map['image'],
      level: map['level'].toString().levelParse,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));
}
