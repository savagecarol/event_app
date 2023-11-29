import 'package:cached_network_image/cached_network_image.dart';
import 'package:connect/model/post.dart';
import 'package:connect/presentation/components/custom_snippet.dart';
import 'package:connect/utils/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slide_countdown/slide_countdown.dart';


class CustomPostCard extends StatelessWidget {
  Post post;
  CustomPostCard({super.key, required this.post});
  Duration defaultDuration = Duration(days: 0, hours: 2, minutes: 1);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 4.h),
              height: 240.h,
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                       Radius.circular(24.r),
                      ),
                  color: ColorConstants.white,
                  image: DecorationImage(
                      image:  CachedNetworkImageProvider(
                          post.images[0]),
                      fit: BoxFit.fill)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomImage(
                              imageUrl:
                                  "https://p7.hiclipart.com/preview/466/652/1016/5bbdf7443b97c.jpg",
                              height: 28.h,
                              width: 28.w,
                              boxFit: BoxFit.fill,
                              isNetwork: true,
                              shape: BoxShape.circle),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(left: 4.w),
                                  child: customWhiteText(post.userName, 16.sp,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(
                                height: 1.h,
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: 4.w),
                                  child: customWhiteText(post.name, 14.sp,
                                      fontWeight: FontWeight.w500)),
                            ],
                          )
                        ],
                      ),
                      SlideCountdown(
                        duration: defaultDuration,
                        countUp: false,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(5.r)),
                        ),
                      ),
                    ],
                  ),
                   customWhiteText(post.title, 28.sp,
                              fontWeight: FontWeight.w600)
              
                 
               
                ],
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              chipWrap(["Cricket", "Sport", "Name"], ColorConstants.red,
                  Colors.white, 12.sp,
                  fontWeight: FontWeight.bold),
              Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.link,
                      size: 24.h,
                      color: ColorConstants.white,
                    ),
                    Icon(Icons.location_on, size: 24.h , color: ColorConstants.white)
                  ],
                ),
              )
            ]),
            Container(
              margin: EdgeInsets.only(top: 4.h , bottom: 8.h),
              height: 1.h
            )
          ],
        ));
  }
}
