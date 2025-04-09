import 'package:dio/dio.dart';

class UserRemoteDataSource {
  final Dio dio;

  UserRemoteDataSource(this.dio);

  Future<Map<String, dynamic>> fetchUserById(int id) async {
    final response = await dio.get('https://fakestoreapi.com/users/$id');
    return response.data;
  }

  Future<List<dynamic>> fetchUsers() async {
    final response = await dio.get('https://fakestoreapi.com/users');
    return response.data;
  }

  Future<void> probarConexion() async {
    try {
      final response = await Dio().get('https://fakestoreapi.com/users');
      print(response.data);
    } catch (e) {
      print('Error en la conexión: $e');
    }
  }

  // Métodos para crear, actualizar y eliminar
}
