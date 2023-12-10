import 'package:connect/model/parent_tag.dart';
import 'package:connect/presentation/components/custom_post_card.dart';
import 'package:connect/presentation/components/custom_snippet.dart';
import 'package:connect/utils/colors_constants.dart';
import 'package:connect/utils/global.dart';
import 'package:connect/utils/url_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ParentTagScreen extends StatefulWidget {
  final ParentTag parentTag;
  const ParentTagScreen({super.key, required this.parentTag});

  @override
  State<ParentTagScreen> createState() => _ParentTagScreenState();
}

class _ParentTagScreenState extends State<ParentTagScreen> {
  @override
  Widget build(BuildContext context) {
    return customScaffold(
        backgroundColor: ColorConstants.black,
        appBar:customAppBar(widget.parentTag.name , Urlconstants.firstPageUrl),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  margin: EdgeInsets.only(bottom: 16.h),
                  child: Expanded(
                      child: Row(
                    children: [
                      for (int i = 0; i < postList[0].tagList.length; i++)
                        Builder(
                          builder: (context) {
                            return Container(
                              margin: EdgeInsets.only(right: 8.w),
                              child: crossChips(postList[0].tagList[i].tagName,
                                  ColorConstants.red, Colors.white, 12.sp,
                                  fontWeight: FontWeight.bold),
                            );
                          }
                        ),
                    ],
                  )),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int i = 0; i < postList.length; i++)
                        CustomPostCard(
                          post: postList[i]
                        )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
