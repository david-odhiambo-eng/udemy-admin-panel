import 'package:flutter/material.dart';

class TopicsProvider extends ChangeNotifier {
  String selectedTopic = '';

  void selectTopic({required String newTopic}) {
    selectedTopic = newTopic.toLowerCase();
    notifyListeners();
  }
}
