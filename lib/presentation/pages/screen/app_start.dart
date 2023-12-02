import 'package:connect/presentation/components/custom_snippet.dart';
import 'package:connect/utils/colors_constants.dart';
import 'package:connect/utils/string_constants.dart';
import 'package:connect/utils/url_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/instance_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

class AppStart extends StatefulWidget {
  const AppStart({super.key});

  @override
  State<AppStart> createState() => _AppStartState();
}

class _AppStartState extends State<AppStart> {
  _isLogin() async {
    await Future.delayed(Duration(seconds: 2));
    Get.offNamed(Urlconstants.authUrl);
  }

  @override
  void initState() {
    super.initState();
    _isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return customScaffold(
            backgroundColor: ColorConstants.white,
            body: Column(
              children: [
                Expanded(
                  child: SizedBox(
                      child: LottieBuilder.asset(
                    StringConstants.loader,
                    height: 128.h,
                    width: 128.w,
                  )),
                ),
                Center(
                    child: customImage(
                        boxFit: BoxFit.contain,
                        isNetwork: false,
                        imageUrl: StringConstants.appIcon,
                        height: 128.h,
                        width: 128.w,
                        shape: BoxShape.rectangle))
              ],
            ));
  }
}
