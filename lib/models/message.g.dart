// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      id: json['id'] as String,
      role: $enumDecode(_$RoleEnumMap, json['role']),
      msg: json['msg'] as String,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'id': instance.id,
      'role': _$RoleEnumMap[instance.role]!,
      'msg': instance.msg,
    };

const _$RoleEnumMap = {
  Role.user: 'user',
  Role.maid: 'maid',
};
