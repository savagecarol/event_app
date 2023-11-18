import 'package:event_app/presentation/Auth.dart';
import 'package:event_app/presentation/Settings.dart';
import 'package:event_app/presentation/SplashPage.dart';
import 'package:event_app/utils/string_constants.dart';
import 'package:event_app/utils/url_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async { 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      title: StringConstants.appName,
      debugShowCheckedModeBanner: false,
      home: Settings(),
      // initialRoute: Urlconstants.sett,
      // routes: {
      //   Urlconstants.firstPageUrl : (context) => SplashPage(),
      //   Urlconstants.authUrl : (context) => const Auth()
      // },
    );
  }
}
