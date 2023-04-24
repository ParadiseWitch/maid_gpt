
import 'package:get/get.dart';

import '../../data/models/conversation.dart';
import '../mixin/app_controller_mixin.dart';

class HomePageController extends GetxController with AppControllerMixin{
  int _currentConversationIndex = -1;
  int get currentConversationIndex => _currentConversationIndex;
  set currentConversationIndex(int currentConversationIndex) {
    if (_currentConversationIndex == currentConversationIndex) return;
    _currentConversationIndex = currentConversationIndex;
  }

  final List<Conversation> conversations = [];
  Conversation? get currentConversation =>
      conversations.isEmpty || currentConversationIndex == -1
          ? null
          : conversations[currentConversationIndex];

}