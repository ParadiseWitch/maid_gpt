import 'package:get/get_navigation/src/routes/get_route.dart';

import '../binding/home_binding.dart';
import '../pages/home_page.dart';
import '../pages/conversation_page.dart';

class AppRouter {
  static const home = '/';
  static const settings = '/settings';
  static const service = '/service';
  static const conversation = '/conversation';
}

List<GetPage> appPages = [
  GetPage(
    name: AppRouter.home,
    page: () => const HomePage(),
    binding: HomeBinding(),
  ),
  // GetPage(name: AppRouter.conversation, page: () => const ConversationPage()),
];
