import 'package:flutter/material.dart';
import 'package:udemy_admin/backendService/create_quiz.dart';
import 'package:udemy_admin/model/quiz_response.dart';

class QuestionProvider extends ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;
  QuizResponse? _quizResponse;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  QuizResponse? get quizResponse => _quizResponse;

  Future<void> createDbQuz({
    required String topicName,
    required String question,
    String? keyword,
    String? answer,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    _quizResponse = null;
    notifyListeners();

    try {
      final response = await createQuestion(
        topicName: topicName,
        question: question,
        keyword: keyword,
        answer: answer,
      );
      _quizResponse = response;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
