import 'package:connect/presentation/chat_screen.dart';
import 'package:connect/presentation/components/custom_chat_card.dart';
import 'package:connect/presentation/components/custom_snippet.dart';
import 'package:connect/utils/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: ColorConstants.black,
        title:customWhiteText("Chat", 32.h, fontWeight: FontWeight.bold),
        ),
      body: SingleChildScrollView(
        child: Padding(
        padding: EdgeInsets.only(bottom: 16.h, right: 16.w , left: 16.w ),
        child: Column(
          children: [
        for(int i = 0 ; i < 20 ; i++)
        CustomChatCard(
          name :  "kartikeya" , 
          message : "Hello worlf" , 
          time : "10:55" , 
          isRead : true , 
          image : "https://p7.hiclipart.com/preview/466/652/1016/5bbdf7443b97c.jpg",
          onTap: () {
              Get.to(
                  ChatScreen(
                    displayName: "Kartikeya",
                    phoneNumber: "7830980280",
                    userId: 12222,
                    friendId: 1231)
                    );    
            },
          )
          ],
          ),
        ),
        
    
      ),
    );
  }
}