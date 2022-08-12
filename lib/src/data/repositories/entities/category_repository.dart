import '../../models/entities/category/category.dart';
import '../../models/ui/ui_response.dart';
import '../../services/entities/category_service.dart';
import '../base_repository.dart';

class CategoryRepository extends BaseRepository implements ICategoryService {
  @override
  Future<UiResponse<Category>> add({required Category category}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response = await cenaService.addCategory(category: category);
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<String>> delete(
      {required int storeId, required int categoryId}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response = await cenaService.deleteCategory(
        storeId: storeId, categoryId: categoryId);
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<List<Category>>> fetchAllByStore(
      {required int storeId}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response = await cenaService.fetchAllCategory(storeId: storeId);
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<String>> update({required Category category}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response = await cenaService.updateCategory(category: category);
    return UiResponse.map(response);
  }
}
