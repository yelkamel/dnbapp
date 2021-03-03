import 'package:dnbapp/application/player/player_screen.dart';
import 'package:dnbapp/application/post/post_screen.dart';
import 'package:dnbapp/application/profil/profil_screen.dart';
import 'package:dnbapp/theme/base.dart';
import 'package:dnbapp/theme/warrioz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import 'application/profil/edit/profil_edit_screen.dart';
import 'application/rooter.dart';
import 'controller/bindings/auth_binding.dart';
import 'locator.dart';
import 'theme/zombiecats.dart';

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
      title: 'Dnb APP',
      theme: baseTheme,
      themeMode: ThemeMode.light,
      darkTheme: baseTheme,
      home: const Rooter(),
      initialBinding: AuthBinding(),
      getPages: [
        GetPage(
          name: '/edit',
          page: () => const ProfilEditScreen(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: '/post',
          page: () => const PostScreen(),
          transition: Transition.downToUp,
        ),
        GetPage(
          name: '/profil',
          page: () => const ProfilScreen(),
          transition: Transition.downToUp,
        ),
      ],
    );
  }
}
