import 'package:flutter/material.dart';
import 'package:tarf/presentation/pages/word_content.dart';
import '../widgets/app_bar.dart';
import '../widgets/bottom_navigation_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(),
      bottomNavigationBar: BottomNavigationBarWidget(),
      body: WordContent(),
    );
  }
}
