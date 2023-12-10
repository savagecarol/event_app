import 'package:connect/presentation/components/custom_snippet.dart';
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
        appBar: customAppBar(widget.userName, () {
          Get.back();
        }),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [],
          ),
        ));
  }
}
