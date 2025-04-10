import 'package:flutter/material.dart';
import 'package:prueba_tecnica/ui/widgets/common/sidebar_menu/sidebar_layout.dart';
import 'package:stacked/stacked.dart';

import 'product_create_viewmodel.dart';

class ProductCreateView extends StackedView<ProductCreateViewModel> {
  const ProductCreateView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, ProductCreateViewModel viewModel, Widget? child) {
    return SidebarLayout(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: viewModel.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Text("Crear Usuario",
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 24),
              TextFormField(
                controller: viewModel.nameController,
                decoration: const InputDecoration(labelText: 'Producto '),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Campo requerido' : null,
              ),
              TextFormField(
                controller: viewModel.descriptionController,
                decoration: const InputDecoration(labelText: 'Descripcion'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Campo requerido' : null,
              ),
              TextFormField(
                controller: viewModel.priceController,
                decoration: const InputDecoration(labelText: 'Precio'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Campo requerido' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: viewModel.saveProduct,
                child: const Text("Guardar Usuario"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  ProductCreateViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProductCreateViewModel();
}
