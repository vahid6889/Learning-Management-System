// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      categoryList: (json['categoryList'] as List<dynamic>)
          .map((e) => CategoryList.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String,
      status: json['status'] as bool,
      code: json['code'] as int,
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'categoryList': instance.categoryList,
      'message': instance.message,
      'status': instance.status,
      'code': instance.code,
    };

CategoryList _$CategoryListFromJson(Map<String, dynamic> json) => CategoryList(
      id: json['id'] as String,
      name: json['name'] as String,
      picture: json['picture'] as String,
      pictureType: json['pictureType'] as String?,
      courseCount: json['courseCount'] as int,
    );

Map<String, dynamic> _$CategoryListToJson(CategoryList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'picture': instance.picture,
      'pictureType': instance.pictureType,
      'courseCount': instance.courseCount,
    };
