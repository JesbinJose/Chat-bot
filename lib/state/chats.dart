
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class StreamChatProvider extends ChangeNotifier {
  final TextEditingController controller = TextEditingController();
  final gemini = Gemini.instance;
  bool _loading = false;
  List<Content> chats = [];

  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners(); // Notify listeners when loading state changes
  }

  void addChatMessage(String text) {
    if (text.isNotEmpty) {
      chats.add(
        Content(
          role: 'user',
          parts: [Parts(text: text)],
        ),
      );
      controller.clear();
      loading = true;
      gemini.streamChat(chats).listen(
        (value) {
          loading = false;
          if (chats.isNotEmpty && chats.last.role == value.content?.role) {
            chats.last.parts!.last.text =
                '${chats.last.parts!.last.text}${value.output}';
          } else {
            chats.add(
              Content(
                role: 'model',
                parts: [Parts(text: value.output)],
              ),
            );
          }
          notifyListeners(); // Notify listeners when chats or loading state changes
        },
      );
    }
  }
}
