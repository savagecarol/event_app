import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String initialValue;
  final double width;
  final TextInputType textInputType;
  final Function(String?)? onChange;
  final Function() onTap;
  final IconData icon;
  final bool isPrefixIcon;
  final bool obstruct;
  final bool isDateField;

  CustomTextField({
    required this.hintText,
    required this.initialValue,
    required this.width,
    required this.onChange,
    this.onTap,
    this.textInputType = TextInputType.text,
    this.icon = Icons.location_on,
    this.isPrefixIcon = false,
    this.obstruct = false,
    this.isDateField = false,
  });

  @override
  Widget build(BuildContext context) {
    return (isDateField == false)
        ? Container(
            padding: EdgeInsets.symmetric(
              horizontal: 8,
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1, color: Colors.black),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(.1),
                      blurRadius: 3,
                      offset: Offset(0, 5))
                ]),
            child: Padding(
              padding: (isPrefixIcon)
                  ? EdgeInsets.all(0)
                  : EdgeInsets.only(left: 16),
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
                      hintStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400))),
            ),
          )
        : Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1, color: Colors.black),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(.1),
                      blurRadius: 3,
                      offset: const Offset(0, 5))
                ]),
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: TextField(
                  readOnly: true,
                  onTap: OnTap,
                  maxLength: 10,
                  obscureText: false,
                  style: const TextStyle(fontSize: 16),
                  decoration: const InputDecoration(
                      counterText: "",
                      border: InputBorder.none,
                      hintText: "Enter your DOB",
                      prefixIcon: null,
                      hintStyle: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400))),
            ),
          );
  }
}
