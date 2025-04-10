import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:prueba_tecnica/app/app.locator.dart';
import 'package:prueba_tecnica/domain/entities/user.dart';
import 'package:prueba_tecnica/services/users_service.dart';
import 'package:stacked_services/stacked_services.dart';

class UserCreateViewModel extends BaseViewModel {
  final _usersService = locator<UsersService>();
  final _navigationService = locator<NavigationService>();

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  Future<void> saveUser() async {
    if (!formKey.currentState!.validate()) return;
    if (!emailController.text.trim().contains('@') ||
        !emailController.text.trim().contains('.')) {
      return showDialog(
        context: _navigationService.navigatorKey!.currentContext!,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('El email no es válido'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Aceptar'),
            ),
          ],
        ),
      );
    }
    setBusy(true);
    try {
      final user = User(
        id: 0,
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        phone: phoneController.text.trim(),
      );
      await _usersService.createUser(user); // ← cambia esta línea
      _navigationService.back();
    } catch (e) {
      print('Error al guardar usuario: $e');
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
