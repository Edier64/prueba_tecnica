import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:prueba_tecnica/ui/widgets/common/sidebar_menu/sidebar_menu.dart';
import 'package:prueba_tecnica/ui/widgets/common/sidebar_menu/sidebar_menu_model.dart';

class SidebarLayout extends StackedView<SidebarMenuModel> {
  final Widget child;

  const SidebarLayout({super.key, required this.child});

  @override
  Widget builder(
    BuildContext context,
    SidebarMenuModel viewModel,
    Widget? _,
  ) {
    return Scaffold(
      body: Row(
        children: [
          SidebarMenu(
            selectedIndex: viewModel.selectedIndex,
            onItemSelected: viewModel.selectItem,
            onLogout: viewModel.logout,
          ),
          Expanded(child: child),
        ],
      ),
    );
  }

  @override
  SidebarMenuModel viewModelBuilder(BuildContext context) => SidebarMenuModel();
}
