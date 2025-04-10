import 'package:flutter/material.dart';
import 'package:prueba_tecnica/app/app.locator.dart';
import 'package:prueba_tecnica/domain/entities/product.dart';
import 'package:prueba_tecnica/services/products_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProductCreateViewModel extends BaseViewModel {
  final ProductsService _productsService = locator<ProductsService>();
  final _navigationService = locator<NavigationService>();

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();

  Future<void> saveProduct() async {
    if (!formKey.currentState!.validate()) return;
    setBusy(true);
    try {
      final product = Product(
        id: 0,
        title: nameController.text.trim(),
        description: descriptionController.text.trim(),
        image: '',
        price: double.tryParse(priceController.text.trim()) ?? 0.0,
        category: '',
      );
      await _productsService.createProduct(product);
      _navigationService.back();
    } catch (e) {
      print('Error al guardar producto: $e');
    } finally {
      setBusy(false);
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    super.dispose();
  }
}
