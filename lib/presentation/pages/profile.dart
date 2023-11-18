import 'package:event_app/presentation/Auth.dart';
import 'package:event_app/presentation/components/custom_button.dart';
import 'package:event_app/presentation/components/custom_text_button.dart';
import 'package:event_app/presentation/components/custom_text_field.dart';
import 'package:event_app/utils/colors_constants.dart';
import 'package:event_app/utils/url_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/global.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var t = "login";
  var isLgOutButtonLoading = false;

  String? phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(32),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
        CustomTextButton(text:   "Terms And Condition",  
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
        
          ],
        ),
      ),
    );
  }
}
