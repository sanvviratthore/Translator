import 'package:flutter/material.dart';
import 'package:translate_001/language_translation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Language Translator',
      debugShowCheckedModeBanner: false,
      home: LanguageTranslation()
    );
  }
}
