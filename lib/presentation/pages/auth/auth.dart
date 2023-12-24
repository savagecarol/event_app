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
      backgroundColor: ColorConstants.pinkBackground,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      SizedBox(
                      height: 16.h,
                    ),
                    customWhiteText("Enter your Phone Number", 20.h,
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
                        hintText: "Enter phone Number",
                        initialValue: "",
                        textInputType: TextInputType.number,
                        onChange: (Value) {}),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomButton(
                      onTap: () {
                        Get.toNamed(Urlconstants.otpUrl);
                      },
                      containerColor: ColorConstants.white,
                      shadowColor: ColorConstants.white,
                      labelText: "SEND OTP",
                      visiblepostIcon: false,
                      labelTextWeight: FontWeight.w700,
                      postIcon: Icons.arrow_forward_rounded,
                      sizelabelText: 14.sp,
                      postIconSize: 16.sp,
                    ),
                  
                  ],
                ),
              ),
            ),
          ),

        Center(
              child: customImage(
                   baseContianer: Container(),
                  boxFit: BoxFit.contain,
                  isNetwork: false,
                  imageUrl: StringConstants.appIcon2,
                  height: 96.h,
                  width: 96.w,
                  shape: BoxShape.circle),
            ),

             SizedBox(
                    height: 8.h,
                  ),

        ],
  
      ),
    
    );
  }
}