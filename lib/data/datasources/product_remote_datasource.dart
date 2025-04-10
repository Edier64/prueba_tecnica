import 'package:prueba_tecnica/services/hhtp_service.dart';
import 'package:prueba_tecnica/app/app.locator.dart';
import 'package:prueba_tecnica/data/models/product_model.dart';

class ProductRemoteDataSource {
  final _http = locator<HhtpService>();

  Future<List<dynamic>> fetchProducts() async {
    final response = await _http.dio.get('/products');
    return response.data;
  }

  Future<Map<String, dynamic>> fetchProductById(int id) async {
    final response = await _http.dio.get('/products/$id');
    return response.data;
  }

  Future<void> createProduct(ProductModel product) async {
    await _http.dio.post('/products', data: product.toJson());
  }

  Future<void> updateProduct(ProductModel product) async {
    await _http.dio.put('/products/${product.id}', data: product.toJson());
  }

  Future<void> deleteProduct(int id) async {
    await _http.dio.delete('/products/$id');
  }
}
