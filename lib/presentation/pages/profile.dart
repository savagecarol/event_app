import 'package:connect/presentation/components/custom_snippet.dart';
import 'package:connect/utils/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatelessWidget {
   
   List<String> x = ["CRICKET" , "BADMINTON" 
    , "MUSIC"  , 
    "SPORTS" 
    , "CHESS" , "DJ" , "ART" , "DRAWING" , "SKETCHING" , 
    "COFFEE" ];

  Widget profileBox() {
    return Container(
      height: 100.h,
      width: ScreenUtil.defaultSize.width.spMax,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: ColorConstants.lightRed, //New
                blurRadius: 8.h,
                offset: Offset(0, 4.h))
          ],
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
              child: CustomImage(
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
                  customWhiteText("Kartikeya", 24.sp),
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
            padding: EdgeInsets.all(16.h),
            child: chipWrap(x, Colors.grey.shade300, Colors.black, 12.h , fontWeight: FontWeight.w800))
        ],
      ),
    );
  }
}
