import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Text('Gemini'),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
