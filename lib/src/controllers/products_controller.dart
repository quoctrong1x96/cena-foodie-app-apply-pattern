import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../helpers/de_bouncer.dart';
import '../helpers/secure_storage.dart';
import '../models/response/images_products_response.dart';
import '../models/response/products_top_home_response.dart';
import '../models/response/response_default.dart';
import '../services/url.dart';

class ProductsController {
  final debouncer = DeBouncer(duration: const Duration(milliseconds: 800));
  final String productApiSource = '${URLS.URL_API}/v1/stores';
  final StreamController<List<FoodAndDrink>> _streamController =
      StreamController<List<FoodAndDrink>>.broadcast();
  Stream<List<FoodAndDrink>> get searchProducts => _streamController.stream;

  void dispose() {
    _streamController.close();
  }

  Future<ResponseDefault> addNewProduct(
      int storeId,
      String name,
      String description,
      String price,
      List<XFile> images,
      String category) async {
    final token = await secureStorage.readToken();

    var request = http.MultipartRequest(
        'POST', Uri.parse('$productApiSource/$storeId/products'))
      ..headers['Accept'] = 'application/json'
      ..headers['xx-token'] = token!
      ..fields['name'] = name
      ..fields['description'] = description
      ..fields['price'] = price
      ..fields['category'] = category;
    for (var image in images) {
      request.files.add(await http.MultipartFile.fromPath('image', image.path));
    }

    final response = await request.send();
    var data = await http.Response.fromStream(response);

    return ResponseDefault.fromJson(jsonDecode(data.body));
  }

  Future<ResponseDefault> updateProduct(
      int storeId,
      int productId,
      String name,
      String description,
      String price,
      List<XFile>? images,
      String category) async {
    final token = await secureStorage.readToken();

    var request = http.MultipartRequest(
        'PUT', Uri.parse('$productApiSource/$storeId/products/$productId'))
      ..headers['Accept'] = 'application/json'
      ..headers['xx-token'] = token!
      ..fields['name'] = name
      ..fields['description'] = description
      ..fields['price'] = price
      ..fields['category'] = category;
    if (images != null) {
      for (var image in images) {
        request.files
            .add(await http.MultipartFile.fromPath('image', image.path));
      }
    }

    final response = await request.send();
    var data = await http.Response.fromStream(response);

    return ResponseDefault.fromJson(jsonDecode(data.body));
  }

  Future<List<FoodAndDrink>> getProductsTopHome(int storeId) async {
    final token = await secureStorage.readToken();

    final response = await http
        .get(Uri.parse('$productApiSource/$storeId/products'), headers: {
      'Accept': 'application/json',
      'xx-token': token!,
    });

    return ProductsTopHomeResponse.fromJson(jsonDecode(response.body))
        .productsDb;
  }

  Future<List<ImageProductDb>> getImagesProducts(
      int storeId, String productId) async {
    final token = await secureStorage.readToken();

    final response = await http.get(
        Uri.parse('$productApiSource/$storeId/products/$productId/images'),
        headers: {'Accept': 'application/json', 'xx-token': token!});

    return ImagesProductsResponse.fromJson(jsonDecode(response.body))
        .imageProductDb;
  }

  void searchProductsForName(String productName) async {
    debouncer.value = '';
    debouncer.onValue = (value) async {
      final token = await secureStorage.readToken();

      final response = await http.get(
          Uri.parse(
              '${URLS.URL_API}/v1/products/search-product-for-name/$productName'),
          headers: {'Accept': 'application/json', 'xx-token': token!});

      final listProduct =
          ProductsTopHomeResponse.fromJson(jsonDecode(response.body))
              .productsDb;

      _streamController.add(listProduct);
    };
    final timer = Timer(
        const Duration(milliseconds: 200), () => debouncer.value = productName);
    Future.delayed(const Duration(milliseconds: 400))
        .then((_) => timer.cancel());
  }

  Future<List<FoodAndDrink>> searchProductsForCategory(
      String idCategory) async {
    final token = await secureStorage.readToken();

    final resp = await http.get(
        Uri.parse(
            '${URLS.URL_API}/v1/products/search-product-for-category/$idCategory'),
        headers: {'Accept': 'application/json', 'xx-token': token!});

    return ProductsTopHomeResponse.fromJson(jsonDecode(resp.body)).productsDb;
  }

  Future<List<FoodAndDrink>> listProductsAdmin() async {
    final token = await secureStorage.readToken();

    final resp = await http.get(
        Uri.parse('${URLS.URL_API}/v1/products/list-products-admin'),
        headers: {'Content-Type': 'application/json', 'xx-token': token!});

    return ProductsTopHomeResponse.fromJson(jsonDecode(resp.body)).productsDb;
  }

  Future<ResponseDefault> updateStatusProduct(
      int storeId, String productId, String status) async {
    final token = await secureStorage.readToken();

    final resp = await http.patch(
        Uri.parse('$productApiSource/$storeId/products/$productId/status'),
        headers: {'Accept': 'application/json', 'xx-token': token!},
        body: {'status': status});

    return ResponseDefault.fromJson(jsonDecode(resp.body));
  }

  Future<ResponseDefault> deleteProduct(int storeId, String productId) async {
    final token = await secureStorage.readToken();

    final resp = await http.delete(
        Uri.parse('$productApiSource/$storeId/products/$productId'),
        headers: {'Accept': 'application/json', 'xx-token': token!});

    return ResponseDefault.fromJson(jsonDecode(resp.body));
  }
}

final productController = ProductsController();
