import 'package:json_annotation/json_annotation.dart';
import 'package:maid_gpt/models/role.dart';
import 'dart:convert';

part 'message.g.dart';

@JsonSerializable()
class Message {
  Message({
    required this.id,
    required this.role,
    required this.msg,
  });

  String id;
  Role role;
  String msg;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);

  static String encode(List<Message> msgList) => json.encode(
        msgList.map<Map<String, dynamic>>((msg) => msg.toJson()).toList(),
      );

  static List<Message> decode(String msg) => (json.decode(msg) as List<dynamic>)
      .map<Message>((item) => Message.fromJson(item))
      .toList();
}
