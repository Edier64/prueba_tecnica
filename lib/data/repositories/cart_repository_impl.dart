import 'package:prueba_tecnica/data/models/cart_model.dart';
import 'package:prueba_tecnica/data/datasources/cart_remote_datasource.dart';
import 'package:prueba_tecnica/domain/entities/cart.dart';
import 'package:prueba_tecnica/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource remote;
  CartRepositoryImpl(this.remote);

  @override
  Future<List<Cart>> getCarts() async {
    final json = await remote.fetchCarts();
    return json.map((e) {
      final model = CartModel.fromJson(e);
      return Cart(
        id: model.id,
        userId: model.userId,
        date: model.date,
        products: model.products
            .map((p) => CartProduct(
                  productId: p.productId,
                  quantity: p.quantity,
                ))
            .toList(),
      );
    }).toList();
  }

  @override
  Future<Cart> getCartById(int id) async {
    final json = await remote.fetchCartById(id);
    final model = CartModel.fromJson(json);
    return Cart(
      id: model.id,
      userId: model.userId,
      date: model.date,
      products: model.products
          .map((p) => CartProduct(
                productId: p.productId,
                quantity: p.quantity,
              ))
          .toList(),
    );
  }

  @override
  Future<void> deleteCart(int id) async {
    await remote.deleteCart(id);
  }
}
