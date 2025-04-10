import 'package:prueba_tecnica/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:prueba_tecnica/domain/entities/product.dart';
import 'package:prueba_tecnica/services/products_service.dart';
import 'package:prueba_tecnica/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

class ProductListViewModel extends BaseViewModel {
  ProductListViewModel() {
    fetchProducts();
  }
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
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

  void createProduct() {
    _navigationService.navigateToProductCreateView();
  }

  void viewProduct(int userId) {
    // _navigationService.navigateToUserDetailView(id: userId);
  }

  void editProduct(int userId) {
    // _navigationService.navigateToUserEditView(userId: userId);
  }

  void showProductDetail(int productId) {
    // _navigationService.navigateToProductDetailView(id: productId);
  }
  Future<void> deleteUser(int userId) async {
    final confirm = await _dialogService.showConfirmationDialog(
      title: 'Eliminar Usuario',
      description: '¿Estás seguro que deseas eliminar este usuario?',
      cancelTitle: 'Cancelar',
      confirmationTitle: 'Eliminar',
    );

    if (confirm?.confirmed == true) {
      setBusy(true);
      try {
        await _productsService.repository.deleteProduct(userId);
        await fetchProducts();
      } catch (e) {
        print('Error eliminando usuario: \$e');
      } finally {
        setBusy(false);
      }
    }
  }
}
