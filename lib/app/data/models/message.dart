enum MessageType { text, image, loading, error }

class Message {
  final String? id;
  final String? text;
  final MessageType? type;
  final DateTime? createAt;
  final String? conversationId;

  Message({this.id, this.text, this.type, this.createAt, this.conversationId});
}
