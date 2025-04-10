import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

@freezed
class Product with _$Product {
  factory Product({
    required int id,
    required String title,
    required String description,
    required String image,
    required double price,
    required String category,
  }) = _Product;
}
