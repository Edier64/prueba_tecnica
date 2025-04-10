import 'package:stacked/stacked.dart';
import 'package:prueba_tecnica/domain/entities/cart.dart';
import 'package:prueba_tecnica/services/carts_service.dart';
import 'package:prueba_tecnica/app/app.locator.dart';

class CartListViewModel extends BaseViewModel {
  CartListViewModel() {
    fetchCarts();
  }

  final CartsService _cartsService = locator<CartsService>();

  List<Cart> _carts = [];
  List<Cart> get carts => _carts;

  Future<void> fetchCarts() async {
    setBusy(true);
    try {
      _carts = await _cartsService.getCarts();
    } catch (e) {
      print('Error en fetchCarts: \$e');
    } finally {
      setBusy(false);
    }
  }

  void showCartDetail(int cartId) {
    // _navigationService.navigateToCartDetailView(id: cartId);
  }
}
