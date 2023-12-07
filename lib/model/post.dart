import 'package:connect/model/tag.dart';
import 'package:connect/model/tag_name.dart';

class Post {
  String id;
  String userName;
  String name;
  String title;
  String description;
  DateTime eventTime;
  List<TagName> tagList;
  List<String> images;
  Post(
      {required this.id,
      required this.userName,
      required this.name,
      required this.title,
      required this.eventTime,
      required this.tagList,
      required this.images,
      required this.description});
}
