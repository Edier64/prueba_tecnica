import 'package:stacked/stacked.dart';
import 'package:prueba_tecnica/domain/entities/product.dart';
import 'package:prueba_tecnica/services/products_service.dart';
import 'package:prueba_tecnica/app/app.locator.dart';

class ProductListViewModel extends BaseViewModel {
  ProductListViewModel() {
    fetchProducts();
  }

  final ProductsService _productsService = locator<ProductsService>();

  List<Product> _products = [];
  List<Product> get products => _products;

  Future<void> fetchProducts() async {
    setBusy(true);
    try {
      _products = await _productsService.getProducts();
    } catch (e) {
      print('Error en fetchProducts: $e');
    } finally {
      setBusy(false);
    }
  }

  void showProductDetail(int productId) {
    // _navigationService.navigateToProductDetailView(id: productId);
  }
}
