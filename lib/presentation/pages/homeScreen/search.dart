import 'package:cached_network_image/cached_network_image.dart';
import 'package:connect/presentation/components/custom_snippet.dart';
import 'package:connect/presentation/pages/screen/parent_tag_screen.dart';
import 'package:connect/presentation/pages/screen/post_screen.dart';
import 'package:connect/utils/colors_constants.dart';
import 'package:connect/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  List<Container> imageContainerList =
      List.generate(trendingList.length, (index) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Colors.grey.shade300,
          image: DecorationImage(
              image: CachedNetworkImageProvider(trendingList[index].images[0]),
              fit: BoxFit.fill)),
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      child: InkWell(
        onTap: () {
          Get.to(PostScreen(post: trendingList[index]));
        },
        child: Padding(
          padding: EdgeInsets.all(8.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customWhiteText(trendingList[index].title, 18.sp,
                  fontWeight: FontWeight.w600)
            ],
          ),
        ),
      ),
    );
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.symmetric(vertical: 32.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  margin:
                      EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
                  child: customBlackText("Trending", 26.sp,
                      fontWeight: FontWeight.bold)),
              Column(
                children: [
                  SizedBox(
                    height: 160.h,
                    child: PageView.builder(
                      controller: controller,
                      itemCount: imageContainerList.length,
                      itemBuilder: (_, index) {
                        return imageContainerList[index % trendingList.length];
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
                        dotColor: ColorConstants.black,
                        activeDotColor: ColorConstants.red,
                        dotHeight: 8.h,
                        dotWidth: 8.w,
                        type: WormType.underground,
                      )),
                ],
              ),
              Container(
                  margin: EdgeInsets.only(
                      left: 16.w, right: 16.w, bottom: 16.h, top: 16.h),
                  child: customBlackText("Popular", 26.sp,
                      fontWeight: FontWeight.bold)),
              Container(
                margin: EdgeInsets.only(left: 16.w, right: 16.w),
                child: Wrap(
                  spacing: 16.w,
                  runSpacing: 16.h,
                  children: [
                    for (int i = 0; i < popularList.length - 1; i++)
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Get.to(
                                    ParentTagScreen(
                                      parentTag: popularList[i],
                                    ),
                                    transition: Transition.rightToLeft);
                              },
                              child: Container(
                                  height: 80.h,
                                  // width: 140.w,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8.h, horizontal: 12.w),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(24.r),
                                      ),
                                      color: ColorConstants.white,
                                      image: DecorationImage(
                                          image: CachedNetworkImageProvider(
                                              popularList[i].image),
                                          fit: BoxFit.fill)),
                                  child: Center(
                                    child: customWhiteText(
                                        popularList[i].name, 18.sp,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ),
                          VerticalDivider(
                            width: 8.w,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Get.to(
                                    ParentTagScreen(
                                      parentTag: popularList[i + 1],
                                    ),
                                    transition: Transition.rightToLeft);
                              },
                              child: Container(
                                  height: 80.h,
                                  // width: 140.w,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8.h, horizontal: 12.w),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(24.r),
                                      ),
                                      color: ColorConstants.white,
                                      image: DecorationImage(
                                          image: CachedNetworkImageProvider(
                                              popularList[i + 1].image),
                                          fit: BoxFit.fill)),
                                  child: Center(
                                    child: customWhiteText(
                                        popularList[i + 1].name, 18.sp,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ),
                        ],
                      )
                  ],
                ),
              ),
            ])));
  }
}
