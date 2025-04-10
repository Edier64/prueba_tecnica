import 'package:prueba_tecnica/data/models/product_model.dart';
import 'package:prueba_tecnica/data/datasources/product_remote_datasource.dart';
import 'package:prueba_tecnica/domain/entities/product.dart';
import 'package:prueba_tecnica/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remote;
  ProductRepositoryImpl(this.remote);

  @override
  Future<List<Product>> getProducts() async {
    final response = await remote.fetchProducts();
    return response
        .map((e) => ProductModel.fromJson(e))
        .map((e) => Product(
              id: e.id,
              title: e.title,
              description: e.description,
              image: e.image,
              price: e.price,
              category: e.category,
            ))
        .toList();
  }

  @override
  Future<Product> getProductById(int id) async {
    final json = await remote.fetchProductById(id);
    final e = ProductModel.fromJson(json);
    return Product(
      id: e.id,
      title: e.title,
      description: e.description,
      image: e.image,
      price: e.price,
      category: e.category,
    );
  }

  @override
  Future<void> createProduct(Product product) async {
    final model = ProductModel(
      id: product.id,
      title: product.title,
      description: product.description,
      image: product.image,
      price: product.price,
      category: product.category,
    );
    await remote.createProduct(model);
  }

  @override
  Future<void> updateProduct(Product product) async {
    final model = ProductModel(
      id: product.id,
      title: product.title,
      description: product.description,
      image: product.image,
      price: product.price,
      category: product.category,
    );
    await remote.updateProduct(model);
  }

  @override
  Future<void> deleteProduct(int id) async {
    await remote.deleteProduct(id);
  }
}
