import 'package:connect/model/message.dart';
import 'package:connect/model/action/GlobalController.dart';
import 'package:connect/model/parent_tag.dart';
import 'package:connect/model/post.dart';
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
        title : "lets play game ",
        description: "",
        tagList: [ "Cricket" , "FootBall"  , "DJ"] , 
        images: ["https://wallpapers.com/images/featured/beautiful-scenery-wnxju2647uqrcccv.jpg"]
       ),

        Post(
        id: "121212",
        userName: "@savageCarol",
        name : "Kartikeya Sharma" , 
        eventTime : DateTime.now() , 
        title : "lets play game ",
        description: "",
        tagList: [ "Cricket" , "FootBall"  , "DJ"] , 
        images: ["https://wallpapers.com/images/featured/beautiful-scenery-wnxju2647uqrcccv.jpg"]
       ),

        Post(
        id: "121212",
        userName: "@savageCarol",
        name : "Kartikeya Sharma" , 
        eventTime : DateTime.now() , 
        title : "lets play game ",
        description: "",
        tagList: [ "Cricket" , "FootBall"  , "DJ"] , 
        images: ["https://p7.hiclipart.com/preview/466/652/1016/5bbdf7443b97c.jpg"]
       ),
  ];


List<ParentTag> popularList = [

      ParentTag(
        id: "121212",
        name : "Sports" , 
        image: "https://wallpapers.com/images/featured/beautiful-scenery-wnxju2647uqrcccv.jpg",
        popular: true
       ),

      ParentTag(
        id: "121212",
        name : "Online" , 
        image: "https://wallpapers.com/images/featured/beautiful-scenery-wnxju2647uqrcccv.jpg",
        popular: true
       ),


      ParentTag(
        id: "121212",
        name : "Health" , 
        image: "https://wallpapers.com/images/featured/beautiful-scenery-wnxju2647uqrcccv.jpg",
        popular: true
       ),

      ParentTag(
        id: "121212",
        name : "Health" , 
        image: "https://wallpapers.com/images/featured/beautiful-scenery-wnxju2647uqrcccv.jpg",
        popular: true
       ),

      ParentTag(
        id: "121212",
        name : "Health" , 
        image: "https://wallpapers.com/images/featured/beautiful-scenery-wnxju2647uqrcccv.jpg",
        popular: true
       ),

      ParentTag(
        id: "121212",
        name : "Health" , 
        image: "https://wallpapers.com/images/featured/beautiful-scenery-wnxju2647uqrcccv.jpg",
        popular: true
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


  


List<Post> trendingList = [
        Post(
        id: "121212",
        userName: "@savageCarol",
        name : "Kartikeya Sharma" , 
        eventTime : DateTime.now() , 
        title : "lets play game ",
        description: "",
        tagList: [ "Cricket" , "FootBall"  , "DJ"] , 
        images: ["https://wallpapers.com/images/featured/beautiful-scenery-wnxju2647uqrcccv.jpg"]
       ),

        Post(
        id: "121212",
        userName: "@savageCarol",
        name : "Kartikeya Sharma" , 
        eventTime : DateTime.now() , 
        title : "lets play game ",
        description: "",
        tagList: [ "Cricket" , "FootBall"  , "DJ"] , 
        images: ["https://wallpapers.com/images/featured/beautiful-scenery-wnxju2647uqrcccv.jpg"]
       ),

        Post(
        id: "121212",
        userName: "@savageCarol",
        name : "Kartikeya Sharma" , 
        eventTime : DateTime.now() , 
        title : "lets play game ",
        description: "",
        tagList: [ "Cricket" , "FootBall"  , "DJ"] , 
        images: ["https://p7.hiclipart.com/preview/466/652/1016/5bbdf7443b97c.jpg"]
       ),

          Post(
        id: "121212",
        userName: "@savageCarol",
        name : "Kartikeya Sharma" , 
        eventTime : DateTime.now() , 
        title : "lets play game ",
        description: "",
        tagList: [ "Cricket" , "FootBall"  , "DJ"] , 
        images: ["https://wallpapers.com/images/featured/beautiful-scenery-wnxju2647uqrcccv.jpg"]
       ),  


          Post(
        id: "121212",
        userName: "@savageCarol",
        name : "Kartikeya Sharma" , 
        eventTime : DateTime.now() , 
        title : "lets play game ",
        description: "",
        tagList: [ "Cricket" , "FootBall"  , "DJ"] , 
        images: ["https://wallpapers.com/images/featured/beautiful-scenery-wnxju2647uqrcccv.jpg"]
       ),
  ];


