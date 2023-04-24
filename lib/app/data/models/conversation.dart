import '../../../models/message.dart';

class Conversation {
  final String id;
  final String? name;
  final List<Message>? messages;

  String get displayName => name ?? '新会话';

  Conversation.name({required this.id, this.name, this.messages});
}
