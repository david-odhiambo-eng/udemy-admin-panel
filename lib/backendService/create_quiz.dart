import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:udemy_admin/model/quiz_response.dart';

Future<QuizResponse> createQuestion({
  required String topicName,
  required String question,
  String? keyword,
  String? answer,
}) async {
  final baseUrl = dotenv.env['BASE_URL'];
  final url = Uri.parse('$baseUrl/topic_quiz');
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({
    'topic_data': {'topic_name': topicName},
    'quiz_data': {'quiz': question, 'answer': answer, 'key_word': keyword, 'topic': topicName},
  });

  try {
    final response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      return QuizResponse.fromJson(data);
    } else if (response.statusCode == 409) {
      final error = jsonDecode(response.body);
      throw Exception(error['detail']);
    } else {
      throw '${response.statusCode}';
    }
  } catch (e) {
    rethrow;
  }
}
