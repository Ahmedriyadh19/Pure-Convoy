import 'package:flutter/material.dart';
import 'package:pure_convoy/MainPage/ui/main_page_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pure Convoy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor:  Colors.brown),
        useMaterial3: true,
      ),
      home: const MainPageUi(),
    );
  }
}
