import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Gemini.init(apiKey: 'AIzaSyCauJcx_MmW-vUpCBWLwanWWAXA9gZZO6I');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gemini Chat bot',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(),
    );
  }
}
