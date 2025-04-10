import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:prueba_tecnica/ui/widgets/common/sidebar_menu/sidebar_layout.dart';
import 'cart_list_viewmodel.dart';

class CartListView extends StackedView<CartListViewModel> {
  const CartListView({super.key});

  @override
  Widget builder(
    BuildContext context,
    CartListViewModel viewModel,
    Widget? child,
  ) {
    return SidebarLayout(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 60),
            Text(
              "Gestión de Carritos",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            if (viewModel.isBusy)
              const CircularProgressIndicator()
            else if (viewModel.carts.isEmpty) ...[
              const Text("No hay carritos disponibles"),
              ElevatedButton(
                onPressed: viewModel.fetchCarts,
                child: const Text("Cargar Carritos"),
              )
            ] else
              Expanded(
                child: ListView.builder(
                  itemCount: viewModel.carts.length,
                  itemBuilder: (context, index) {
                    final cart = viewModel.carts[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 12.0,
                      ),
                      child: ListTile(
                        title: Text("Carrito ID: \${cart.id}"),
                        subtitle: Text(
                            "Usuario ID: \${cart.userId} - Fecha: \${cart.date}"),
                        onTap: () => viewModel.showCartDetail(cart.id),
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
  CartListViewModel viewModelBuilder(BuildContext context) =>
      CartListViewModel();
}
