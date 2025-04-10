import 'package:prueba_tecnica/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:prueba_tecnica/app/app.locator.dart';

class SidebarMenuModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void selectItem(int index) {
    _selectedIndex = index;
    notifyListeners();

    switch (index) {
      case 0:
        _navigationService.replaceWithHomeView();
        break;
      case 1:
        _navigationService.replaceWithCartListView();
      case 3:
        _navigationService.replaceWithProductListView();
      case 4:
        _navigationService.replaceWithUserListView();
        break;
      // case 2:
      //   _navigationService.replaceWithProductListView();
      // break;
    }
  }

  void logout() {
    // logout logic
  }
}
