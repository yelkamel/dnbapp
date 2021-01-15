import 'dart:math';

import 'package:dnbapp/controller/user_controller.dart';
import 'package:dnbapp/service/cloud_storage.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class RadioController extends GetxController {
  AudioPlayer _radio;

  RxBool playing = false.obs;
  RxBool loading = true.obs;

  @override
  Future onInit() async {
    super.onInit();
    _radio = AudioPlayer();
    playing.bindStream(_radio.playingStream);
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
      final url = await CloudStorage().getRadioFor(user.badge.id);
      print("===> [Radio] URL to Play : $url");
      final duration = await _radio.setUrl(url);
      await _radio
          .seek(Duration(seconds: Random().nextInt(duration.inSeconds - 1)));
    }
  }

  Future<void> play() async {
    _radio.play(); // Usually you don't want to wait for playback to finish.
  }

  Future<void> pause() async {
    _radio.pause(); // Usually you don't want to wait for playback to finish.
  }

  Future<void> playpause() async {
    _radio.playing ? _radio.pause() : _radio.play();
  }

  @override
  Future onClose() async {
    super.onClose();
    await _radio.stop();
  }
}
