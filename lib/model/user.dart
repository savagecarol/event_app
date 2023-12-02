import 'package:connect/model/post.dart';


class User {
  String id;
  String userName;
  String name;
  String bio;
  List<String> tagList;
  String profileImage;
  List<Post> postList;

 User (
  {   
    required this.id,
    required this.userName,
    required this.name,
    required this.tagList,
    required this.bio,
    required this.postList,
    required this.profileImage
 });
}
