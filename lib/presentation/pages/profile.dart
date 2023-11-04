import 'package:event_app/presentation/components/custom_button.dart';
import 'package:event_app/utils/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var t = "login";
  var isLgOutButtonLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      padding: const EdgeInsets.all(32),
      child: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () async{
                const url = 'https://www.geeksforgeeks.org/';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Terms And Condition" , style: TextStyle( fontWeight:  FontWeight.bold , fontSize: 10), ),
                  InkWell(
                    child: Icon(Icons.arrow_forward))
                ],
              ),
            ),
            
            SizedBox(height: 20),

            

            SizedBox(height: 20),


            CustomButton(
              onTap: () {
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
