import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_code.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

extension LaYouExtension<T> on List<T> {
  T get oneRandom {
    if (length == 1) return this[0];
    return this[Random().nextInt(length - 1)];
  }

  List<T> nRandom(int n) {
    List<T> list = [];
    for (var i = 0; i < n; i++) {
      final index = Random().nextInt(length - 1);
      list.add(this[index]);
      removeAt(index);
    }
    return list;
  }
}

DateTime dateTimefromJson(Timestamp date) {
  if (date == null) return DateTime.now();
  return DateTime.fromMillisecondsSinceEpoch(date.millisecondsSinceEpoch);
}

Timestamp dateTimetoJson(DateTime date) {
  if (date == null) return Timestamp.now();
  return Timestamp.fromMicrosecondsSinceEpoch(date.microsecondsSinceEpoch);
}

LatLng latlngFromJson(GeoPoint geo) {
  if (geo == null) return LatLng(0, 0);
  return LatLng(geo.latitude, geo.longitude);
}

GeoPoint latlngToJson(LatLng latlng) {
  if (latlng == null) return GeoPoint(0, 0);
  return GeoPoint(latlng.latitude, latlng.longitude);
}

CountryCode countryCodeFromJson(Map<String, dynamic> data) {
  if (data == null) return null;
  return CountryCode.fromJson(data);
}

Future<String> getMapStyle() async {
  return await DefaultAssetBundle.of(Get.context)
      .loadString('assets/map/warriorz.json');
}

Map<String, dynamic> countryCodeToJson(CountryCode c) {
  if (c == null) return null;

  return {
    "name": c.name,
    "flagUri": c.flagUri,
    "code": c.code,
    "dialCode": c.dialCode,
  };
}
