import 'package:hive_flutter/adapters.dart';
import 'package:test_gemini/models/hive_models/single_chat_model.dart';

part 'chat_model.g.dart';

@HiveType(typeId: 1)
class ChatsModel{

  @HiveField(1)
  final String id;

  @HiveField(2)
  final List<Chat> chats;

  @HiveField(3)
  final DateTime lastChat;

  ChatsModel(this.chats, this.lastChat,this.id);
}
