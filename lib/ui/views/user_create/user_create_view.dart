import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:prueba_tecnica/ui/widgets/common/sidebar_menu/sidebar_layout.dart';
import 'user_create_viewmodel.dart';

class UserCreateView extends StackedView<UserCreateViewModel> {
  const UserCreateView({super.key});

  @override
  Widget builder(
      BuildContext context, UserCreateViewModel viewModel, Widget? child) {
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
                decoration: const InputDecoration(labelText: 'Nombre Completo'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Campo requerido' : null,
              ),
              TextFormField(
                controller: viewModel.emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Campo requerido' : null,
              ),
              TextFormField(
                controller: viewModel.phoneController,
                decoration: const InputDecoration(labelText: 'Teléfono'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Campo requerido' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: viewModel.saveUser,
                child: const Text("Guardar Usuario"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  UserCreateViewModel viewModelBuilder(BuildContext context) =>
      UserCreateViewModel();
}
