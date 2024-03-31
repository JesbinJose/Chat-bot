import 'package:hive_flutter/adapters.dart';
import 'package:test_gemini/models/hive_models/chat_model.dart';
import 'package:test_gemini/models/hive_models/single_chat_model.dart';

class ChatsControls {
  late Box<ChatsModel> _box;
  Future<void> init() async {
    Hive.registerAdapter(ChatsModelAdapter());
    _box = await Hive.openBox<ChatsModel>('chats');
  }

  List<ChatsModel> getAllChats() {
    return _box.values.toList();
  }

  Future<int> newChat(ChatsModel model) async {
    return await _box.add(model);
  }

  Future<bool> updateChat(List<Chat> chats, String id) async {
    try {
      for (var e in _box.keys) {
        final ChatsModel m = _box.get(e)!;
        if (m.id == id) {
          m.chats.addAll(chats);
          await _box.put(e, m);
          return true;
        }
      }
    } catch (_) {}
    return false;
  }
}
