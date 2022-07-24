import 'dart:convert';

import 'package:http/http.dart' as http;

import '../helpers/secure_storage.dart';
import '../models/response/category_all_response.dart';
import '../models/response/response_default.dart';
import '../services/url.dart';

class CategoryController {
  Future<ResponseDefault> addNewCategory(
      String nameCategory, String descriptionCategory, int storeId) async {
    final token = await secureStorage.readToken();

    final response = await http.post(
        Uri.parse('${URLS.URL_API}/v1/stores/$storeId/categories'),
        headers: {
          'Accept': 'application/json',
          'xx-token': token!
        },
        body: {
          'category': nameCategory,
          'description': descriptionCategory,
        });

    return ResponseDefault.fromJson(jsonDecode(response.body));
  }

  Future<ResponseDefault> updateCategory(int categoryId, String nameCategory,
      String descriptionCategory, int storeId) async {
    final token = await secureStorage.readToken();

    final response = await http.put(
        Uri.parse('${URLS.URL_API}/v1/stores/$storeId/categories/$categoryId'),
        headers: {'Accept': 'application/json', 'xx-token': token!},
        body: {'category': nameCategory, 'description': descriptionCategory});

    return ResponseDefault.fromJson(jsonDecode(response.body));
  }

  Future<List<Category>> getAllCategories(int storeId) async {
    final token = await secureStorage.readToken();

    final response = await http.get(
        Uri.parse('${URLS.URL_API}/v1/stores/$storeId/categories'),
        headers: {'Accept': 'application/json', 'xx-token': token!});

    return CategoryAllResponse.fromJson(jsonDecode(response.body)).categories;
  }

  Future<List<String>> getCategoriesByStoreId(int storeId) async {
    try {
      final token = await secureStorage.readToken();

      final response = await http.get(
          Uri.parse('${URLS.URL_API}/v1/stores/$storeId/categories'),
          headers: {
            'Accept': 'application/json',
            'xx-token': token!,
          });

      final data =
          CategoryAllResponse.fromJson(jsonDecode(response.body)).categories;
      if (data.isNotEmpty) {
        List<String> result = [];
        for (var e in data) {
          result.add(e.category);
        }
        return result;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<ResponseDefault> deleteCategory(int storeId, int idCategory) async {
    final token = await secureStorage.readToken();

    final resp = await http.delete(
        Uri.parse('${URLS.URL_API}/v1/stores/$storeId/categories/$idCategory'),
        headers: {'Content-type': 'application/json', 'xx-token': token!});

    return ResponseDefault.fromJson(jsonDecode(resp.body));
  }
}

final categoryController = CategoryController();
