import 'package:hive_flutter/adapters.dart';

part 'single_chat_model.g.dart';

@HiveType(typeId: 1)
class Chat {
  @HiveField(1)
  final String content;

  @HiveField(2)
  final DateTime time;

  Chat(this.content, this.time);
}
