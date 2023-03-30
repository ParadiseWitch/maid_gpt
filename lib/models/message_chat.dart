import 'package:uuid/uuid.dart';

enum Role { user, maid }

class Message {
  Message({
    required this.role,
    required this.msg,
    this.id = '',
  }) {
    id = const Uuid().v4();
  }

  String id;
  Role role;
  String msg;
}
