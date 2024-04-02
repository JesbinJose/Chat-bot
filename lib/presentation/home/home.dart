import 'package:flutter/material.dart';
import 'package:test_gemini/presentation/widgets/chat_stream.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/background.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: const StreamChatWidget(),
      ),
    );
  }
}
