import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:udemy_admin/constants/error_or_succes.dart';
import 'package:udemy_admin/viewModel/create_quiz_provider.dart';
import 'package:udemy_admin/viewModel/topics_provider.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  final TextEditingController _quizController = TextEditingController();
  final TextEditingController _keywordController = TextEditingController();
  final TextEditingController _answerController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final String selectedTopic = context.watch<TopicsProvider>().selectedTopic;
    QuestionProvider questionProvider = context.read<QuestionProvider>();
    bool isLoading = context.watch<QuestionProvider>().isLoading;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'QUESTION SECTION',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'JetBrainsMono',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Create and publish a question for developers',
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.55),
            fontFamily: 'JetBrainsMono',
            fontSize: 12,
          ),
        ),
        SizedBox(height: 24),
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
          width: 700,
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.65),
            border: Border.all(color: Colors.white.withValues(alpha: 0.25)),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: _quizController,
              maxLines: null,
              expands: true,
              textAlignVertical: TextAlignVertical.top,
              keyboardType: TextInputType.multiline,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'JetBrainsMono',
              ),
              decoration: InputDecoration(
                alignLabelWithHint: true,
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Question',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.65),
                        fontFamily: 'JetBrainsMono',
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '*',
                      style: TextStyle(
                        color: Colors.red,
                        fontFamily: 'JetBrainsMono',
                      ),
                    ),
                  ],
                ),
                hintText: 'Type your question here...',
                hintStyle: TextStyle(
                  color: Colors.white.withValues(alpha: 0.4),
                  fontFamily: 'JetBrainsMono',
                  fontSize: 13,
                ),
                contentPadding: EdgeInsets.only(top: 16, bottom: 12),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white.withValues(alpha: 0.2),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 24),
        _showKeyWordOrAnswer(
          label: 'Keyword',
          hint: 'Type the keyword here',
          controller: _keywordController,
        ),
        SizedBox(height: 20),
        _showKeyWordOrAnswer(
          label: 'Answer',
          hint: 'Type answer to the question here',
          controller: _answerController,
        ),
        SizedBox(height: 28),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                elevation: 0,
                padding: EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: isLoading
                  ? null
                  : () async {
                      if (_quizController.text.isEmpty ||
                          selectedTopic.isEmpty) {
                        showErrorOrSuccess(
                          context: context,
                          message: 'Please enter QUESTION and TOPIC',
                          backgroundColor: Colors.red,
                          icon: FontAwesomeIcons.circleExclamation,
                        );
                      } else {
                        //create a question
                        await questionProvider.createDbQuz(
                          topicName: selectedTopic,
                          question: _quizController.text,
                          answer: _answerController.text.trim(),
                          keyword: _keywordController.text.trim(),
                        );

                        if (!context.mounted) {
                          return;
                        }

                        if (questionProvider.errorMessage != null) {
                          showErrorOrSuccess(
                            context: context,
                            message: '${questionProvider.errorMessage}',
                            backgroundColor: Colors.red,
                            icon: FontAwesomeIcons.circleExclamation,
                          );
                          return;
                        } else if (questionProvider.quizResponse != null) {
                          showErrorOrSuccess(
                            context: context,
                            message:
                                'Question ${questionProvider.quizResponse?.quizId} created successfully\nunder topic ${questionProvider.quizResponse?.topicName}',
                            backgroundColor: Colors.green,
                            icon: FontAwesomeIcons.circleCheck,
                          );
                        }
                        _answerController.clear();
                        _quizController.clear();
                        _keywordController.clear();
                      }
                    },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  isLoading
                      ? CircularProgressIndicator(color: Colors.black)
                      : Text(
                          'Publish',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'JetBrainsMono',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  SizedBox(width: 10),
                  Icon(Icons.arrow_forward, size: 18, color: Colors.black),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _showKeyWordOrAnswer({
    required String label,
    required String hint,
    required TextEditingController controller,
  }) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: TextField(
          controller: controller,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'JetBrainsMono',
            fontSize: 14,
          ),
          decoration: InputDecoration(
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.75),
                    fontFamily: 'JetBrainsMono',
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  '--Optional--',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.4),
                    fontFamily: 'JetBrainsMono',
                  ),
                ),
              ],
            ),
            hintText: hint,
            hintStyle: TextStyle(
              color: Colors.white.withValues(alpha: 0.4),
              fontFamily: 'JetBrainsMono',
              fontSize: 13,
            ),

            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 4),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white.withValues(alpha: 0.2),
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.5),
            ),
          ),
        ),
      ),
    );
  }
}
