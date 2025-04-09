// lib/data/models/user_model.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const UserModel._(); // constructor privado requerido por freezed

  const factory UserModel({
    required int id,
    required String email,
    required String username,
    required String password,
    required String phone,
    required NameModel name,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@freezed
class NameModel with _$NameModel {
  const NameModel._();

  const factory NameModel({
    required String firstname,
    required String lastname,
  }) = _NameModel;

  factory NameModel.fromJson(Map<String, dynamic> json) =>
      _$NameModelFromJson(json);
}
