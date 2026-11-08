import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:udemy_admin/viewModel/topics_provider.dart';

class TopicsPage extends StatefulWidget {
  const TopicsPage({super.key});

  @override
  State<TopicsPage> createState() => _TopicsPageState();
}

class _TopicsPageState extends State<TopicsPage> {
  bool _isTopicSelected = false;
  
  @override
  Widget build(BuildContext context) {
    final String selectedTopic = context.watch<TopicsProvider>().selectedTopic;
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.white,
          child: IconButton(
            tooltip: 'Choose a topic',
            onPressed: () {
              _showTopics();
            },
            icon: FaIcon(
              FontAwesomeIcons.chevronDown,
              color: Colors.black,
              size: 18,
            ),
          ),
        ),
        SizedBox(width: 20),
        _isTopicSelected
            ? GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.25),
                    ),
                  ),
                  child: Text(
                    selectedTopic,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'JetBrainsMono',
                    ),
                  ),
                ),
              )
            : SizedBox.shrink(),
      ],
    );
  }

  //alert dialog
  Future<dynamic> _showTopics() {
    TopicsProvider topicsProvider = context.read<TopicsProvider>();
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black.withValues(alpha: 0.85),
          elevation: 12,
          insetPadding: EdgeInsets.symmetric(horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(20),
            side: BorderSide(color: Colors.white.withValues(alpha: 0.15)),
          ),
          title: Text(
            'Choose a Topic',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'JetBrainsMono',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SizedBox(
            width: 340,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'JetBrainsMono',
                    ),
                    decoration: InputDecoration(
                      hintText: 'Search Topics',
                      hintStyle: TextStyle(
                        color: Colors.white70,
                        fontFamily: 'JetBrainsMono',
                        fontSize: 14,
                      ),
                      prefixIcon: Icon(Icons.search, color: Colors.white70),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 15,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      fillColor: Colors.black,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  _showTopicNames(
                    topicName: 'DSA',
                    onTap: () {
                      setState(() {
                        topicsProvider.selectTopic(newTopic: 'DSA');
                        _isTopicSelected = true;
                      });
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: 12),
                  _showTopicNames(
                    topicName: 'Python',
                    onTap: () {
                      setState(() {
                        topicsProvider.selectTopic(newTopic: 'Python');
                        _isTopicSelected = true;
                      });
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: 12),
                  _showTopicNames(
                    topicName: 'Dart',
                    onTap: () {
                      setState(() {
                        topicsProvider.selectTopic(newTopic: 'Dart');
                        _isTopicSelected = true;
                      });
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: 12),
                  _showTopicNames(
                    topicName: 'Git',
                    onTap: () {
                      setState(() {
                        topicsProvider.selectTopic(newTopic: 'Git');
                        _isTopicSelected = true;
                      });
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: 12),
                  _showTopicNames(
                    topicName: 'Backend',
                    onTap: () {
                      setState(() {
                        topicsProvider.selectTopic(newTopic: 'Backend');
                        _isTopicSelected = true;
                      });
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: 12),
                  _showTopicNames(
                    topicName: 'Web',
                    onTap: () {
                      setState(() {
                        topicsProvider.selectTopic(newTopic: 'Web');
                        _isTopicSelected = true;
                      });
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: 12),
                  _showTopicNames(
                    topicName: 'Docker',
                    onTap: () {
                      setState(() {
                        topicsProvider.selectTopic(newTopic: 'Docker');
                        _isTopicSelected = true;
                      });
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: 12),
                  _showTopicNames(
                    topicName: 'C++',
                    onTap: () {
                      setState(() {
                        topicsProvider.selectTopic(newTopic: 'C++');
                        _isTopicSelected = true;
                      });
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: 12),
                  _showTopicNames(
                    topicName: 'Go',
                    onTap: () {
                      setState(() {
                        topicsProvider.selectTopic(newTopic: 'Go');
                        _isTopicSelected = true;
                      });
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: 12),
                  _showTopicNames(
                    topicName: 'System Design',
                    onTap: () {
                      setState(() {
                        topicsProvider.selectTopic(newTopic: 'System Design');
                        _isTopicSelected = true;
                      });
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _showTopicNames({
    required String topicName,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onTap,
        child: Row(
          children: [
            Expanded(
              child: Text(
                topicName,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'JetBrainsMono',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            FaIcon(
              FontAwesomeIcons.chevronRight,
              color: Colors.black54,
              size: 12,
            ),
          ],
        ),
      ),
    );
  }
}
