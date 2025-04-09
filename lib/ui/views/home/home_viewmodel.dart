import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:prueba_tecnica/app/app.locator.dart';
import 'package:prueba_tecnica/app/app.router.dart';

class HomeViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  /// Navega a la vista de la lista de usuarios
  void navigateToUserList() {
    _navigationService.navigateTo(Routes.userListView);
  }
}
