enum Role { user, maid }

class Message {
  Message({
    required this.id,
    required this.role,
    required this.msg,
  });

  String id;
  Role role;
  String msg;
}
