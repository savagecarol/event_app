import 'package:flutter/material.dart';

// Doubt: How to get the boiler plate code for StateLessWidget and all

class CustomTextField extends StatelessWidget {
  final String defaultText;
  final TextInputType textInputType;
  final bool characterLimitAvailable;
  final int charactersLimit;
  final Color borderColor;
  final bool borderAvailale;
  final Color backgroundColor;
  final bool boxShadowAvailable;

  const CustomTextField(
      {super.key,
      this.defaultText = "Enter your text here",
      this.textInputType = TextInputType.text,
      this.characterLimitAvailable = false,
      this.charactersLimit = 0,
      this.borderAvailale = true,
      this.borderColor = Colors.black,
      this.backgroundColor = Colors.transparent,
      this.boxShadowAvailable = true});

  @override
  Widget build(BuildContext context) {
    //Doubt even though the textType is numbers but what if i enter text via my keyboard
    return Container(
      decoration: BoxDecoration(
          border: (borderAvailale) ? Border.all(color: Colors.black) : Border.all(color: Colors.transparent),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
              color: backgroundColor,
              blurStyle: BlurStyle.normal
            ),
          ]),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 13.0),
        child: TextFormField(
          maxLength: (characterLimitAvailable) ? charactersLimit : null,
          keyboardType: textInputType,
          textAlign: TextAlign.start,
          decoration: InputDecoration(
            hintText: defaultText,
            hintStyle: const TextStyle(color: Colors.grey),
          )),
      )
    );
  }
}
