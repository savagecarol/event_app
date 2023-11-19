import 'package:connect/utils/colors_constants.dart';
import 'package:flutter/material.dart';

Widget CustomImage( {required BoxFit boxFit, required String imageUrl, required double width, required isNetwork, required double height , required BoxShape shape} )  {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      shape: shape,
      image: DecorationImage(
        image: isNetwork ? NetworkImage(imageUrl) : AssetImage(imageUrl) as ImageProvider,
        fit: boxFit,
      ),
    ),
  );
}

Widget customBlackText(String text, double fontSize) {
  return Text(
    text,
    style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: ColorConstants.black),
  );
}

Widget customWhiteText(String text, double fontSize) {
  return Text(
    text,
    style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: ColorConstants.white),
  );
}
