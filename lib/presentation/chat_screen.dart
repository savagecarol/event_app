import 'package:connect/presentation/components/custom_mesage_box.dart';
import 'package:connect/presentation/components/custom_snippet.dart';
import 'package:connect/presentation/components/custom_text_field.dart';
import 'package:connect/utils/colors_constants.dart';
import 'package:connect/utils/global.dart';
import 'package:connect/utils/url_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChatScreen extends StatefulWidget {
  String displayName;
  String phoneNumber;
  int userId;
  int friendId;
  ChatScreen(
      {super.key,
      required this.displayName,
      required this.phoneNumber,
      required this.userId,
      required this.friendId});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return InkWell(
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onTap: () {
                  Get.toNamed(Urlconstants.firstPageUrl);
                },
              );
            },
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customBlackText(widget.displayName, 18.h,
                  fontWeight: FontWeight.bold),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    reverse: true,
                    itemCount: listDocument.length,
                    itemBuilder: (context, index) {
                      return CustomMessageBox(message: listDocument[index]);
                    })),
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: CustomTextField(
                          hintText: "",
                          initialValue: "",
                          textInputType: TextInputType.number,
                          width: 100,
                          onChange: (Value) {})),
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    height: 42.h,
                    child: FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: ColorConstants.iconRed,
                      elevation: 0,
                      child: Icon(
                        Icons.send_rounded,
                        color: Colors.white,
                        size: 18.h,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
