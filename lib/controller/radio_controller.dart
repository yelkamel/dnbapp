import 'dart:math';

import 'package:dnbapp/controller/user_controller.dart';
import 'package:dnbapp/model/badge_model.dart';
import 'package:dnbapp/service/cloud_storage.dart';
import 'package:dnbapp/service/database.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class RadioController extends GetxController {
  AudioPlayer _radio;

  RxBool playing = false.obs;
  RxBool loading = true.obs;
  RxList<BadgeModel> badges = <BadgeModel>[].obs;

  @override
  Future onInit() async {
    super.onInit();
    _radio = AudioPlayer();
    playing.bindStream(_radio.playingStream);
    badges.bindStream(Database().badgeStream());
  }

  Future start() async {
    await prepare();
    await play();
    loading.value = false;
  }

  Future<void> prepare() async {
    final user = Get.find<UserController>().user;
    print("===> [Radio] Prepare: ${user.badge}");

    if (user.badge != null) {
      final url = CloudStorage().getRadioFor(user.badge.id);
      final duration = await _radio.setUrl(url);
      await _radio
          .seek(Duration(seconds: Random().nextInt(duration.inSeconds - 20)));
      Get.find<UserController>().snackRadioStarted();
    }
  }

  Future<void> play() async {
    _radio.play(); // Usually you don't want to wait for playback to finish.
  }

  Future<void> pause() async {
    _radio.pause(); // Usually you don't want to wait for playback to finish.
  }

  Future<void> playpause() async {
    //  / Get.find<UserController>().snackRadioStarted();
    // _radio.setVolume(0);
    _radio.playing ? _radio.pause() : _radio.play();
  }

  @override
  Future onClose() async {
    super.onClose();
    await _radio.stop();
  }
}
