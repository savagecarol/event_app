import 'package:connect/presentation/components/custom_button.dart';
import 'package:connect/presentation/components/custom_snippet.dart';
import 'package:connect/presentation/components/custom_text_button.dart';
import 'package:connect/utils/colors_constants.dart';
import 'package:connect/utils/url_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return customScaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return InkWell(
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onTap: () {
                  Get.offNamed(Urlconstants.firstPageUrl);
                },
              );
            },
          ),
          elevation: 0.0,
          backgroundColor: ColorConstants.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customWhiteText("Settings", 18.h,
                  fontWeight: FontWeight.bold),
            ],
          ),
        ),
          backgroundColor: ColorConstants.black,
      body: SingleChildScrollView(
      child: Padding(
      padding: EdgeInsets.symmetric(vertical : 16.h ,horizontal :16.w),

        child: Column(
          children: [      
               CustomTextButton(text: "Tags", 
                onTap: () {} ,
                 isPostIcon: true , 
                 iconSize: 18.h,),

                CustomTextButton(text: "Authorization", 
                onTap: () {} ,
                margin: EdgeInsets.symmetric(vertical: 16.h)
                ,
                 isPostIcon: true , 
                 iconSize: 18.h,),
               
                CustomTextButton(text: "Terms And Condition",
                 onTap: () {} , 
                 isPostIcon: true ,
                  iconSize: 18.h,
                 margin: EdgeInsets.only(bottom: 16.h)),

                  SizedBox(height: 8.h,),

                CustomButton(         
                  onTap: () {
                  },
                  isLoading: false,
                  containerColor: ColorConstants.white,
                  shadowColor: ColorConstants.white,
                  labelText: "Log Out ",
                  visiblepostIcon: true,
                  labelTextWeight: FontWeight.w700,
                  postIcon: Icons.arrow_forward_rounded,
                  sizelabelText: 24.sp,
                  postIconSize: 24.sp,
                ),
          ],
        ),  
      ),
    ));
  }
}
