import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:provider/provider.dart';
import 'package:test_gemini/api_key.dart';
import 'package:test_gemini/presentation/home/home.dart';
import 'package:test_gemini/state/chats.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Gemini.init(apiKey: geminiApiKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gemini Chat bot',
      theme: ThemeData.dark(),
      home: ChangeNotifierProvider<StreamChatProvider>(
        create: (context) => StreamChatProvider(),
        child: const HomeScreen(),
      ),
    );
  }
}
