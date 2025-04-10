import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart.freezed.dart';

@freezed
class Cart with _$Cart {
  factory Cart({
    required int id,
    required int userId,
    required String date,
    required List<CartProduct> products,
  }) = _Cart;
}

@freezed
class CartProduct with _$CartProduct {
  factory CartProduct({
    required int productId,
    required int quantity,
  }) = _CartProduct;
}
