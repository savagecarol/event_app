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
      userName: "@RandomSundar guy",
      name: "Sundar Pichai",
      eventTime: DateTime.now(),
      title: "Lets Ride",
      description:
          "i am going online tomorrow for cycling event looking for a partner age 24 for this event",
      tagList: [
        TagName(id: "12", tagName: "Cycling"),
        TagName(id: "123", tagName: "Badminton")
      ],
      images: [
        "https://velocrushindia.com/wp-content/uploads/2016/05/photo-1517649763962-0c623066013b.jpg",
        "https://cyclingmonks.com/wp-content/uploads/2021/01/Amateur-Bicycle-Races-in-India.jpg",
        "https://rukminim1.flixcart.com/image/850/1000/xif0q/cycle/n/x/l/old-skool-26t-cycle-26-23-east-coast-115-single-speed-original-imagmzejgzzyd2ga.jpeg?q=90",
      ]),
  Post(
      postRenderEnum: PostRenderEnum.message,
      userId: "dsfdsfdsf",
      id: "121212",
      userName: "@savageCarol",
      name: "Kartikeya Sharma",
      eventTime: DateTime.now(),
      title: "lets play game ",
      description: "tomorrow there is cricket event in my colony sector 52 , d block we are looking for people to join us to play ",
      tagList: [
        TagName(id: "12", tagName: "Cricket"),
        TagName(id: "123", tagName: "sports")
      ],
      images: [
        "https://in.boredgamecompany.com/wp-content/uploads/2022/05/Package_Print-2-2-scaled.jpg" , 
        "https://upload.wikimedia.org/wikipedia/commons/9/98/%27Gully_Cricket%27_played_on_racecourse_grounds..JPG"
      ]),
  Post(
      postRenderEnum: PostRenderEnum.approval,
      userId: "dsfdsfdsf",
      id: "121212",
      userName: "@savageCarol",
      name: "Kartikeya Sharma",
      eventTime: DateTime.now(),
      title: "Music Night ",
      description: "Tomorrow there is music fest at abes college looking for parnter to attend with me ",
      tagList: [
        TagName(id: "12", tagName: "Music"),
        TagName(id: "123", tagName: "Art")
      ],
      images: [
        "https://unwindpune.in/wp-content/uploads/2022/01/Saturday-Night-Live-Music-Pune.jpg",
        "https://s3.envato.com/files/186588256/Preview.jpg"
      ]),
];

List<ParentTag> popularList = [
  ParentTag(
      id: "121212",
      name: "Sports",
      image:
          "https://img.freepik.com/premium-vector/sport-fans-stadium-people-black-silhouettes-stadium-background-soccer-football-match-spotlight-team-supporters-stand-hand-flag-posters-arena-cartoon-vector-championship-concept_176411-2762.jpg?w=2000",
      popular: true),
  ParentTag(
      id: "121212",
      name: "Online games",
      image:
          "https://wallpaper.dog/large/10699147.jpg",
      popular: true),
  ParentTag(
      id: "121212",
      name: "Art",
      image:
          "https://res.cloudinary.com/hz3gmuqw6/image/upload/c_fill,f_auto,h_400,q_60,w_600/v1/classpop/64c1630c78597.jpg",
      popular: true),
  ParentTag(
      id: "121212",
      name: "Money",
      image:
          "https://www.shutterstock.com/shutterstock/videos/16504738/thumb/1.jpg",
      popular: true),
  ParentTag(
      id: "121212",
      name: "Comedy",
      image:
          "https://cdn.britannica.com/84/105184-050-DF02936A/Charlie-Chaplin-Little-Tramp.jpg",
      popular: true),
  ParentTag(
      id: "121212",
      name: "Motivational",
      image:
          "https://www.simplilearn.com/ice9/free_resources_article_thumb/theories_of_motivation.jpg",
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
      userName: "@RandomSundar guy",
      name: "Sundar Pichai",
      eventTime: DateTime.now(),
      title: "Lets Ride",
      description:
          "i am going online tomorrow for cycling event looking for a partner age 24 for this event",
      tagList: [
        TagName(id: "12", tagName: "Cycling"),
        TagName(id: "123", tagName: "Badminton")
      ],
      images: [
        "https://velocrushindia.com/wp-content/uploads/2016/05/photo-1517649763962-0c623066013b.jpg",
        "https://cyclingmonks.com/wp-content/uploads/2021/01/Amateur-Bicycle-Races-in-India.jpg",
        "https://rukminim1.flixcart.com/image/850/1000/xif0q/cycle/n/x/l/old-skool-26t-cycle-26-23-east-coast-115-single-speed-original-imagmzejgzzyd2ga.jpeg?q=90",
      ]),
  Post(
      postRenderEnum: PostRenderEnum.message,
      userId: "dsfdsfdsf",
      id: "121212",
      userName: "@savageCarol",
      name: "Kartikeya Sharma",
      eventTime: DateTime.now(),
      title: "lets play game ",
      description: "tomorrow there is cricket event in my colony sector 52 , d block we are looking for people to join us to play ",
      tagList: [
        TagName(id: "12", tagName: "Cricket"),
        TagName(id: "123", tagName: "sports")
      ],
      images: [
        "https://in.boredgamecompany.com/wp-content/uploads/2022/05/Package_Print-2-2-scaled.jpg" , 
        "https://upload.wikimedia.org/wikipedia/commons/9/98/%27Gully_Cricket%27_played_on_racecourse_grounds..JPG"
      ]),
  Post(
      postRenderEnum: PostRenderEnum.approval,
      userId: "dsfdsfdsf",
      id: "121212",
      userName: "@savageCarol",
      name: "Kartikeya Sharma",
      eventTime: DateTime.now(),
      title: "Music Night ",
      description: "Tomorrow there is music fest at abes college looking for parnter to attend with me ",
      tagList: [
        TagName(id: "12", tagName: "Music"),
        TagName(id: "123", tagName: "Art")
      ],
      images: [
        "https://unwindpune.in/wp-content/uploads/2022/01/Saturday-Night-Live-Music-Pune.jpg",
        "https://s3.envato.com/files/186588256/Preview.jpg"
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
        TagName(id: "12", tagName: "Badminton"),
        TagName(id: "123", tagName: "Tennis")
      ],
      images: [
        "https://www.thegolfinghub.com/wp-content/uploads/2022/08/DELHI_BADMINTON.jpg"
      ]),
];














List<Post> torchList = [
    Post(
      postRenderEnum: PostRenderEnum.intrested,
      userId: "dsfdsfdsf",
      id: "121212",
      userName: "@RandomSundar guy",
      name: "Sundar Pichai",
      eventTime: DateTime.now(),
      title: "Step 1",
      description:
          "i am going online tomorrow for cycling event looking for a partner age 24 for this event",
      tagList: [
        TagName(id: "12", tagName: "Cycling"),
        TagName(id: "123", tagName: "Badminton")
      ],
      images: [
        "assets/snapshot/three.png",
      ]),

  Post(
      postRenderEnum: PostRenderEnum.approval,
      userId: "dsfdsfdsf",
      id: "121212",
      userName: "@savageCarol",
      name: "Kartikeya Sharma",
      eventTime: DateTime.now(),
     title: "Step 2",
      description: "Tomorrow there is music fest at abes college looking for parnter to attend with me ",
      tagList: [
        TagName(id: "12", tagName: "Music"),
        TagName(id: "123", tagName: "Art")
      ],
      images: ["assets/snapshot/four.png",
      ]),
  Post(
      postRenderEnum: PostRenderEnum.message,
      userId: "dsfdsfdsf",
      id: "121212",
      userName: "@savageCarol",
      name: "Kartikeya Sharma",
      eventTime: DateTime.now(),
     title: "Step 3",
      description: "",
      tagList: [
        TagName(id: "12", tagName: "Badminton"),
        TagName(id: "123", tagName: "Tennis")
      ],
      images: [
            "assets/snapshot/five.png",
      ]),

       Post(
      postRenderEnum: PostRenderEnum.message,
      userId: "dsfdsfdsf",
      id: "121212",
      userName: "@savageCarol",
      name: "Kartikeya Sharma",
      eventTime: DateTime.now(),
     title: "Step 4",
      description: "",
      tagList: [
        TagName(id: "12", tagName: "Badminton"),
        TagName(id: "123", tagName: "Tennis")
      ],
      images: [
            "assets/snapshot/six.png",
      ]),
];

