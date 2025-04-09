import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../user_list/user_list_viewmodel.dart';

class UserListView extends StackedView<UserListViewModel> {
  const UserListView({super.key});

  @override
  Widget builder(
    BuildContext context,
    UserListViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            const SizedBox(height: 60),
            Text(
              "Gestión de Usuarios",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: viewModel.fetchUsers,
              child: const Text("Cargar Usuarios"),
            ),
            const SizedBox(height: 20),
            if (viewModel.isBusy)
              const CircularProgressIndicator()
            else if (viewModel.users.isEmpty)
              const Text("No hay usuarios")
            else
              Expanded(
                child: ListView.builder(
                  itemCount: viewModel.users.length,
                  itemBuilder: (context, index) {
                    final user = viewModel.users[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 6.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(user.name[0]),
                        ),
                        title: Text(user.name),
                        subtitle: Text(user.email),
                        trailing: Text(user.phone),
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
  UserListViewModel viewModelBuilder(BuildContext context) =>
      UserListViewModel();
}
