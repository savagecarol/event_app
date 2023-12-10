import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:connect/model/post.dart';
import 'package:connect/model/tag_name.dart';
import 'package:connect/presentation/components/custom_button.dart';
import 'package:connect/presentation/components/custom_snippet.dart';
import 'package:connect/presentation/pages/screen/other_user_profile_screen.dart';
import 'package:connect/utils/colors_constants.dart';
import 'package:connect/utils/string_constants.dart';
import 'package:connect/utils/url_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PostScreen extends StatefulWidget {
  final Post post;
  PostScreen({super.key, required this.post});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final controller = PageController(viewportFraction: 0.9, keepPage: true);
  Duration defaultDuration = const Duration(days: 10, hours: 2, minutes: 1);

  @override
  Widget build(BuildContext context) {
    List<Container> imageContainerList =
        List.generate(widget.post.images.length, (index) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Colors.grey.shade300,
            image: DecorationImage(
                image: CachedNetworkImageProvider(widget.post.images[index]),
                fit: BoxFit.fill)),
        margin: EdgeInsets.symmetric(horizontal: 8.w),
        child: Padding(
          padding: EdgeInsets.all(8.h),
        ),
      );
    });

    return customScaffold(
        backgroundColor: ColorConstants.black,
        appBar: customAppBar("Post", () {
          Get.back();
        }),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 180.h,
                            child: PageView.builder(
                              controller: controller,
                              itemCount: imageContainerList.length,
                              itemBuilder: (_, index) {
                                return imageContainerList[
                                    index % widget.post.images.length];
                              },
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          SmoothPageIndicator(
                              controller: controller,
                              count: imageContainerList.length,
                              effect: WormEffect(
                                dotColor: ColorConstants.grey1,
                                activeDotColor: ColorConstants.red,
                                dotHeight: 8.h,
                                dotWidth: 8.w,
                                type: WormType.underground,
                              )),
                          SizedBox(
                            height: 16.h,
                          ),
                          SingleChildScrollView( 
                            scrollDirection: Axis.horizontal,
                            child: SlideCountdown(
                                separatorType: SeparatorType.title,
                              separatorStyle: TextStyle(
                                  color: ColorConstants.black, fontSize: 12.sp),
                              duration: defaultDuration,
                              separatorPadding: EdgeInsets.all(4.w),
                              countUp: false,
                              textStyle: TextStyle(
                                  color: ColorConstants.black, fontSize: 18.sp),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.r)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      customWhiteText(widget.post.title, 28.sp,
                          fontWeight: FontWeight.bold),
                      SizedBox(
                        height: 8.h,
                      ),

                      customWhiteText(widget.post.description, 18.sp,
                          fontWeight: FontWeight.w500),
                     
                      SizedBox(
                        height: 8.h,
                      ),
                      Builder(builder: (context) {
                        List<String> chiplist = [];
                        for (int i = 0; i < widget.post.tagList.length; i++) {
                          chiplist.add(widget.post.tagList[i].tagName);
                        }
                        return chipWrap(
                            chiplist, Colors.grey.shade300, Colors.black, 12.h,
                            fontWeight: FontWeight.w800);
                      }),
                      SizedBox(
                        height: 16.h,
                      ),
                      Container(
                        height: 1.h,
                        color: ColorConstants.white,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(OtherUserProfileScreen(
                                userId: widget.post.userId,
                                userName: widget.post.userName,
                              ));
                            },
                            child: customImage(
                                imageUrl:
                                    "https://p7.hiclipart.com/preview/466/652/1016/5bbdf7443b97c.jpg",
                                height: 28.h,
                                width: 28.w,
                                boxFit: BoxFit.fill,
                                isNetwork: true,
                                shape: BoxShape.circle),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                  onTap: () {
                                    Get.to(OtherUserProfileScreen(
                                      userId: widget.post.userId,
                                      userName: widget.post.userName,
                                    ));
                                  },
                                  child: Container(
                                      margin: EdgeInsets.only(left: 4.w),
                                      child: customWhiteText(
                                          widget.post.userName, 16.sp,
                                          fontWeight: FontWeight.w500))),
                              SizedBox(
                                height: 1.h,
                              ),
                              InkWell(
                                  onTap: () {
                                    Get.to(OtherUserProfileScreen(
                                      userId: widget.post.userId,
                                      userName: widget.post.userName,
                                    ));
                                  },
                                  child: Container(
                                      margin: EdgeInsets.only(left: 4.w),
                                      child: customWhiteText(
                                          widget.post.name, 14.sp,
                                          fontWeight: FontWeight.w500))),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.h),
                child: CustomButton(
                  onTap: () {},
                  containerColor: ColorConstants.white,
                  shadowColor: ColorConstants.white,
                  labelText: "Intrested",
                ),
              )
            ],
          ),
        ));
  }
}
