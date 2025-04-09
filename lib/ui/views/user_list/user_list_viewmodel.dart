import 'package:stacked/stacked.dart';
import 'package:prueba_tecnica/domain/entities/user.dart';
import 'package:prueba_tecnica/services/get_users.dart';
import 'package:prueba_tecnica/app/app.locator.dart';

class UserListViewModel extends BaseViewModel {
  final GetUsers _getUsers = locator<GetUsers>();

  List<User> _users = [];
  List<User> get users => _users;

  Future<void> fetchUsers() async {
    setBusy(true);
    try {
      _users = await _getUsers();
    } catch (e) {
      print('Error en fetchUsers: $e');
      // Aquí podrías actualizar un estado de error en el view model para mostrarlo en la UI
    } finally {
      setBusy(false);
    }
  }
}
