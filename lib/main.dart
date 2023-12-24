import 'package:connect/presentation/pages/helper/add_profile.dart';
import 'package:connect/presentation/pages/auth/auth.dart';
import 'package:connect/presentation/pages/helper/edit_tag_screen.dart';
import 'package:connect/presentation/pages/helper/get_location.dart';
import 'package:connect/presentation/pages/screen/app_start.dart';
import 'package:connect/presentation/pages/auth/otp.dart';
import 'package:connect/presentation/pages/screen/setting_screen.dart';
import 'package:connect/presentation/home.dart';
import 'package:connect/torch/torch.dart';
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
            initialRoute: Urlconstants.appStartUrl,
            theme: ThemeData(
              fontFamily: 'Poppins',
              hintColor: ColorConstants.orange,
              scaffoldBackgroundColor: ColorConstants.pinkBackground,
              appBarTheme: const AppBarTheme(
                  backgroundColor: ColorConstants.pinkBackground,
                  elevation: 0),
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
                  name: Urlconstants.home,
                  page: () => Home(),
                  transition: Transition.downToUp),
              GetPage(
                name: Urlconstants.authUrl,
                page: () => Auth(),
              ),
              GetPage(
                  name: Urlconstants.addProfileUrl, page: () => Add_Profile()),
              GetPage(
                  name: Urlconstants.editTagsUrl, page: () => EditTagScreen()),
              GetPage(
                  name: Urlconstants.torchUrl,
                  page: () => const Torch(),
                  transition: Transition.circularReveal),
              GetPage(
                  name: Urlconstants.settingUrl,
                  page: () => const SettingScreen(),
                  transition: Transition.circularReveal),
            GetPage(
                  name: Urlconstants.getLocation,
                  page: () => const GetLocation(),
                  transition: Transition.circularReveal),
            ],
          );
        });
  }
}
