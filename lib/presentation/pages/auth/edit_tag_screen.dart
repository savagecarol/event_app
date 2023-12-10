import 'dart:ui';

import 'package:connect/presentation/components/custom_button.dart';
import 'package:connect/presentation/components/custom_snippet.dart';
import 'package:connect/presentation/components/custom_text_button.dart';
import 'package:connect/presentation/pages/screen/parent_tag_screen.dart';
import 'package:connect/utils/colors_constants.dart';
import 'package:connect/utils/global.dart';
import 'package:connect/utils/url_constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class EditTagScreen extends StatefulWidget {
  bool fetchPrevTags;

  EditTagScreen({
    super.key,
    required this.fetchPrevTags,
  });

  @override
  State<EditTagScreen> createState() => _EditTagScreenState();
}

class _EditTagScreenState extends State<EditTagScreen> {
  @override
  Widget build(BuildContext context) {
    return customScaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.offAllNamed(Urlconstants.authUrl);
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: customWhiteText("Enter Profile Details", 18.h,
              fontWeight: FontWeight.bold),
        ),
        body: Container(
          color: Colors.blue,
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          child: Column(
            children: [
              Expanded(child: Container(
                color: Colors.black,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    // margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                    padding: EdgeInsets.only(top: 16.h),
                    child: Expanded(
                        child: Row(
                      children: [
                        for (int i = 0; i < chipList.length; i++)
                          Builder(
                            builder: (context) {
                              return Container(
                                margin: EdgeInsets.only(right: 8.w),
                                child: crossChips(chipList[i],
                                    ColorConstants.red, Colors.white, 12.sp,
                                    fontWeight: FontWeight.bold),
                              );
                            }
                          ),
                      ],
                    )),
                  ),
                ),
                )),
              Expanded(child: Container(color: Colors.amber,)),
              CustomButton(
                  onTap: () {
                    Get.offAllNamed(Urlconstants.torchUrl);
                  },
                  containerColor: ColorConstants.white,
                  shadowColor: ColorConstants.white,
                  labelText: "Submit",
                  visiblepostIcon: true,
                  labelTextWeight: FontWeight.w700,
                  postIcon: Icons.arrow_forward_rounded,
                  sizelabelText: 24.sp,
                  postIconSize: 24.sp,
                ),
            ],
        
            ),
        ));
  }
}
