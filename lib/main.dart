import 'package:event_app/presentation/Auth.dart';
import 'package:event_app/presentation/SplashPage.dart';
import 'package:event_app/utils/string_constants.dart';
import 'package:event_app/utils/url_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';

void main() async { 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return GetMaterialApp(
      title: StringConstants.appName,
      debugShowCheckedModeBanner: false,
      initialRoute: Urlconstants.authUrl,
      getPages: [

          GetPage(
          name: Urlconstants.firstPageUrl,
          page: () => SplashPage(),
        ),
        GetPage(
          name:  Urlconstants.authUrl,
          page: () => Auth(),
        ),

      ],
    );
  }
}
