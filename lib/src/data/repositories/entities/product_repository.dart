import '../../models/entities/product/product.dart';
import '../../models/entities/product/product_image.dart';
import '../../models/ui/ui_response.dart';
import '../../services/entities/product_service.dart';
import '../base_repository.dart';

class ProductRepository extends BaseRepository implements IProductService {
  @override
  Future<UiResponse<String>> add(
      {required int storeId,
      required String name,
      required String description,
      required String price,
      required List<String> images,
      required String category}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response = await cenaService.addProduct(
        storeId: storeId,
        name: name,
        description: description,
        price: price,
        images: images,
        category: category);
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<String>> delete(
      {required int storeId, required int productId}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response =
        await cenaService.deleteProduct(storeId: storeId, productId: productId);
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<List<Product>>> fetchAll({required int storeId}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response = await cenaService.fetchAllProduct(storeId: storeId);
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<List<ProductImage>>> getImages(
      {required int storeId, required int productId}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response = await cenaService.getProductImages(
        storeId: storeId, productId: productId);
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<List<Product>>> searchByCategory(
      {required String categoryName}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response =
        await cenaService.searchProductByCategory(categoryName: categoryName);
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<void>> searchByName({required String productName}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response =
        await cenaService.searchProductByName(productName: productName);
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<String>> update(
      {required int storeId,
      required int productId,
      required String name,
      required String description,
      required String price,
      required List<String> images,
      required String category}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response = await cenaService.updateProduct(
        storeId: storeId,
        productId: productId,
        name: name,
        description: description,
        price: price,
        images: images,
        category: category);
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<String>> updateStatus(
      {required int storeId,
      required int productId,
      required String status}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response = await cenaService.updateProductStatus(
        storeId: storeId, productId: productId, status: status);
    return UiResponse.map(response);
  }
}
