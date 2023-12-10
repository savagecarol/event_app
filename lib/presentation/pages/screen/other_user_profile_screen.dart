import 'package:connect/presentation/components/custom_post_card.dart';
import 'package:connect/presentation/components/custom_snippet.dart';
import 'package:connect/utils/colors_constants.dart';
import 'package:connect/utils/global.dart';
import 'package:connect/utils/url_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OtherUserProfileScreen extends StatefulWidget {
  final String userId;
  final String userName;
  const OtherUserProfileScreen(
      {super.key, required this.userId, required this.userName});

  @override
  State<OtherUserProfileScreen> createState() => _OtherUserProfileScreenState();
}

class _OtherUserProfileScreenState extends State<OtherUserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return customScaffold(
      backgroundColor: ColorConstants.black,
        appBar: customAppBar(widget.userName, () {
          Get.back();
        }),
        body:  SingleChildScrollView(
          child: Column(
          children: [
                for (int i = 0; i < postList.length; i++)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomPostCard(post: postList[i]),
          )
          ]),
        ));
  }
}
