import 'package:connect/presentation/components/custom_mesage_box.dart';
import 'package:connect/presentation/components/custom_snippet.dart';
import 'package:connect/presentation/components/custom_text_field.dart';
import 'package:connect/utils/colors_constants.dart';
import 'package:connect/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChatScreen extends StatefulWidget {
  final String displayName;
  final String phoneNumber;
  final int userId;
  final int friendId;
  const ChatScreen(
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
    return customScaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(widget.displayName, () {
        Get.back();
      }),
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
    );
  }
}
