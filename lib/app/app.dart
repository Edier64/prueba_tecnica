import 'package:prueba_tecnica/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:prueba_tecnica/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:prueba_tecnica/ui/views/home/home_view.dart';
import 'package:prueba_tecnica/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:prueba_tecnica/ui/views/user_list/user_list_view.dart';
import 'package:prueba_tecnica/ui/views/user_detail/user_detail_view.dart';
import 'package:prueba_tecnica/ui/views/user_create/user_create_view.dart';
import 'package:prueba_tecnica/services/users_service.dart';
import 'package:prueba_tecnica/services/hhtp_service.dart';

import 'package:prueba_tecnica/ui/views/product_list/product_list_view.dart';
import 'package:prueba_tecnica/services/products_service.dart';
import 'package:prueba_tecnica/ui/views/cart_list/cart_list_view.dart';
import 'package:prueba_tecnica/services/carts_service.dart';
import 'package:prueba_tecnica/ui/views/user_edit/user_edit_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: UserListView),
    MaterialRoute(page: UserDetailView),
    MaterialRoute(page: UserCreateView),
    MaterialRoute(page: ProductListView),
    MaterialRoute(page: CartListView),
    MaterialRoute(page: UserEditView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: UsersService),
    LazySingleton(classType: HhtpService),
    LazySingleton(classType: ProductsService),
    LazySingleton(classType: CartsService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
