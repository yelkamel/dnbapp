import 'package:dnbapp/controller/auth_controller.dart';
import 'package:dnbapp/controller/user_controller.dart';
import 'package:dnbapp/service/database.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';

class OnBoardingState extends GetxController {
  RxInt step = 0.obs;
  SwiperController controller = SwiperController();

  List<String> steplist = [
    'intro',
    'pseudo',
    'picture',
    'badge',
    'end',
  ];

  String get currentStep => steplist[step.value];

  RxString name = ''.obs;
  RxString type = ''.obs;
  RxBool pictureUploaded = true.obs;

  void swipNext() async {
    if (currentStep == 'pseudo' && (name.isEmpty || type.isEmpty)) {
      Get.snackbar('Hello 😁',
          'Sorry but we need this information for the good of the app');
      return;
    }

    if (currentStep == 'picture' && !pictureUploaded.value) {
      Get.snackbar(
          'Hello 😁', 'Sorry but we need a picture, this can be change later');
      return;
    }
    if (currentStep == 'badge') {
      final user = Get.find<UserController>().user.value;
      if (user.badgeId == null) {
        Get.snackbar(
            'Hello 😁', 'Please selected a badge this can be change later.');
        return;
      }
    }
    await controller.next();
  }

  void onFinishRegistration() {
    final authController = Get.find<AuthController>();
    Database().updateUser(authController.user.uid, {
      "name": name.value,
      "type": type.value,
      "status": 'collector',
    });

    authController.isSignUp.value = false;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
