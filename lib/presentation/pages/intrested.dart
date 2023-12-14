import 'package:connect/presentation/components/custom_post_card.dart';
import 'package:connect/presentation/pages/screen/chat_screen.dart';
import 'package:connect/presentation/components/custom_chat_card.dart';
import 'package:connect/presentation/components/custom_snippet.dart';
import 'package:connect/utils/colors_constants.dart';
import 'package:connect/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Intrested extends StatelessWidget {
  const Intrested({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: ColorConstants.black,
          title: customWhiteText("Intrested", 32.h, fontWeight: FontWeight.bold),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            child: Column(
              children: [
                for (int i = 0; i < postList.length; i++)
                  CustomPostCard(post: postList[i])
              ],
            ),
          ),
        ));
  }
}
