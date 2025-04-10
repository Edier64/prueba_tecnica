import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:prueba_tecnica/domain/entities/user.dart';
import 'package:prueba_tecnica/services/users_service.dart';
import 'package:prueba_tecnica/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

class UserEditViewModel extends BaseViewModel {
  final _usersService = locator<UsersService>();
  final _navigationService = locator<NavigationService>();

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  late int _userId;

  Future<void> init(int userId) async {
    _userId = userId;
    setBusy(true);
    try {
      final user = await _usersService.getUserById(userId);
      nameController.text = user.name;
      emailController.text = user.email;
      phoneController.text = user.phone;
    } catch (e) {
      print('Error cargando usuario: $e');
    } finally {
      setBusy(false);
    }
  }

  Future<void> updateUser() async {
    if (!formKey.currentState!.validate()) return;

    setBusy(true);
    try {
      final updatedUser = User(
        id: _userId,
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        phone: phoneController.text.trim(),
      );
      await _usersService.updateUser(updatedUser);
      _navigationService.back();
    } catch (e) {
      print('Error actualizando usuario: $e');
    } finally {
      setBusy(false);
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
