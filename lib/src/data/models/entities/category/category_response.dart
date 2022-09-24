import '../../base_model.dart';
import 'category.dart';

class CategoryFetchResponse implements IModel {
  List<Category>? categories;

  CategoryFetchResponse({this.categories});

  factory CategoryFetchResponse.fromJson(List<dynamic>? list) {
    final List<Category>? data = [];
    list?.forEach((value) {
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
