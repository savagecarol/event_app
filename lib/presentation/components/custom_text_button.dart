import 'package:connect/utils/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomTextButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  final IconData icon;
  final bool isPostIcon;
  final FontWeight fontWeight;
  final double fontSize;
  final double iconSize;
  final EdgeInsets margin;

  CustomTextButton(
      {required this.text,
      required this.onTap,
      this.icon = Icons.arrow_forward_sharp,
      this.isPostIcon = false,
      this.fontWeight = FontWeight.w600,
      this.fontSize = 18,
      this.margin = const EdgeInsets.all(0),
      this.iconSize = 18});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.h , horizontal: 12.w),
          decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: ColorConstants.white,
          borderRadius: BorderRadius.all( Radius.circular(8.r))),
          
          margin: margin,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(fontWeight: fontWeight, fontSize: fontSize),
              ),
              (isPostIcon) ? Icon(icon, size: iconSize) : Container()
            ],
          ),
        ));
  }
}


  