import 'package:cached_network_image/cached_network_image.dart';
import 'package:connect/presentation/components/custom_snippet.dart';
import 'package:connect/utils/colors_constants.dart';
import 'package:connect/utils/global.dart';
import 'package:connect/utils/string_constants.dart';
import 'package:connect/utils/url_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Torch extends StatefulWidget {
  const Torch({super.key});

  @override
  State<Torch> createState() => _TorchState();
}

class _TorchState extends State<Torch> with TickerProviderStateMixin {
  late AnimationController _controller;
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
    );
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: ColorConstants.white,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Obx(() {
                    if (globalController.globalvariable.value.partyAnimation) {
                      return Container();
                    }
                    return GestureDetector(
                        onTap: () {
                          Get.toNamed(Urlconstants.firstPageUrl);
                        },
                        child: Icon(
                          Icons.close,
                          color: ColorConstants.darkRed,
                          size: 24.h,
                        ));
                  })
                ],
              ),
            ),
            backgroundColor: ColorConstants.white,
            body: Obx(() {
              if (globalController.globalvariable.value.partyAnimation) {
                return Center(
                    child: SizedBox(
                        child: LottieBuilder.asset(StringConstants.partyPopper,
                            height: 200.h,
                            width: 200.w,
                            controller: _controller, onLoaded: (composition) {
                  _controller
                    ..duration = composition.duration
                    ..forward().whenComplete(
                        () => globalController.changePartyAnimation());
                })));
              }
              return Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 32.h,
                  ),
                  Expanded(
                    child: PageView.builder(
                      controller: controller,
                      itemCount: imageContainerList.length,
                      itemBuilder: (_, index) {
                        return imageContainerList[index % trendingList.length];
                      },
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
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
                    height: 64.h,
                  ),
                ],
              ));
            })));
  }
}
