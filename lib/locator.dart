import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  // Must be call before everything
  await Firebase.initializeApp();
}
