import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'user_create_viewmodel.dart';

class UserCreateView extends StackedView<UserCreateViewModel> {
  const UserCreateView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    UserCreateViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("UserCreateView")),
      ),
    );
  }

  @override
  UserCreateViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UserCreateViewModel();
}
