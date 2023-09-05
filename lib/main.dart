import 'package:flutter/material.dart';
import 'package:seno_card/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seno Card',
      theme: ThemeData(
        fontFamily: 'Comfortaa',
        focusColor: const Color.fromRGBO(255, 195, 73, 0.2),
        hoverColor: const Color.fromRGBO(255, 195, 73, 0.2),
        splashColor: const Color.fromRGBO(255, 195, 73, 0.2),
        highlightColor: const Color.fromRGBO(255, 195, 73, 0.2),
        iconTheme: const IconThemeData(color: Color.fromRGBO(255, 195, 73, 1)),
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(255, 195, 73, 1)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
