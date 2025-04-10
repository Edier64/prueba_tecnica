import 'package:stacked/stacked.dart';
import 'package:prueba_tecnica/domain/entities/user.dart';
import 'package:prueba_tecnica/services/users_service.dart';
import 'package:prueba_tecnica/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:prueba_tecnica/app/app.router.dart';

class UserListViewModel extends BaseViewModel {
  UserListViewModel() {
    fetchUsers();
  }

  final UsersService _usersService = locator<UsersService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  List<User> _users = [];
  List<User> get users => _users;

  Future<void> fetchUsers() async {
    setBusy(true);
    try {
      _users = await _usersService.getUsers();
    } catch (e) {
      print('Error en fetchUsers: \$e');
    } finally {
      setBusy(false);
    }
  }

  void createUser() {
    _navigationService.navigateToUserCreateView();
  }

  void viewUser(int userId) {
    // _navigationService.navigateToUserDetailView(id: userId);
  }

  void editUser(int userId) {
    _navigationService.navigateToUserEditView(userId: userId);
  }

  Future<void> deleteUser(int userId) async {
    final confirm = await _dialogService.showConfirmationDialog(
      title: 'Eliminar Usuario',
      description: '¿Estás seguro que deseas eliminar este usuario?',
      cancelTitle: 'Cancelar',
      confirmationTitle: 'Eliminar',
    );

    if (confirm?.confirmed == true) {
      setBusy(true);
      try {
        await _usersService.repository.deleteUser(userId);
        await fetchUsers();
      } catch (e) {
        print('Error eliminando usuario: \$e');
      } finally {
        setBusy(false);
      }
    }
  }
}
