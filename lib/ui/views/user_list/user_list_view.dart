import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:prueba_tecnica/ui/widgets/common/sidebar_menu/sidebar_layout.dart';
import 'user_list_viewmodel.dart';

class UserListView extends StackedView<UserListViewModel> {
  const UserListView({super.key});

  @override
  Widget builder(
    BuildContext context,
    UserListViewModel viewModel,
    Widget? child,
  ) {
    return SidebarLayout(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Gestión de Usuarios",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                ElevatedButton(
                  onPressed: viewModel.createUser,
                  child: const Text("Nuevo Usuario"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (viewModel.isBusy)
              const CircularProgressIndicator()
            else if (viewModel.users.isEmpty) ...[
              const Text("No hay usuarios"),
              ElevatedButton(
                onPressed: viewModel.fetchUsers,
                child: const Text("Cargar Usuarios"),
              )
            ] else
              Expanded(
                child: ListView.builder(
                  itemCount: viewModel.users.length,
                  itemBuilder: (context, index) {
                    final user = viewModel.users[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 12.0,
                      ),
                      child: ListTile(
                        leading: CircleAvatar(child: Text(user.name[0])),
                        title: Text(user.name),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(user.email),
                            Text(user.phone),
                          ],
                        ),
                        trailing: Wrap(
                          spacing: 8,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove_red_eye),
                              onPressed: () => viewModel.viewUser(user.id),
                            ),
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () => viewModel.editUser(user.id),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => viewModel.deleteUser(user.id),
                            ),
                          ],
                        ),
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
