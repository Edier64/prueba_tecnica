import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'user_edit_viewmodel.dart';

class UserEditView extends StackedView<UserEditViewModel> {
  final int userId;

  const UserEditView({super.key, required this.userId});

  @override
  Widget builder(BuildContext context, UserEditViewModel viewModel, Widget? _) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editar Usuario')),
      body: viewModel.isBusy
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: viewModel.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: viewModel.nameController,
                      decoration: const InputDecoration(labelText: 'Nombre'),
                      validator: (value) =>
                          value!.isEmpty ? 'Campo requerido' : null,
                    ),
                    TextFormField(
                      controller: viewModel.emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                      validator: (value) =>
                          value!.isEmpty ? 'Campo requerido' : null,
                    ),
                    TextFormField(
                      controller: viewModel.phoneController,
                      decoration: const InputDecoration(labelText: 'Teléfono'),
                      validator: (value) =>
                          value!.isEmpty ? 'Campo requerido' : null,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: viewModel.updateUser,
                      child: const Text("Guardar Cambios"),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  @override
  UserEditViewModel viewModelBuilder(BuildContext context) =>
      UserEditViewModel();

  @override
  void onViewModelReady(UserEditViewModel viewModel) {
    viewModel.init(userId);
  }
}
