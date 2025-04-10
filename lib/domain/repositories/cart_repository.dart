import '../entities/cart.dart';

abstract class CartRepository {
  Future<List<Cart>> getCarts();
  Future<Cart> getCartById(int id);
  Future<void> deleteCart(int id);
}
