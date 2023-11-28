import 'dart:ffi';

import 'package:connect/presentation/components/custom_snippet.dart';
import 'package:connect/utils/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomChatCard extends StatelessWidget {

    final String name;
    final String message;
    final String image;
    final String time;
    final Function() onTap;
    final bool isRead;
 

  CustomChatCard(
      {required this.name,
      required this.onTap,
      required this.image,
      required this.message,
      required this.isRead,
      required this.time,
     });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(top: 8.h, bottom: 8.h, left: 8.w, right: 8.w),
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(
            //                    <--- top side
            color: ColorConstants.black.withOpacity(.5),
            width: 1.0,
          ),
        )),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 8.w),
              child: CustomImage(
                  imageUrl: image ,
                  height: 32.h,
                  width: 32.w,
                  boxFit: BoxFit.fill,
                  isNetwork: true,
                  shape: BoxShape.circle),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customBlackText(name, 16.h,
                      fontWeight: FontWeight.w600),
                  SizedBox(
                    height: 2.h,
                  ),
                  customBlackText(message, 14.h,
                      fontWeight: FontWeight.w400),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 8.w),
                child: Row(
                  children: [
    
                    Visibility(
                      visible: isRead,
                      child: Icon(
                        Icons.circle,
                        size: 10.h,
                        color: ColorConstants.iconRed,
                      ),
                    ),
    
                    SizedBox(
                      width: 1.h,
                    ),
                    customBlackText(time, 14.h, fontWeight: FontWeight.w700),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
