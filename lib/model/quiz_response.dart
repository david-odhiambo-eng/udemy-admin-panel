class QuizResponse {
  int quizId;
  String topicName;

  QuizResponse({required this.quizId, required this.topicName});

  factory QuizResponse.fromJson(Map<String, dynamic> json) {
    return QuizResponse(quizId: json['quiz_id'], topicName: json['topic_name']);
  }
}
