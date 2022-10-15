import '../../base_model.dart';
import 'product.dart';

class ProductFetchResponse implements IModel {
  List<Product>? products;

  ProductFetchResponse({this.products});

  factory ProductFetchResponse.fromJson(
    Map<String, dynamic>? productsJson,
  ) {
    try {
      return ProductFetchResponse(
        products: List<Product>.from(
            productsJson!["products"].map((x) => Product.fromJson(x))),
      );
    } catch (e) {
      return ProductFetchResponse(products: null);
    }
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'products': products?.map((x) => x.toJson()),
    };
  }
}
