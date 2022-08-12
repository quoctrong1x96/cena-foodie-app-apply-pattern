import '../../models/entities/product/product.dart';
import '../../models/entities/product/product_image.dart';
import '../../models/ui/ui_response.dart';

abstract class IProductService {
  ///Add product
  Future<UiResponse<String>> add({
    required int storeId,
    required String name,
    required String description,
    required String price,
    required List<String> images,
    required String category,
  });

  ///Update product
  Future<UiResponse<String>> update({
    required int storeId,
    required int productId,
    required String name,
    required String description,
    required String price,
    required List<String> images,
    required String category,
  });

  ///Delete product
  Future<UiResponse<String>> delete({
    required int storeId,
    required int productId,
  });

  ///Get all product of store
  Future<UiResponse<List<Product>>> fetchAll({required int storeId});

  ///Get list images of product
  Future<UiResponse<List<ProductImage>>> getImages({
    required int storeId,
    required int productId,
  });

  ///Search product by name
  Future<UiResponse<void>> searchByName({required String productName});

  ///Search product by category
  Future<UiResponse<void>> searchByCategory({required String categoryName});

  //Update status of product
  Future<UiResponse<String>> updateStatus({
    required int storeId,
    required int productId,
    required String status,
  });
}
