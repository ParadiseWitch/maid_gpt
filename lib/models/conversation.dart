import 'package:json_annotation/json_annotation.dart';
import 'package:maid_gpt/models/message.dart';
import 'dart:convert';

part 'conversation.g.dart';

@JsonSerializable(explicitToJson: true)
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

  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);

  Map<String, dynamic> toJson() => _$ConversationToJson(this);

  static List<Conversation> decode(String conversations) =>
      (json.decode(conversations) as List<dynamic>)
          .map<Conversation>((item) => Conversation.fromJson(item))
          .toList();
}
