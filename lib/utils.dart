import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_code.dart';
import 'package:geoflutterfire/geoflutterfire.dart';

DateTime dateTimefromJson(Timestamp date) {
  if (date == null) return DateTime.now();
  return DateTime.fromMillisecondsSinceEpoch(date.millisecondsSinceEpoch);
}

Timestamp dateTimetoJson(DateTime date) {
  if (date == null) return Timestamp.now();
  return Timestamp.fromMicrosecondsSinceEpoch(date.microsecondsSinceEpoch);
}

CountryCode countryCodeFromJson(Map<String, dynamic> data) {
  if (data == null) return null;
  return CountryCode.fromJson(data);
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
