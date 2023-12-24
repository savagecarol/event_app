import 'package:connect/utils/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../utils/string_constants.dart';

class CustomButton extends StatelessWidget {
  final IconData postIcon;
  final bool visiblepostIcon;
  final String labelText;
  final FontWeight labelTextWeight;
  final Color labelTextColor;
  final double sizelabelText;
  final Function() onTap;
  final double postIconSize;
  final Color postIconColor;
  final Color containerColor;
  final Color shadowColor;
  final bool isLoading;

  CustomButton(
      {super.key,
      this.postIcon = Icons.arrow_forward,
      this.labelText = "",
      this.visiblepostIcon = false,
      this.sizelabelText = 20,
      this.labelTextWeight = FontWeight.w500,
      this.labelTextColor = ColorConstants.black,
      required this.onTap,
      this.isLoading = false,
      this.postIconSize = 24,
      this.postIconColor = Colors.black,
      required this.containerColor,
      required this.shadowColor});

  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.all(Radius.circular(5.r))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Center(
            child: (isLoading == false)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(labelText,
                          style: TextStyle(
                            color: labelTextColor,
                              fontFamily: 'Montserrat',
                              fontSize: sizelabelText,
                              fontWeight: labelTextWeight)),
                      Container(
                        child: (visiblepostIcon)
                            ? Icon(
                                postIcon,
                                size: postIconSize,
                                color: postIconColor,
                              )
                            : Container(),
                      ),
                    ],
                  )
                :  SizedBox(
                    height: sizelabelText,
                    width: sizelabelText,
                    child: LottieBuilder.asset(StringConstants.loader),
                  ),
          ),
        ),
      ),
    );
  }
}
