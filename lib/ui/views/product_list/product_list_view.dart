import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:prueba_tecnica/ui/widgets/common/sidebar_menu/sidebar_layout.dart';
import 'product_list_viewmodel.dart';

class ProductListView extends StackedView<ProductListViewModel> {
  const ProductListView({super.key});

  @override
  Widget builder(
    BuildContext context,
    ProductListViewModel viewModel,
    Widget? child,
  ) {
    return SidebarLayout(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Espacio superior
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Gestión de Productos",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                ElevatedButton(
                  onPressed: viewModel.createProduct,
                  child: const Text("Nuevo Producto"),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Estado de carga / lista vacía / lista de productos
            if (viewModel.isBusy) ...[
              const Center(child: CircularProgressIndicator()),
            ] else if (viewModel.products.isEmpty) ...[
              const Text("No hay productos disponibles"),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: viewModel.fetchProducts,
                child: const Text("Cargar Productos"),
              ),
            ] else ...[
              // Expandimos la lista para que ocupe el espacio restante
              Expanded(
                child: ListView.builder(
                  itemCount: viewModel.products.length,
                  itemBuilder: (context, index) {
                    final product = viewModel.products[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 0,
                      ),
                      child: ListTile(
                        leading: Image.network(
                          product.image,
                          width: 40,
                          height: 40,
                          fit: BoxFit.contain,
                        ),
                        title: Text(product.title),
                        subtitle: Text(
                          "USD \$${product.price.toStringAsFixed(2)}",
                        ),
                        onTap: () => viewModel.showProductDetail(product.id),
                        trailing: Wrap(
                          spacing: 8,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove_red_eye),
                              onPressed: () =>
                                  viewModel.showProductDetail(product.id),
                            ),
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () =>
                                  viewModel.editProduct(product.id),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => viewModel.deleteUser(product.id),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  @override
  ProductListViewModel viewModelBuilder(BuildContext context) =>
      ProductListViewModel();
}
