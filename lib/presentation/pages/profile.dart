import 'package:event_app/presentation/components/custom_button.dart';
import 'package:event_app/presentation/components/custom_text_button.dart';
import 'package:event_app/presentation/components/custom_text_field.dart';
import 'package:event_app/utils/colors_constants.dart';
import 'package:event_app/utils/url_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/global.dart';

class Profile extends StatelessWidget {
  var isLgOutButtonLoading = false;


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(32),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            SizedBox(height: 10),
            CustomTextField(
              hintText: "Enter Phone Number",
              initialValue: "",
              width: double.infinity,
              onChange: (value) {
                userController.changePhoneNumber(value);
                print(userController.user.value.phoneNumber);
              },
            ),
            SizedBox(height: 20),
            CustomTextButton(
                text: "Terms And Condition",
                isPostIcon: true,
                margin: EdgeInsets.only(bottom: 8),
                fontSize: 16,
                iconSize: 22,
                onTap: () async {
                  const url = 'https://www.geeksforgeeks.org/';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                }),
            SizedBox(height: 20),
            CustomButton(
              onTap: () {
                var p = validatePhoneNumber(userController.user.value.phoneNumber);
                if (p != null) {
                  showToast(msg: p);
                  return;
                }
                Get.offNamed(Urlconstants.authUrl);
              },
              containerColor: Colors.transparent,
              shadowColor: ColorConstants.pink,
              labelTextWeight: FontWeight.bold,
              labelText: "Logout",
              isLoading: isLgOutButtonLoading,
            )
          ],
        ),
      ),
    );
  }
}
