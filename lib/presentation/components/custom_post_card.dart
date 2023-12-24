import 'package:cached_network_image/cached_network_image.dart';
import 'package:connect/model/post.dart';
import 'package:connect/presentation/components/custom_snippet.dart';
import 'package:connect/presentation/pages/screen/other_user_profile_screen.dart';
import 'package:connect/presentation/pages/screen/post_screen.dart';
import 'package:connect/presentation/pages/screen/tag_screen.dart';
import 'package:connect/utils/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomPostCard extends StatelessWidget {
  final Post post;
  const CustomPostCard({super.key, required this.post});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Get.to(PostScreen(post: post));
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 4.h),
            height: 240.h,
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(24.r),
                ),
                color: ColorConstants.white,
                image: DecorationImage(
                    image: CachedNetworkImageProvider(post.images[0]),
                    fit: BoxFit.fill)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(OtherUserProfileScreen(
                          userId: post.userId,
                          userName: post.userName,
                        ));
                      },
                      child: customImage(
                          imageUrl:
                              "https://p7.hiclipart.com/preview/466/652/1016/5bbdf7443b97c.jpg",
                          height: 28.h,
                          width: 28.w,
                          boxFit: BoxFit.fill,
                          isNetwork: true,
                          shape: BoxShape.circle,
                          baseContianer: Container()),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: () {
                              Get.to(OtherUserProfileScreen(
                                userId: post.userId,
                                userName: post.userName,
                              ));
                            },
                            child: Container(
                                margin: EdgeInsets.only(left: 4.w),
                                child: customWhiteText(post.userName, 16.sp,
                                    fontWeight: FontWeight.w500))),
                        SizedBox(
                          height: 1.h,
                        ),
                        InkWell(
                            onTap: () {
                              Get.to(OtherUserProfileScreen(
                                userId: post.userId,
                                userName: post.userName,
                              ));
                            },
                            child: Container(
                                margin: EdgeInsets.only(left: 4.w),
                                child: customWhiteText(post.name, 14.sp,
                                    fontWeight: FontWeight.w500))),
                      ],
                    )
                  ],
                ),
                customWhiteText(post.title, 28.sp, fontWeight: FontWeight.w600)
              ],
            ),
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Wrap(
            spacing: 8.h,
            children: [
              for (int i = 0; i < post.tagList.length; i++)
                chips(
                  post.tagList[i].tagName,
                  ColorConstants.lightRed,
                  Colors.white,
                  12.sp,
                  fontWeight: FontWeight.bold,
                  onTap: () {
                    Get.to(TagScreen(tagName: post.tagList[i]));
                  },
                )
            ],
          ),
          Row(
            children: [
              InkWell(
                      onTap: () async {
                  String url ='https://www.decathlon.in/';
                  if (await canLaunch(url)) {
                    launch(url);
                  } else {
                    Fluttertoast.showToast(msg: "Not able to open map");
                  }
                      },
                child: Icon(
                  Icons.link,
                  size: 24.h,
                  color: ColorConstants.black,
                ),
              ),
              InkWell(
                onTap: () async {
                  String googleUrl =
                      'https://www.google.com/maps/search/?api=1&query=28.7041,77.1025';
                  if (await canLaunch(googleUrl)) {
                    launch(googleUrl);
                  } else {
                    Fluttertoast.showToast(msg: "Not able to open map");
                  }
                },
                child: Icon(Icons.location_on,
                    size: 24.h, color: ColorConstants.black),
              )
            ],
          )
        ]),
        Container(margin: EdgeInsets.only(top: 4.h, bottom: 8.h), height: 1.h)
      ],
    );
  }
}
