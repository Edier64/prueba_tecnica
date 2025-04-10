import 'package:prueba_tecnica/data/datasources/product_remote_datasource.dart';
import 'package:prueba_tecnica/data/repositories/product_repository_impl.dart';
import 'package:prueba_tecnica/domain/entities/product.dart';
import 'package:prueba_tecnica/domain/repositories/product_repository.dart';

class ProductsService {
  late final ProductRepository repository;

  ProductsService() {
    repository = ProductRepositoryImpl(ProductRemoteDataSource());
  }

  Future<List<Product>> getProducts() => repository.getProducts();

  Future<Product> getProductById(int id) => repository.getProductById(id);

  Future<void> createProduct(Product product) =>
      repository.createProduct(product);

  Future<void> updateProduct(Product product) =>
      repository.updateProduct(product);

  Future<void> deleteProduct(int id) => repository.deleteProduct(id);
}
