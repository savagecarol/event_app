import 'package:connect/presentation/components/custom_button.dart';
import 'package:connect/presentation/components/custom_snippet.dart';
import 'package:connect/presentation/components/custom_text_field.dart';
import 'package:connect/utils/colors_constants.dart';
import 'package:connect/utils/string_constants.dart';
import 'package:connect/utils/url_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Otp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return customScaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.offAllNamed(Urlconstants.authUrl);
            },
            icon: Icon(Icons.arrow_back),
          ),
          title:
              customWhiteText("Enter Otp", 18.h, fontWeight: FontWeight.bold),
        ),
        backgroundColor: ColorConstants.iconRed,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                    Get.offAllNamed(Urlconstants.addProfileUrl);
                  },
                  containerColor: ColorConstants.white,
                  shadowColor: ColorConstants.white,
                  labelText: "Verify Otp ",
                  visiblepostIcon: true,
                  labelTextWeight: FontWeight.w700,
                  postIcon: Icons.arrow_forward_rounded,
                  sizelabelText: 24.sp,
                  postIconSize: 24.sp,
                ),
                SizedBox(
                  height: 8.h,
                ),
                InkWell(
                    child: customWhiteText(
                        "Send Verification Code Again?", 12.h,
                        fontWeight: FontWeight.w400)),
                Center(
                  child: customImage(
                      boxFit: BoxFit.contain,
                      isNetwork: false,
                      imageUrl: StringConstants.appIcon2,
                      height: 128.h,
                      width: 128.w,
                      shape: BoxShape.circle,
                  baseContianer: Container()),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
