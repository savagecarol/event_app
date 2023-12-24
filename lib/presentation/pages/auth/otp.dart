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
        backgroundColor: ColorConstants.pinkBackground,
        leading: IconButton(
          onPressed: () {
            Get.offAllNamed(Urlconstants.authUrl);
          },
                  icon: Icon(Icons.arrow_back , color: ColorConstants.white,),
        ),
        // title: customWhiteText("ENTER OTP", 18.h, fontWeight: FontWeight.bold),
      ),
      backgroundColor: ColorConstants.pinkBackground,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customWhiteText("We have sent an OTP", 18.sp,
                            fontWeight: FontWeight.w700),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomTextField(
                        hintText: "Enter OTP",
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
                      isLoading: false,
                      containerColor: ColorConstants.white,
                      shadowColor: ColorConstants.white,
                      labelText: "VERIFY OTP ",
                      visiblepostIcon: false,
                      labelTextWeight: FontWeight.w700,
                      postIcon: Icons.arrow_forward_rounded,
                      sizelabelText: 14.sp,
                      postIconSize: 16.sp,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    InkWell(
                        child: customWhiteText("Send Verification Code Again", 12.h,
                            fontWeight: FontWeight.w400)),
                  
                  ],
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
      ),
    );
  }
}

