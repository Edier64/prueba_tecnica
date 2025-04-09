import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  factory User({
    required int id,
    required String name,
    required String email,
    required String phone,
    // Otros campos que necesites
  }) = _User;
}
