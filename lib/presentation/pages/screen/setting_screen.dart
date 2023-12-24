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
      
        appBar: customAppBar("Settings", () {
          Get.back();
        }),
          backgroundColor: ColorConstants.alizarinCrimson,
      body: SingleChildScrollView(
      child: Padding(
      padding: EdgeInsets.symmetric(vertical : 16.h ,horizontal :16.w),
        child: Column(
          children: [      
            CustomTextButton(
                  text: "Tags",
                  onTap: () {
                    Get.toNamed(Urlconstants.editTagsUrl);
                  },
                  isPostIcon: true,
                  iconSize: 18.h,
                ),

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
                  visiblepostIcon: false,
                  labelTextWeight: FontWeight.w700,
                  postIcon: Icons.arrow_forward_rounded,
                  sizelabelText: 16.sp,
                  postIconSize: 16.sp,
                ),
          ],
        ),  
      ),
    ));
  }
}


