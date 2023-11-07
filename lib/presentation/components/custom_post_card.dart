import 'package:event_app/presentation/components/custom_button.dart';
import 'package:flutter/material.dart';

class CustomPostCard extends StatelessWidget {
// common properties
  final FontWeight fontWeight;
  final double fontSize;
  final Color fontColor;
  final double iconSize;
  final Color postBackgroundColor;

// card properties
  final String postHeading;
  final DateTime postDate;
  final bool borderAvailable;
  final Color borderColor;
  final IconData bottomLeftIcon1;
  final IconData? bottomLeftIcon2;
  final IconData? bottomLeftIcon3;
  final IconData bottomRightIcon1;
  final IconData? bottomRightIcon2;
  final IconData? bottomRightIcon3;

  // Image properties
  final String postImagePath;
  final double imageSize;
  final String? imagConstraints; // like dit-in, collapsed etc.

  const CustomPostCard(
      {super.key,
      this.fontWeight = FontWeight.bold,
      this.postBackgroundColor = Colors.white,
      this.fontSize = 20,
      this.fontColor = Colors.black,
      required this.postHeading,
      required this.postDate,
      this.borderAvailable = true,
      this.borderColor = Colors.black,
      this.bottomLeftIcon1 = Icons.heart_broken,
      this.bottomLeftIcon2,
      this.bottomLeftIcon3,
      this.bottomRightIcon1 = Icons.comment,
      this.bottomRightIcon2,
      this.bottomRightIcon3,
      required this.postImagePath,
      this.imageSize = 18,
      this.iconSize = 32,
      this.imagConstraints});

// divide in 3 parts, upper middle and lower

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
      padding: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.black, width: 0.5, style: BorderStyle.solid),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: Column(
        children: [createHeader(), createBody(), createFooter()],
      ),
    ));
  }

  Widget createHeader() {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.all(3.0),
        padding: const EdgeInsets.all(3.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              postHeading,
              style: TextStyle(fontWeight: fontWeight, fontSize: fontSize),
            ),
            Text(
              "${postDate.day}/${postDate.month}/${postDate.year}",
              style: TextStyle(fontWeight: fontWeight, fontSize: fontSize),
            ),
          ],
        ),
      ),
    );
  }

  Widget createBody() {
    return GestureDetector(
      child: Container(
          margin: const EdgeInsets.all(0), child: Image.asset(postImagePath)),
    );
  }

  Widget createFooter() {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.all(3.0),
        padding: const EdgeInsets.all(3.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              onTap: () => {       
                
                     },
              containerColor: postBackgroundColor,
              shadowColor: postBackgroundColor,
              postIcon: Icons.heat_pump_rounded,
              postIconSize: 50,
              visiblepostIcon: true,
            ),
            CustomButton(
              onTap: () => {},
              containerColor: postBackgroundColor,
              shadowColor: postBackgroundColor,
              postIcon: Icons.comment,
              postIconSize: 50,
              visiblepostIcon: true,
            )
          ],
        ),
      ),
    );
  }
}
