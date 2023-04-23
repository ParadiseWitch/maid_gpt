import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:maid_gpt/models/conversation.dart';
import 'package:maid_gpt/models/message.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'store.g.dart';

String localKey = "store";

@JsonSerializable(explicitToJson: true)
class Store with ChangeNotifier {
  Store();

  Map<String, Conversation> convMap = {};

  addConv(Conversation conv) {
    String cid = conv.id;
    convMap.putIfAbsent(cid, () => conv);
    notifyListeners();

    // 存本地
    save2Local();
  }

  delConv(String cid) {
    convMap.remove(cid);
    notifyListeners();

    save2Local();
  }

  void addConvMsg(String cid, Message msg) {
    Conversation? conv = convMap[cid];
    if (conv == null) return;
    conv.msgList.add(msg);
    notifyListeners();

    save2Local();
  }

  modifyConvLastMsg(String cid, String newMsg) {
    Conversation? conv = convMap[cid];
    if (conv == null) return;
    List<Message> msgList = conv.msgList;
    msgList[msgList.length - 1].msg = newMsg;

    notifyListeners();
    save2Local();
  }

  void clearConvMsgs(String cid) {
    Conversation? conv = convMap[cid];
    if (conv == null) return;
    conv.msgList = [];
    notifyListeners();

    save2Local();
  }

  void changeConvTitle(String cid, String title) {
    Conversation? conv = convMap[cid];
    if (conv == null) return;
    conv.title = title;
    notifyListeners();

    save2Local();
  }

  save2Local() async {
    // SharedPreferences sp = await SharedPreferences.getInstance();
    // String mapStr = toMapStr();
    // sp.setString(localKey, mapStr);
  }

  Map<String, Map<String, Conversation>> toMap() {
    return {'convMap': convMap};
  }

  String toMapStr() {
    return json.encode(toMap());
  }

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

  Map<String, dynamic> toJson() => _$StoreToJson(this);
}
