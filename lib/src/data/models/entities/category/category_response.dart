import '../../base_model.dart';
import 'category.dart';

class CategoryFetchResponse implements IModel {
  List<Category>? categories;

  CategoryFetchResponse({this.categories});

  factory CategoryFetchResponse.fromJson(Map<String, dynamic>? json) {
    final List<Category>? data = [];
    json?.forEach((key, value) {
      data?.add(Category.fromJson(value));
    });
    return CategoryFetchResponse(categories: data);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'categories': categories?.map((x) => x.toJson()),
    };
  }
}
