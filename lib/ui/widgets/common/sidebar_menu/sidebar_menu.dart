import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'sidebar_menu_model.dart';

class SidebarMenu extends StackedView<SidebarMenuModel> {
  final int selectedIndex;
  final void Function(int) onItemSelected;
  final VoidCallback onLogout;

  const SidebarMenu({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
    required this.onLogout,
  });
  @override
  Widget builder(
    BuildContext context,
    SidebarMenuModel viewModel,
    Widget? child,
  ) {
    final menuItems = [
      {'icon': Icons.dashboard_outlined, 'label': 'Overview'},
      {'icon': Icons.shopping_cart_outlined, 'label': 'Orders'},
      {'icon': Icons.analytics_outlined, 'label': 'Analytics'},
      {'icon': Icons.inventory_2_outlined, 'label': 'Products'},
      {'icon': Icons.people_outline, 'label': 'Customers'},
      {'icon': Icons.settings_outlined, 'label': 'Settings'},
    ];

    return Container(
      width: 240,
      color: Theme.of(context).colorScheme.surface,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.store_mall_directory, size: 28),
              const SizedBox(width: 8),
              Text('Vendora', style: Theme.of(context).textTheme.titleLarge),
            ],
          ),
          const SizedBox(height: 40),
          ...List.generate(menuItems.length, (index) {
            final item = menuItems[index];
            final selected = index == viewModel.selectedIndex;
            return ListTile(
              leading: Icon(
                item['icon'] as IconData,
                color: selected
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey,
              ),
              title: Text(
                item['label'] as String,
                style: TextStyle(
                  color: selected
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey,
                  fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              selected: selected,
              onTap: () => viewModel.selectItem(index),
            );
          }),
          const Spacer(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () {
              // TODO: logout
            },
          )
        ],
      ),
    );
  }

  @override
  SidebarMenuModel viewModelBuilder(BuildContext context) => SidebarMenuModel();
}
