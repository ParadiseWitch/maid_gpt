// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Store _$StoreFromJson(Map<String, dynamic> json) => Store()
  ..convMap = (json['convMap'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, Conversation.fromJson(e as Map<String, dynamic>)),
  );

Map<String, dynamic> _$StoreToJson(Store instance) => <String, dynamic>{
      'convMap': instance.convMap.map((k, e) => MapEntry(k, e.toJson())),
    };
