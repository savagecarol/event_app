import 'package:connect/model/post.dart';
import 'package:connect/presentation/components/custom_snippet.dart';
import 'package:connect/utils/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomPostCard extends StatelessWidget {
  Post post;
  CustomPostCard({super.key, required this.post});
  Duration defaultDuration = Duration(days: 0, hours: 2, minutes: 1);

  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  Widget build(BuildContext context) {
    List<Container> imageContainerList =
        List.generate(post.images.length, (index) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.h),
          color: Colors.grey.shade300,
          image: DecorationImage(
          image: NetworkImage(
            post.images[index]
          ),
          fit: BoxFit.contain
          
        )),
        margin: EdgeInsets.symmetric(horizontal: 8.w),
      );
    });

    return GestureDetector(
        onTap: () {},
        child: Container(
          height: 200.h,
           margin: EdgeInsets.only(bottom: 16.h),
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
          decoration: BoxDecoration(
          
              // boxShadow: [
              //   BoxShadow(
              //       color: ColorConstants.grey1, //New
              //       blurRadius: 8.h,
              //       offset: Offset(0, 2.h))
              // ],
              color: ColorConstants.white,
                image: DecorationImage(
          image: NetworkImage(
             "https://buffer.com/library/content/images/2023/10/free-images.jpg"
          ),
          fit: BoxFit.fill
          
        )),
        
              
              // borderRadius: BorderRadius.all(Radius.circular(8.r))),
          child: Column(
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
                              child: customWhiteText(post.userName, 14.sp,
                                  fontWeight: FontWeight.w500)),
                                    SizedBox(
          height: 1.h,
              ),      

                          Container(
                              margin: EdgeInsets.only(left: 4.w),
                              child: customWhiteText(post.name, 12.sp,
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
                       SizedBox(
                height: 4.h,
              ),
              Container(
                height: 1.h,
                color: ColorConstants.grey1,
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: customBlackText(post.post, 14.sp,
                          fontWeight: FontWeight.w500)),
                ],
              ),
              SizedBox(height: 12.h),
              Visibility(
                visible: !post.images.isEmpty,
                child: Column(
                  children: [
                    SizedBox(
                      height: 160.h,
                      child: PageView.builder(
                        controller: controller,
                        itemCount: imageContainerList.length,
                        itemBuilder: (_, index) {
                          return imageContainerList[index % post.images.length];
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
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  chipWrap(["Cricket", "Sport", "Name"], ColorConstants.red,
                      Colors.white, 12.sp,
                      fontWeight: FontWeight.bold),
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.link,
                          size: 24.h,
                        ),
                        Icon(Icons.location_on, size: 24.h)
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
