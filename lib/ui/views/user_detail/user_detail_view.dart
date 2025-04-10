import 'package:flutter/material.dart';
import 'package:prueba_tecnica/ui/widgets/common/sidebar_menu/sidebar_layout.dart';
import 'package:stacked/stacked.dart';

import 'user_detail_viewmodel.dart';

class UserDetailView extends StackedView<UserDetailViewModel> {
  const UserDetailView({super.key});

  @override
  Widget builder(
    BuildContext context,
    UserDetailViewModel viewModel,
    Widget? child,
  ) {
    return SidebarLayout(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: const Center(
          child: Text("UserDetailView"),
        ),
      ),
    );
  }

  @override
  UserDetailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UserDetailViewModel();
}
