import 'package:prueba_tecnica/data/datasources/user_remote_datasource.dart';
import 'package:prueba_tecnica/data/repositories/user_repository_impl.dart';

import '../domain/entities/user.dart';
import '../domain/repositories/user_repository.dart';

class UsersService {
  late final UserRepository repository;
  UsersService() {
    repository = UserRepositoryImpl(UserRemoteDataSource());
  }

  Future<List<User>> getUsers() async {
    return await repository.getUsers();
  }

  Future<void> createUser(User user) async {
    return await repository.createUser(user);
  }

  Future<void> updateUser(User user) async {
    return await repository.updateUser(user);
  }

  Future<void> deleteUser(int id) async {
    return await repository.deleteUser(id);
  }

  Future<User> getUserById(int id) async {
    return await repository.getUserById(id);
  }
}
