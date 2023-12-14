import 'package:connect/presentation/components/custom_post_card.dart';
import 'package:connect/presentation/components/custom_snippet.dart';
import 'package:connect/utils/colors_constants.dart';
import 'package:connect/utils/global.dart';
import 'package:connect/utils/url_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  Widget profileBox() {
    return Container(
      width: ScreenUtil.defaultSize.width.spMax,
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: ColorConstants.red,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(24.r),
              bottomLeft: Radius.circular(24.r))),
      child: Padding(
        padding: EdgeInsets.all(16.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                          customWhiteText("Kartikeya", 18.sp,
                              fontWeight: FontWeight.bold),
                          customWhiteText("+917830980280", 16.sp),
                        ],
                      ),
                    )
                  ],
                ),
                IconButton(
                    onPressed: () {
                      Get.toNamed(Urlconstants.settingUrl);
                    },
                    icon:
                        const Icon(Icons.settings, color: ColorConstants.white))
              ],
            ),
            SizedBox(height: 8.h),
            Container(
              height: .5.h,
              color: ColorConstants.white,
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  child: Icon(
                    Icons.post_add_rounded,
                    color: ColorConstants.white,
                  ),
                  onTap: () {},
                ),
                VerticalDivider(
                  thickness: .5.w,
                  color: ColorConstants.white,
                ),
                InkWell(
                  child: Icon(
                    Icons.archive,
                    color: ColorConstants.white,
                  ),
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return customScaffold(
        backgroundColor: ColorConstants.black,
        body: Column(
      children: [
        profileBox(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
            children: [
                  for (int i = 0; i < postList.length; i++)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: CustomPostCard(post: postList[i]),
            )
            ]),
          ))
      ],
    ));
  }
}

