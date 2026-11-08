import 'package:flutter/material.dart';
import 'package:udemy_admin/views/home/home_image.dart';
import 'package:udemy_admin/views/home/questions.dart';
import 'package:udemy_admin/views/home/topics_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: HomeImage(
            child: Column(
              children: [
                SizedBox(height: 30),
                Text(
                  'DEV MODE ADMIN PANEL',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'JetBrainsMono',
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: 800,
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.65),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.05),
                    ),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Select Topic',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'JetBrainsMono',
                                ),
                              ),
                              SizedBox(width: 30,),
                              TopicsPage(),
                              
                            ],
                          ),
                          SizedBox(height: 40,),
                          Questions()
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
