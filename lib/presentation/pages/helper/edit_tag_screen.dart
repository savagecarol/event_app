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
      backgroundColor:  ColorConstants.lightRed,
      appBar: AppBar(
        backgroundColor: ColorConstants.lightRed,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
             icon: Icon(Icons.arrow_back , color: ColorConstants.white,),

          ),
          title: customWhiteText("Tags", 18.h,
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
                        
    Builder(
      builder: (context) {
        return Column(
          children: [
           for(int i  = 0 ; i  < popularList.length ; i++)   
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   customWhiteText(popularList[i].name, 20.sp ,fontWeight:FontWeight.bold),
                         SizedBox(
                        height: 8.h,
                              ) ,
                     Wrap(
                    spacing: 8.h,
                    children: [
                    for (int i = 0; i < chipList.length; i++)
                         chips(chipList[i], ColorConstants.white, Colors.black, 14.sp, fontWeight: FontWeight.w800)
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
                    visiblepostIcon: false,
                    labelTextWeight: FontWeight.w700,
                    postIcon: Icons.arrow_forward_rounded,
                    sizelabelText: 16.sp,
                    postIconSize: 16.sp,
                  ),
              ),
            ],
            ), 
        ));
  }
}
