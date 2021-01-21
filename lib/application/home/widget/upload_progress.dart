import 'package:dnbapp/controller/upload_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class UploadCircularProgress extends StatelessWidget {
  const UploadCircularProgress({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 50,
        width: 50,
        child: Obx(() {
          final uploadCtrl = Get.find<UploadController>();
          if (!uploadCtrl.uploading.value) return Container();
          return StreamBuilder<TaskSnapshot>(
              stream: uploadCtrl.uploadTask.asStream(),
              builder: (_, snapshot) {
                var event = snapshot.data;

                double progressPercent = event != null
                    ? event.bytesTransferred * 100 / event.totalBytes
                    : 0;
                print("===> [UploadStream] $progressPercent");

                return SleekCircularSlider(
                  appearance: CircularSliderAppearance(
                    startAngle: -90,
                    angleRange: 360,
                    customWidths: CustomSliderWidths(
                      progressBarWidth: 2,
                    ),
                    customColors: CustomSliderColors(
                      dotColor: Colors.transparent,
                      trackColor: Colors.transparent,
                      progressBarColor: Theme.of(context).primaryColor,
                      shadowColor: Colors.transparent,
                      hideShadow: true,
                    ),
                  ),
                  initialValue: progressPercent,
                  innerWidget: (value) =>
                      Center(child: Text('$progressPercent%')),
                );
              });
        }),
      ),
    );
  }
}
