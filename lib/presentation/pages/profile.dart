import 'dart:ffi';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:event_app/utils/global.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var buttonText = "true";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      child: Column(
        children: [
          getButton(buttonText),
          getButton(buttonText.toBoolean() ? "false" : "true")
        ], // To reverse the two values
      ),
    );
  }

  Widget getButton(String text) {
    return InkWell(
        onTap: () {
          setState(() {
            var randomButtonGenerator = Random();
            buttonText = "${randomButtonGenerator.nextBool()}";
            print("Hey I am clicked");
            print("My new value is: $buttonText");
            //Doubt: How to make the boxShadow disapper wheneer a user taps on it.
          });
        },
        child: Container(
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(5),
              boxShadow: const <BoxShadow>[
                BoxShadow(blurRadius: 5.0, blurStyle: BlurStyle.normal)
              ]),
          height: 60,
          child: Center(
              child: Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          )),
          //  color: Colors.amber,
        ));
  }
}

// Doubt: How tokeep this in global and use here

extension on String {
  bool toBoolean() {
    print(this);
    return (toLowerCase() == "true" || toLowerCase() == "1")
        ? true
        : (toLowerCase() == "false" || toLowerCase() == "0")
            ? false
            : false; //CASE: Didn't match any case above
  }
}
