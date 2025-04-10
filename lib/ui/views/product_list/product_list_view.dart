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
          children: [
            const SizedBox(height: 60),
            Text(
              "Gestión de Productos",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            if (viewModel.isBusy)
              const CircularProgressIndicator()
            else if (viewModel.products.isEmpty) ...[
              const Text("No hay productos disponibles"),
              ElevatedButton(
                onPressed: viewModel.fetchProducts,
                child: const Text("Cargar Productos"),
              )
            ] else
              Expanded(
                child: ListView.builder(
                  itemCount: viewModel.products.length,
                  itemBuilder: (context, index) {
                    final product = viewModel.products[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 12.0,
                      ),
                      child: ListTile(
                        leading: Image.network(
                          product.image,
                          width: 40,
                          height: 40,
                          fit: BoxFit.contain,
                        ),
                        title: Text(product.title),
                        subtitle:
                            Text("USD \$${product.price.toStringAsFixed(2)}"),
                        onTap: () => viewModel.showProductDetail(product.id),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  ProductListViewModel viewModelBuilder(BuildContext context) =>
      ProductListViewModel();
}
