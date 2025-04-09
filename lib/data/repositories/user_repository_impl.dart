import 'package:prueba_tecnica/domain/entities/user.dart';
import 'package:prueba_tecnica/domain/repositories/user_repository.dart';
import 'package:prueba_tecnica/data/models/user_model.dart';
import 'package:prueba_tecnica/data/datasources/user_remote_datasource.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<User>> getUsers() async {
    try {
      final usersJson = await remoteDataSource.fetchUsers();
      // Imprime cada usuario para inspeccionar el contenido
      for (var json in usersJson) {
        print('Usuario JSON: $json');
      }

      final users = usersJson.map((json) {
        try {
          final userModel = UserModel.fromJson(json);
          return userModel;
        } catch (e) {
          print('Error al parsear un usuario: $e');
          rethrow;
        }
      }).toList();

      return users.map((userModel) {
        return User(
          id: userModel.id,
          name: '${userModel.name.firstname} ${userModel.name.lastname}',
          email: userModel.email,
          phone: userModel.phone,
        );
      }).toList();
    } catch (e) {
      print('Error al obtener usuarios: $e');
      return [];
    }
  }

  @override
  Future<User> getUserById(int id) async {
    final userJson = await remoteDataSource.fetchUserById(id);
    final userModel = UserModel.fromJson(userJson);
    return User(
      id: userModel.id,
      name: '${userModel.name.firstname} ${userModel.name.lastname}',
      email: userModel.email,
      phone: userModel.phone,
    );
  }

  @override
  Future<void> createUser(User user) async {
    // Mapea la entidad a UserModel y llama al endpoint de creación
  }

  @override
  Future<void> updateUser(User user) async {
    // Lógica para actualizar
  }

  @override
  Future<void> deleteUser(int id) async {
    // Lógica para eliminar
  }
}
