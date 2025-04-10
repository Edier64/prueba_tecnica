import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'product_edit_viewmodel.dart';

class ProductEditView extends StackedView<ProductEditViewModel> {
  const ProductEditView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProductEditViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("ProductEditView")),
      ),
    );
  }

  @override
  ProductEditViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProductEditViewModel();
}
