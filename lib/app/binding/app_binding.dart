import 'package:get/get.dart';
import 'package:maid_gpt/app/controller/app_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppController>(
      () => AppController(),
    );
  }
}
