import 'package:cenafoodie/src/data/models/ui/ui_response.dart';

import '../../models/entities/category/category.dart';

abstract class ICategoryService {
  ///Get user by id
  Future<UiResponse<List<Category>>> fetchAllByStore({required int storeId});

  /// Add category to store
  Future<UiResponse<Category>> add({
    required Category category,
  });

  ///Update category
  Future<UiResponse<String>> update({
    required Category category,
  });

  /// Delete category
  Future<UiResponse<String>> delete({
    required int storeId,
    required int categoryId,
  });
}
