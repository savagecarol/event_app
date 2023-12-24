import 'package:connect/presentation/components/custom_snippet.dart';
import 'package:connect/utils/colors_constants.dart';
import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
  final String hintText;
  final String initialValue;
  final TextInputType textInputType;
  final Function(String?)? onChange;
  final IconData icon;
  final bool isPrefixIcon;
  final bool obstruct;
  final Function() onTap;
  final bool isEnable;
  final int maxLength;

  CustomTextField(
      {required this.hintText,
      required this.initialValue,
      required this.onChange,
      this.textInputType = TextInputType.text,
      this.icon = Icons.location_on,
      this.isPrefixIcon = false,
      this.obstruct = false,
      this.onTap = chipConstFunc , 
      this.isEnable = true,
      this.maxLength  = 1000
      
      });

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 8,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  // border: Border.all(width: 1, color: Colors.black),
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
                  maxLines: null,
                  enabled: isEnable,
                    maxLength: maxLength,
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
                          color: ColorConstants.black,
                            fontSize: 16, fontWeight: FontWeight.normal))),
              ),
            ),
    );
  }
}
