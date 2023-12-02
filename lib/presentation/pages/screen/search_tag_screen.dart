import 'package:connect/model/parent_tag.dart';
import 'package:connect/presentation/components/custom_post_card.dart';
import 'package:connect/presentation/components/custom_snippet.dart';
import 'package:connect/utils/colors_constants.dart';
import 'package:connect/utils/global.dart';
import 'package:connect/utils/url_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchTagScreen extends StatefulWidget {
  final ParentTag parentTag;

  const SearchTagScreen({super.key, required this.parentTag});

  @override
  State<SearchTagScreen> createState() => _SearchTagScreenState();

}

class _SearchTagScreenState extends State<SearchTagScreen> {
  @override
  Widget build(BuildContext context) {
    return customScaffold(
      backgroundColor: ColorConstants.black,
        appBar: AppBar(
          
          leading: Builder(
            builder: (BuildContext context) {
              return InkWell(
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onTap: () {
                  Get.offNamed(Urlconstants.firstPageUrl);
                },
              );
            },
          ),
          elevation: 0.0,
          backgroundColor: ColorConstants.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customWhiteText(widget.parentTag.name, 18.h, fontWeight: FontWeight.bold),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 16.h),
                    child: Expanded(child: 
                    Row(
                      children: [
                        for(int i = 0 ; i < postList[0].tagList.length ; i++)
                        Container(
                          margin: EdgeInsets.only(right: 8.w),
                          child: crossChips(postList[0].tagList[i],  ColorConstants.red,
                                          Colors.white, 12.sp,
                                          fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
                  ),          
                ) , 
      Expanded(
        child :      SingleChildScrollView(
        child: Column(
          children: [
            for(int i = 0 ; i < postList.length  ; i++)
                CustomPostCard(
                  post : postList[i]
                )
          ],
        ),
      ),
    ) , 
              ],
          ),
        ));
  }
}
