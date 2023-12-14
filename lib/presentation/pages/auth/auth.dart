import 'package:connect/presentation/components/custom_button.dart';
import 'package:connect/presentation/components/custom_snippet.dart';
import 'package:connect/presentation/components/custom_text_field.dart';
import 'package:connect/utils/colors_constants.dart';
import 'package:connect/utils/string_constants.dart';
import 'package:connect/utils/url_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Auth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return customScaffold(
        backgroundColor: ColorConstants.iconRed,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customWhiteText("Enter your Phone Number", 18.h,
                    fontWeight: FontWeight.bold),
                SizedBox(
                  height: 8.h,
                ),
                customWhiteText(
                    "We Will Send you 4 digit verification code", 14.h,
                    fontWeight: FontWeight.w600),
                SizedBox(
                  height: 24.h,
                ),
                CustomTextField(
                    hintText: "",
                    initialValue: "",
                    textInputType: TextInputType.number,
                    onChange: (Value) {}),
                SizedBox(
                  height: 16.h,
                ),
                CustomButton(
                  onTap: () {
                    Get.toNamed(Urlconstants.addImageUrl);
                  },
                  containerColor: ColorConstants.white,
                  shadowColor: ColorConstants.white,
                  labelText: "Send Otp ",
                  visiblepostIcon: true,
                  labelTextWeight: FontWeight.w700,
                  postIcon: Icons.arrow_forward_rounded,
                  sizelabelText: 24.sp,
                  postIconSize: 24.sp,
                ),
                Center(
                  child: customImage(
                      boxFit: BoxFit.contain,
                      isNetwork: false,
                      imageUrl: StringConstants.appIcon2,
                      height: 128.h,
                      width: 128.w,
                      shape: BoxShape.circle),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
