import 'package:prueba_tecnica/data/datasources/cart_remote_datasource.dart';
import 'package:prueba_tecnica/data/repositories/cart_repository_impl.dart';
import 'package:prueba_tecnica/domain/entities/cart.dart';
import 'package:prueba_tecnica/domain/repositories/cart_repository.dart';

class CartsService {
  late final CartRepository repository;

  CartsService() {
    repository = CartRepositoryImpl(CartRemoteDataSource());
  }

  Future<List<Cart>> getCarts() => repository.getCarts();
  Future<Cart> getCartById(int id) => repository.getCartById(id);
  Future<void> deleteCart(int id) => repository.deleteCart(id);
}
