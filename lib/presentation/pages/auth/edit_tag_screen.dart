import 'dart:ui';

import 'package:connect/presentation/components/custom_button.dart';
import 'package:connect/presentation/components/custom_snippet.dart';
import 'package:connect/utils/colors_constants.dart';
import 'package:connect/utils/global.dart';
import 'package:connect/utils/url_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditTagScreen extends StatefulWidget {

  EditTagScreen({
    super.key,
  });

  @override
  State<EditTagScreen> createState() => _EditTagScreenState();
}

class _EditTagScreenState extends State<EditTagScreen> {
  @override
  Widget build(BuildContext context) {
    return customScaffold(
      backgroundColor:  ColorConstants.accentRed,
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
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              customWhiteText("Tags", 24.sp , fontWeight: FontWeight.bold),
                  SizedBox(
                  height: 16.h,
                              ) , 
                        

    Builder(
      builder: (context) {
        return Column(
          children: [
           for(int i  = 0 ; i  < popularList.length ; i++)   
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   customWhiteText(popularList[i].name, 18.sp ,fontWeight:  FontWeight.bold),
                         SizedBox(
                        height: 8.h,
                              ) ,
                     Wrap(
                    spacing: 8.h,
                    children: [
                    for (int i = 0; i < chipList.length; i++)
                         chips(chipList[i], ColorConstants.white, Colors.black, 14.sp, fontWeight: FontWeight.w500)
                      ],
                    ),
                       SizedBox(
                        height: 16.h,
                 ) ,
                
                ],
              ),
            ),
          ],
        );
       
       }
    ),



                                
                    ],
                  ),
                ),
              ),
             
              Container(
                margin: EdgeInsets.only(top : 8.h),
                child: CustomButton(
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
              ),
            ],
            ), 
        ));
  }
}
