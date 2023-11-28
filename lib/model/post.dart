import 'package:connect/model/tag.dart';

class Post {
  String id;
  String userName;
  String name;
  String post;
  DateTime eventTime;
  List<String> tagList;
  List<String> images;
  Post(
      {required this.id,
      required this.userName,
      required this.name,
      required this.post,
      required this.eventTime,
      required this.tagList,
      required this.images});
}
