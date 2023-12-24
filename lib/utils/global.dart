import 'package:connect/enum/post_render_enum.dart';
import 'package:connect/model/message.dart';
import 'package:connect/model/action/GlobalController.dart';
import 'package:connect/model/parent_tag.dart';
import 'package:connect/model/post.dart';
import 'package:connect/model/tag_name.dart';
import 'package:connect/services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'dart:core';

import 'package:image_picker/image_picker.dart';

final GlobalController globalController = Get.put(GlobalController());
final LocationService locationService = LocationService.getInstance();
final ImagePicker picker = ImagePicker();

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

Future<File?> pickImages() async {
  try {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    return File(image.path);
  } on PlatformException {
    showToast(msg: "Nothing is selected");
    return null;
  }
}

Future<List<File>?> getMultipleImages() async {
  List<File> selectedImages = [];
  try {
    final pickedFile = await picker.pickMultiImage(
        imageQuality: 100, maxHeight: 1000, maxWidth: 1000);
    List<XFile> xfilePick = pickedFile;

    if (xfilePick.isNotEmpty) {
      for (var i = 0; i < xfilePick.length; i++) {
        selectedImages.add(File(xfilePick[i].path));
      }
    } else {
      showToast(msg: "Nothing is selected");
      return null;
    }
    return selectedImages;
  } on PlatformException {
    showToast(msg: "Failed to get Images");
    return null;
  }
}

List<Message> listDocument = [
  Message(
      sender: "Kartik",
      receiver: "Piyush",
      message: "New Message",
      senderPigeonId: "1122121",
      receiverPigeonId: "1212",
      isLeft: true,
      isSeen: true),
  Message(
      sender: "Kartik",
      receiver: "Piyush",
      message: "New Message",
      senderPigeonId: "1122121",
      receiverPigeonId: "1212",
      isLeft: true,
      isSeen: true),
  Message(
      sender: "Kartik",
      receiver: "Piyush",
      message: "New Message",
      senderPigeonId: "1122121",
      receiverPigeonId: "1212"),
];

List<Post> postList = [
  Post(
      postRenderEnum: PostRenderEnum.intrested,
      userId: "dsfdsfdsf",
      id: "121212",
      userName: "@savageCarol",
      name: "Kartikeya Sharma",
      eventTime: DateTime.now(),
      title: "lets play game ",
      description:
          "we are organinzing the sports event tomorrow with my fiends in the sport complex come on guys we will have fun lets do it",
      tagList: [
        TagName(id: "12", tagName: "Cricket"),
        TagName(id: "123", tagName: "Cricket")
      ],
      images: [
        "https://wallpapers.com/images/featured/beautiful-scenery-wnxju2647uqrcccv.jpg",
        "https://wallpapers.com/images/featured/beautiful-scenery-wnxju2647uqrcccv.jpg",
        "https://wallpapers.com/images/featured/beautiful-scenery-wnxju2647uqrcccv.jpg",
        "https://wallpapers.com/images/featured/beautiful-scenery-wnxju2647uqrcccv.jpg"
      ]),
  Post(
      postRenderEnum: PostRenderEnum.message,
      userId: "dsfdsfdsf",
      id: "121212",
      userName: "@savageCarol",
      name: "Kartikeya Sharma",
      eventTime: DateTime.now(),
      title: "lets play game ",
      description: "",
      tagList: [
        TagName(id: "12", tagName: "Cricket"),
        TagName(id: "123", tagName: "Cricket")
      ],
      images: [
        "https://wallpapers.com/images/featured/beautiful-scenery-wnxju2647uqrcccv.jpg"
      ]),
  Post(
      postRenderEnum: PostRenderEnum.approval,
      userId: "dsfdsfdsf",
      id: "121212",
      userName: "@savageCarol",
      name: "Kartikeya Sharma",
      eventTime: DateTime.now(),
      title: "lets play game ",
      description: "",
      tagList: [
        TagName(id: "12", tagName: "Cricket"),
        TagName(id: "123", tagName: "Cricket")
      ],
      images: [
        "https://p7.hiclipart.com/preview/466/652/1016/5bbdf7443b97c.jpg"
      ]),
];

List<ParentTag> popularList = [
  ParentTag(
      id: "121212",
      name: "Sports",
      image:
          "https://wallpapers.com/images/featured/beautiful-scenery-wnxju2647uqrcccv.jpg",
      popular: true),
  ParentTag(
      id: "121212",
      name: "Online",
      image:
          "https://wallpapers.com/images/featured/beautiful-scenery-wnxju2647uqrcccv.jpg",
      popular: true),
  ParentTag(
      id: "121212",
      name: "Health",
      image:
          "https://wallpapers.com/images/featured/beautiful-scenery-wnxju2647uqrcccv.jpg",
      popular: true),
  ParentTag(
      id: "121212",
      name: "Health",
      image:
          "https://wallpapers.com/images/featured/beautiful-scenery-wnxju2647uqrcccv.jpg",
      popular: true),
  ParentTag(
      id: "121212",
      name: "Health",
      image:
          "https://wallpapers.com/images/featured/beautiful-scenery-wnxju2647uqrcccv.jpg",
      popular: true),
  ParentTag(
      id: "121212",
      name: "Health",
      image:
          "https://wallpapers.com/images/featured/beautiful-scenery-wnxju2647uqrcccv.jpg",
      popular: true),
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
      postRenderEnum: PostRenderEnum.intrested,
      userId: "dsfdsfdsf",
      id: "121212",
      userName: "@savageCarol",
      name: "Kartikeya Sharma",
      eventTime: DateTime.now(),
      title: "lets play game ",
      description: "",
      tagList: [
        TagName(id: "12", tagName: "Cricket"),
        TagName(id: "123", tagName: "Cricket")
      ],
      images: [
        "https://wallpapers.com/images/featured/beautiful-scenery-wnxju2647uqrcccv.jpg"
      ]),
  Post(
      postRenderEnum: PostRenderEnum.approval,
      userId: "dsfdsfdsf",
      id: "121212",
      userName: "@savageCarol",
      name: "Kartikeya Sharma",
      eventTime: DateTime.now(),
      title: "lets play game ",
      description: "",
      tagList: [
        TagName(id: "12", tagName: "Cricket"),
        TagName(id: "123", tagName: "Cricket")
      ],
      images: [
        "https://wallpapers.com/images/featured/beautiful-scenery-wnxju2647uqrcccv.jpg"
      ]),
  Post(
      postRenderEnum: PostRenderEnum.approval,
      userId: "dsfdsfdsf",
      id: "121212",
      userName: "@savageCarol",
      name: "Kartikeya Sharma",
      eventTime: DateTime.now(),
      title: "lets play game ",
      description: "",
      tagList: [
        TagName(id: "12", tagName: "Cricket"),
        TagName(id: "123", tagName: "Cricket")
      ],
      images: [
        "https://p7.hiclipart.com/preview/466/652/1016/5bbdf7443b97c.jpg"
      ]),
  Post(
      postRenderEnum: PostRenderEnum.intrested,
      userId: "dsfdsfdsf",
      id: "121212",
      userName: "@savageCarol",
      name: "Kartikeya Sharma",
      eventTime: DateTime.now(),
      title: "lets play game ",
      description: "",
      tagList: [
        TagName(id: "12", tagName: "Cricket"),
        TagName(id: "123", tagName: "Cricket")
      ],
      images: [
        "https://wallpapers.com/images/featured/beautiful-scenery-wnxju2647uqrcccv.jpg"
      ]),
  Post(
      postRenderEnum: PostRenderEnum.message,
      userId: "dsfdsfdsf",
      id: "121212",
      userName: "@savageCarol",
      name: "Kartikeya Sharma",
      eventTime: DateTime.now(),
      title: "lets play game ",
      description: "",
      tagList: [
        TagName(id: "12", tagName: "Cricket"),
        TagName(id: "123", tagName: "Cricket")
      ],
      images: [
        "https://wallpapers.com/images/featured/beautiful-scenery-wnxju2647uqrcccv.jpg"
      ]),
];
