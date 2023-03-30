import 'package:maid_gpt/models/message_chat.dart';
import 'package:uuid/uuid.dart';

class Conversation {
  Conversation({
    this.title = '未命名',
    this.id = '',
  }) {
    id = const Uuid().v4();
  }
  String id;
  String title;
  Message? lastMessage;
}
