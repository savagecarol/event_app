import 'package:cached_network_image/cached_network_image.dart';
import 'package:connect/utils/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

Widget customScaffold({ PreferredSizeWidget? appBar,   required Widget body   , backgroundColor = ColorConstants.white}) {
  return SafeArea(
    child: Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: true,
      appBar: appBar,
      body: body,
    ),
  );
}

Widget customImage(
    {required BoxFit boxFit,
    required String imageUrl,
    required double width,
    required isNetwork,
    required double height,
    required BoxShape shape}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      shape: shape,
      image: DecorationImage(
        image: isNetwork
            ? CachedNetworkImageProvider(imageUrl)
            : AssetImage(imageUrl) as ImageProvider,
        fit: boxFit,
      ),
    ),
  );
}

Widget customBlackText(String text, double fontSize,
    {FontWeight fontWeight = FontWeight.normal}) {
  return Text(
    text,
    style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: ColorConstants.fontDarkColor),
  );
}

Widget customWhiteText(String text, double fontSize,
    {FontWeight fontWeight = FontWeight.normal}) {
  return Text(
    text,
    style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: ColorConstants.white),
  );
}

Widget chipWrap(
    List<String> list, Color color, Color textColor, double fontSize,
    {FontWeight fontWeight = FontWeight.normal}) {
  return Wrap(
    spacing: 8.h,
    children: [
      for (int i = 0; i < list.length; i++)
        chips(list[i], color, textColor, fontSize, fontWeight: fontWeight)
    ],
  );
}

void chipConstFunc(){}


Widget chips(String text, Color color, Color textColor, double fontSize,
    {FontWeight fontWeight = FontWeight.normal ,Function() onTap = chipConstFunc}) {
  return InkWell(
    onTap: onTap,
    child: Container(
        margin: EdgeInsets.only(top: 8.h),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(5.r)),
          boxShadow: [
            BoxShadow(
                color: color.withOpacity(.1), //New
                blurRadius: 2.h,
                offset: Offset(0, 2.h))
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
        child: (textColor == Colors.black)
            ? customBlackText(text, fontSize, fontWeight: fontWeight)
            : customWhiteText(text, fontSize, fontWeight: fontWeight)),
  );
}


Widget crossChips(String text, Color color, Color textColor, double fontSize,
    {FontWeight fontWeight = FontWeight.normal}) {
  return Container(
      margin: EdgeInsets.only(top: 8.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(5.r)),
        boxShadow: [
          BoxShadow(
              color: color.withOpacity(.1), //New
              blurRadius: 2.h,
              offset: Offset(0, 2.h))
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
      child: Wrap(
        children: [
          Container(
            margin: EdgeInsets.only(right: 4.w),
            child: (textColor == Colors.black)
                ? customBlackText(text, fontSize, fontWeight: fontWeight)
                : customWhiteText(text, fontSize, fontWeight: fontWeight),
          ),
            Icon(
             Icons.clear,
             size: 18.sp,
                color: ColorConstants.black,
           ) ,
           
          
        ],
      ));
}