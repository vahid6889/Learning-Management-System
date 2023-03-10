import 'package:json_annotation/json_annotation.dart';
part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  CategoryModel({
    required this.categoryList,
    required this.message,
    required this.status,
    required this.code,
  });

  List<CategoryList> categoryList;
  String message;
  bool status;
  int code;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}

@JsonSerializable()
class CategoryList {
  CategoryList({
    required this.id,
    required this.name,
    required this.picture,
    this.pictureType,
    required this.courseCount,
  });

  String id;
  String name;
  String picture;
  String? pictureType;
  int courseCount;

  factory CategoryList.fromJson(Map<String, dynamic> json) =>
      _$CategoryListFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryListToJson(this);
}
