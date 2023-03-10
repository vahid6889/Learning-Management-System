import 'dart:convert';
import 'package:learning_management_system/domain/categories_model/category_model.dart';
import 'package:learning_management_system/presentation/resources/service_manager.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';
import 'package:dio/dio.dart';
import 'dart:io';

class CategoryService {
  /// Get list all categories

  static Future<dynamic> getAll() async {
    final _dio = Dio();
    try {
      final response = await _dio.get(ApiService.listCategories);
      if (response.statusCode == HttpStatus.ok) {
        // CategoryModel _model = CategoryModel.fromJson(response.data);
        // return _model;
        return response.data;
      }

      return response.data;
    } on DioError catch (e) {
      return e.response?.data ?? 'Error occurred';
    }
  }

// Future<CategoryList>
  // static getAllList() async {
  // static Future<CategoryList> getAllList() async {
  //   // try {
  //   var client = http.Client();
  //   var url = Uri.parse(ApiService.listCategories);
  //   var response =
  //       await client.get(url, headers: {'accept': 'application/json'});
  //   // if (response.statusCode == HttpStatus.ok) {
  //   // List<CategoryModel> _model = CategoryList.fromJson(json.decode(response.body));
  //   // return _model;
  //   return CategoryList.fromJson(json.decode(response.body));
  //   // }
  //   // else {
  //   //   return response.statusCode;
  //   // }
  //   // } catch (e) {
  //   //   log(e.toString());
  //   // }
  // }
}
