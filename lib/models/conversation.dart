import 'package:maid_gpt/models/message_chat.dart';

class Conversation {
  Conversation({required this.id, required this.title, required this.msgList});
  String id;
  String title;
  List<Message> msgList;

  Message? getLastMsg() {
    int n = msgList.length;
    if (n <= 0) return null;
    return msgList[n - 1];
  }
}
