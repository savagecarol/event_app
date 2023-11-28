import 'package:connect/model/parent_tag.dart';

class Tag {
  String id;
  String tagName;
  ParentTag parentTag;
  Tag({
    required this.id,
    required this.tagName,
    required this.parentTag
  });

}
