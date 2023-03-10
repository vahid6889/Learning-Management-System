import 'package:dartz/dartz.dart';
import 'package:learning_management_system/presentation/constants/categories_list.dart';
import 'package:learning_management_system/presentation/services/category_service.dart';
import 'package:learning_management_system/domain/categories_model/category_model.dart';

class CategoryController {
  static Future<List<CategoryModel>?> getCategories() async {
    late var _categoryModel;
    late var _categoryList;
    _categoryModel = (await CategoryService.getAll());

    if (_categoryModel != null) {
      _categoryList = _categoryModel['category_list'];
      for (var i = 0; i < _categoryList.length; i++) {
        categoriesList.add(
          _categoryList[i]['name'],
        );
        categorySeeAllList.add(
          CategoryList(
            id: _categoryList[i]['id'],
            name: _categoryList[i]['name'],
            picture: _categoryList[i]['picture'],
            courseCount: _categoryList[i]['course_count'],
          ),
        );
      }
    }
  }
}
