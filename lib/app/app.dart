import 'package:dio/dio.dart';
import 'package:prueba_tecnica/data/datasources/user_remote_datasource.dart';
import 'package:prueba_tecnica/data/repositories/user_repository_impl.dart';
import 'package:prueba_tecnica/domain/repositories/user_repository.dart';
import 'package:prueba_tecnica/services/get_users.dart';
import 'package:prueba_tecnica/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:prueba_tecnica/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:prueba_tecnica/ui/views/home/home_view.dart';
import 'package:prueba_tecnica/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:prueba_tecnica/ui/views/user_list/user_list_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: UserListView),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // Tus dependencias personalizadas:
    LazySingleton(classType: Dio), // Registro de Dio para llamadas HTTP
    LazySingleton(classType: UserRemoteDataSource),
    // Si tienes una interfaz para el repositorio, registra la implementación asignándola al tipo
    LazySingleton(classType: UserRepositoryImpl, asType: UserRepository),
    LazySingleton(classType: GetUsers),
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
