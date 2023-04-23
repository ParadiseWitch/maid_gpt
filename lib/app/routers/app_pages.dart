import 'package:get/get.dart';

import '../pages/conversation_page.dart';
import '../pages/home_page.dart';
import 'app_routers.dart';


List<GetPage> appPages = [
  GetPage(name: AppRouter.home, page: () => const HomePage()),
  GetPage(name: AppRouter.conversation, page: () => const ConversationPage()),
];

