import 'package:dnbapp/controller/radio_controller.dart';
import 'package:get/get.dart';

import '../auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.lazyPut(() => RadioController());
  }
}
