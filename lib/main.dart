import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:seno_card/components/logic/storage_logic.dart';
import 'package:seno_card/firebase_options.dart';
import 'package:seno_card/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    StorageLogic();

    return MaterialApp(
      title: 'Seno Card',
      theme: ThemeData(
        fontFamily: 'Comfortaa',
        focusColor: const Color.fromARGB(68, 255, 194, 73),
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
