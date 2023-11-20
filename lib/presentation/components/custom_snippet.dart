import 'package:connect/utils/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget CustomImage(
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
            ? NetworkImage(imageUrl)
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
        color: ColorConstants.black),
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

Widget chipWrap(List<String> list, Color color, Color textColor,double fontSize,  {FontWeight fontWeight = FontWeight.normal} ) {
  return Wrap(
    spacing: 8.h,
    children: [for (int i = 0; i < list.length; i++)
     chips(list[i], color, textColor , fontSize  , fontWeight: fontWeight)],
  );
}


Widget chips(String text, Color color  ,Color textColor , double fontSize,{FontWeight fontWeight = FontWeight.normal} ) {
  return Container(
    margin: EdgeInsets.only(top: 8.h),
    decoration: BoxDecoration(
    color: color,
    borderRadius: BorderRadius.all( Radius.circular(24.r)),
    boxShadow: [BoxShadow(
          color: color.withOpacity(.1), //New
          blurRadius: 2.h,
          offset: Offset(0, 2.h))
    ],
    ),
    padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 18.w),
    child:
     (textColor == Colors.black) ? 
      customBlackText(text, fontSize , fontWeight: fontWeight):
      customWhiteText(text, fontSize, fontWeight:  fontWeight)
  );
}

