import 'package:prueba_tecnica/services/hhtp_service.dart';
import 'package:prueba_tecnica/app/app.locator.dart';

class CartRemoteDataSource {
  final _http = locator<HhtpService>();

  Future<List<dynamic>> fetchCarts() async {
    final response = await _http.dio.get('/carts');
    return response.data;
  }

  Future<Map<String, dynamic>> fetchCartById(int id) async {
    final response = await _http.dio.get('/carts/$id');
    return response.data;
  }

  Future<void> deleteCart(int id) async {
    await _http.dio.delete('/carts/$id');
  }
}
