import 'package:connect/presentation/auth.dart';
import 'package:connect/presentation/app_start.dart';
import 'package:connect/presentation/otp.dart';
import 'package:connect/presentation/splash_page.dart';
import 'package:connect/utils/colors_constants.dart';
import 'package:connect/utils/string_constants.dart';
import 'package:connect/utils/url_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);  
    return ScreenUtilInit(
        splitScreenMode: true,
        minTextAdapt: true,
        builder: (_, child) {
          return GetMaterialApp(
            title: StringConstants.appName,
            debugShowCheckedModeBanner: false,
            initialRoute: Urlconstants.firstPageUrl,
            theme: ThemeData(
              accentColor: ColorConstants.accentRed,
              scaffoldBackgroundColor: ColorConstants.white,
              appBarTheme:   AppBarTheme(
                  backgroundColor: ColorConstants.iconRed,
                  elevation: 0  ),
            ),
            getPages: [
              GetPage(
                name: Urlconstants.otpUrl,
                page: () => Otp(),
              ),
              GetPage(
                name: Urlconstants.appStartUrl,
                page: () => AppStart(),
              ),
              GetPage(
                name: Urlconstants.firstPageUrl,
                page: () => SplashPage(),
              ),
              GetPage(
                name: Urlconstants.authUrl,
                page: () => Auth(),
              ),
            ],
          );
        });
  }
}