import 'package:dnbapp/theme/base.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'application/rooter.dart';
import 'controller/bindings/auth_binding.dart';
import 'locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child,
        );
      },
      title: 'Evolum',
      theme: baseTheme,
      home: const Rooter(),
      initialBinding: AuthBinding(),

      /*  getPages: [
        GetPage(
          name: '/',
          page: () => const Rooter(),
          transition: Transition.noTransition,
        ),
      ],*/
    );
  }
}
