import 'package:prueba_tecnica/app/app.locator.dart';
import 'package:prueba_tecnica/services/hhtp_service.dart';
import 'package:prueba_tecnica/data/models/user_model.dart';

class UserRemoteDataSource {
  final httpservice = locator<HhtpService>();
  Future<Map<String, dynamic>> fetchUserById(int id) async {
    final response = await httpservice.dio.get('/users/$id');
    return response.data;
  }

  Future<List<dynamic>> fetchUsers() async {
    final response = await httpservice.dio.get('/users');
    return response.data;
  }

  Future<void> createUser(UserModel user) async {
    print(' Creando usuario: ${user.toJson()}'); // 👈 esto
    final response = await httpservice.dio.post('/users', data: user.toJson());
    print(' Usuario creado: ${response.data}'); // 👈 esto también
  }

  Future<void> updateUserFromEntity(UserModel user) async {
    try {
      final response = await httpservice.dio.put(
        '/users/${user.id}',
        data: user.toJson(),
      );

      if (response.statusCode != 200) {
        throw Exception(
            'Error al actualizar usuario: ${response.statusMessage}');
      }
    } catch (e) {
      print('Error actualizando usuario: $e');
      rethrow;
    }
  }

  Future<void> deleteUser(int id) async {
    try {
      final response = await httpservice.dio.delete('/users/$id');

      if (response.statusCode != 200) {
        throw Exception('Error al eliminar usuario: ${response.statusMessage}');
      }
    } catch (e) {
      print('Error eliminando usuario: $e');
      rethrow;
    }
  }

  Future<void> probarConexion() async {
    try {
      final response = await httpservice.dio.get('/users');
      print(response.data);
    } catch (e) {
      print('Error en la conexión: \$e');
    }
  }
}
