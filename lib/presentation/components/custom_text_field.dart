import 'package:event_app/utils/colors_constants.dart';
import 'package:event_app/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String initialValue;
  final double width;
  final TextInputType textInputType;
  final Function(String?)? onChange;
  final IconData icon;
  final bool isPrefixIcon;
  final bool obstruct;

   CustomTextField({
    required this.hintText,
    required this.initialValue,
    required this.width,
    required this.onChange,
    this.textInputType = TextInputType.text,
    this.icon = Icons.location_on,
    this.isPrefixIcon = false,
    this.obstruct = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8,
      ),
      decoration: BoxDecoration(color: Colors.white,
      border: Border.all(width: 1 , color: Colors.black),
       boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 3,
            offset: Offset(0, 5))
      ]),
      child: Padding(
        padding: (isPrefixIcon) ? EdgeInsets.all(0) : EdgeInsets.only(left: 16),
        child: TextFormField(
          maxLength: 10,
          obscureText: obstruct,
            onChanged: onChange,
            keyboardType: textInputType,
            style: TextStyle(fontSize: 16),
            decoration: InputDecoration(
                counterText: "",
                border: InputBorder.none,
                hintText: hintText,
                prefixIcon: isPrefixIcon
                    ? Icon(
                        icon,
                        color: Colors.black,
                      )
                    : null,
                hintStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400))),
      ),
    );
  }
}