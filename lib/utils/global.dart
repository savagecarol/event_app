import 'package:connect/model/message.dart';
import 'package:connect/model/action/GlobalController.dart';
import 'package:connect/model/parent_tag.dart';
import 'package:connect/model/post.dart';
import 'package:connect/model/tag.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

final GlobalController globalController = Get.put(GlobalController());

String? validatePhoneNumber(String? phone) {
  String? required = requiredString(phone);
  if (required != null) return required;
  Pattern pattern = r'^(?:[+0]9)?[0-9]{10}$';
  RegExp regex = RegExp(pattern.toString());
  return (!regex.hasMatch(phone!)) ? 'Enter Valid Phone Number!!' : null;
}

String? requiredString(String? value) {
  if (value == null || value.isEmpty) return 'Required !!!';
  return null;
}

showToast({required String? msg}) {
  if (msg != null) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP_RIGHT,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.black,
        textColor: Colors.black,
        fontSize: 16.0);
  }
}

String showTime(DateTime time) {
  Duration diff = DateTime.now().difference(time);
  if (diff.inHours.abs() > 48) {
    return "${time.day}/${time.month}/${time.year}";
  } else if (diff.inHours.abs() > 24) {
    return "Yesterday";
  } else {
    return "${time.hour}:${time.minute}";
  }
}


List<Message> listDocument = [
    Message(
        sender: "Kartik",
        receiver: "Piyush",
        message: "New Message",
        senderPigeonId: "1122121",
        receiverPigeonId: "1212" ,
        isLeft: true , 
        isSeen: true),
    Message(
        sender: "Kartik",
        receiver: "Piyush",
        message: "New Message",
        senderPigeonId: "1122121",
        receiverPigeonId: "1212" ,isLeft: true , 
        isSeen: true),
    Message(
        sender: "Kartik",
        receiver: "Piyush",
        message: "New Message",
        senderPigeonId: "1122121",
        receiverPigeonId: "1212" ),
  ];


List<Post> postList = [
    Post(
        id: "121212",
        userName: "@savageCarol",
        name : "Kartikeya Sharma" , 
        eventTime : DateTime.now() , 
        post : "dsfdsfdsf nsadjkasdn kjnadskjsnad nsadksandkja dskfmdkslf dknfdsfms",
        tagList: [ "Cricket" , "FootBall"  , "DJ"] , 
        images: ["https://buffer.com/library/content/images/2023/10/free-images.jpg" , "https://buffer.com/library/content/images/2023/10/free-images.jpg"]
       ),

        Post(
        id: "121212",
        userName: "@savageCarol",
        name : "Kartikeya Sharma" , 
        eventTime : DateTime.now() , 
        post : "lets play game ",
        tagList: [ "Cricket" , "FootBall"  , "DJ"] , 
        images: []
       ),
  ];



    List<String> chipList = [
    "CRICKET",
    "BADMINTON",
    "MUSIC",
    "SPORTS",
    "CHESS",
    "DJ",
    "ART",
    "DRAWING",
    "SKETCHING",
    "COFFEE"
  ];