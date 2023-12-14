import 'package:connect/enum/post_render_enum.dart';
import 'package:connect/model/tag.dart';
import 'package:connect/model/tag_name.dart';

class Post {
  String id;
  String userId;
  String userName;
  String name;
  String title;
  String description;
  DateTime eventTime;
  List<TagName> tagList;
  List<String> images;
  PostRenderEnum postRenderEnum;

  Post(
      {required this.id,
      required this.userId,
      required this.userName,
      required this.name,
      required this.title,
      required this.eventTime,
      required this.tagList,
      required this.images,
      required this.description,
      required this.postRenderEnum});
}
