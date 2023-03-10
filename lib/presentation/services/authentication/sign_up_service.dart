import 'package:learning_management_system/presentation/resources/service_manager.dart';
import 'package:dio/dio.dart';

class SignUpService {
  static Future<dynamic> newUser(String username, String password) async {
    final _dio = Dio();
    // try {
    _dio.options.headers['accept'] = 'application/json';
    _dio.options.headers['content-Type'] = 'application/json';
    final response = await _dio.post(
      ApiService.newUser,
      data: {'password': password, 'user_name': username},
    );
    print('sign up user');
    print(response.statusCode);
    print(response.data);
    // if (response.statusCode == HttpStatus.ok) {
    //   return response.data;
    // }

    // return response.data;
    // } on DioError catch (e) {
    //   return e.response?.data ?? 'Error occurred';
    // }
  }
}
