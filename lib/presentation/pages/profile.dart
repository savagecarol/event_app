import 'package:connect/presentation/components/custom_button.dart';
import 'package:connect/presentation/components/custom_snippet.dart';
import 'package:connect/presentation/components/custom_text_button.dart';
import 'package:connect/utils/colors_constants.dart';
import 'package:connect/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatelessWidget {
  Widget profileBox() {
    return Container(
      height: 100.h,
      width: ScreenUtil.defaultSize.width.spMax,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: ColorConstants.red,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(24.r),
              bottomLeft: Radius.circular(24.r))),
      child: Padding(
        padding: EdgeInsets.all(16.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(right: 10.h),
              child: customImage(
                  imageUrl:
                      "https://p7.hiclipart.com/preview/466/652/1016/5bbdf7443b97c.jpg",
                  height: 60.h,
                  width: 60.h,
                  boxFit: BoxFit.fill,
                  isNetwork: true,
                  shape: BoxShape.circle),
            ),
            Container(
              margin: EdgeInsets.only(top: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customWhiteText("Kartikeya", 18.sp , fontWeight: FontWeight.bold),
                  customWhiteText("+917830980280", 16.sp),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          profileBox(),
          Padding(
            padding:  EdgeInsets.all(16.w),
            child: Column(
            
              children: [
            
                chipWrap(chipList, Colors.grey.shade300, Colors.black, 12.h,
                  fontWeight: FontWeight.w800),
               
                
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
         
     
        ],
      ),
    );
  }
}
