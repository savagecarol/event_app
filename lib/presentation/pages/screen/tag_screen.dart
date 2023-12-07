import 'package:connect/model/tag.dart';
import 'package:connect/model/tag_name.dart';
import 'package:connect/presentation/components/custom_post_card.dart';
import 'package:connect/presentation/components/custom_snippet.dart';
import 'package:connect/utils/colors_constants.dart';
import 'package:connect/utils/global.dart';
import 'package:connect/utils/url_constants.dart';
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
              customWhiteText(widget.tagName.tagName, 18.h,
                  fontWeight: FontWeight.bold),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
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
