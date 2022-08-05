import '../../base_model.dart';
import 'product.dart';

class ProductFetchResponse implements IModel {
  List<Product>? products;

  ProductFetchResponse({this.products});

  factory ProductFetchResponse.fromJson(
    Map<String, dynamic>? productsJson,
  ) {
    final List<Product>? data = [];
    productsJson?.forEach((key, value) {
      // Here key is product id and value is product data (map)
      data?.add(Product.fromJson(value));
    });
    return ProductFetchResponse(products: data);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'products': products?.map((x) => x.toJson()),
    };
  }
}
