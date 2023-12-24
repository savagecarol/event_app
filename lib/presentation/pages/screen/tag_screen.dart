import 'package:connect/model/tag_name.dart';
import 'package:connect/presentation/components/custom_post_card.dart';
import 'package:connect/presentation/components/custom_snippet.dart';
import 'package:connect/utils/colors_constants.dart';
import 'package:connect/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TagScreen extends StatefulWidget {
  final TagName tagName;
   TagScreen({super.key ,required this.tagName});
  @override
  State<TagScreen> createState() => _TagScreenState();
}

class _TagScreenState extends State<TagScreen> {
  @override
  Widget build(BuildContext context) {
    return customScaffold(
        backgroundColor: ColorConstants.white,
        appBar: customAppBar(widget.tagName.tagName, () {
          Get.back();
        } , backgroundColor: ColorConstants.lightRed),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w , vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int i = 0; i < postList.length; i++)
                        CustomPostCard(post: postList[i])
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
