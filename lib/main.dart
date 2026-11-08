import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:udemy_admin/viewModel/create_quiz_provider.dart';
import 'package:udemy_admin/viewModel/topics_provider.dart';
import 'package:udemy_admin/views/home/home_page.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  try {
    await dotenv.load(fileName: '.env');
  } catch (e) {
    print('ENV ERROR $e');
  }
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QuestionProvider()),
        ChangeNotifierProvider(create: (_) => TopicsProvider()),
      ],
      child: AdminPanel(),
    ),
  );
}

class AdminPanel extends StatelessWidget {
  const AdminPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage(), debugShowCheckedModeBanner: false);
  }
}
