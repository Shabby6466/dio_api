import 'package:dio/dio.dart';
import 'package:dioexample/models/User.dart';

class DioServices {
  Dio dio = Dio();
  final String baseUrl = "https://reqres.in/api/";

  Future<User?> getUser({required String id}) async {
    User? user;
    try {
      Response userData = await dio.get(baseUrl + "users/$id");
      print("User info : ${userData.data}");
      user = User.fromJson(userData.data);
    } on DioException catch (e) {
      if (e.response != null) {
        print("Dio Error!");
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
        print("Status: ${e.response?.statusCode}");
      } else {
        print(e.message);
      }
    }
    return user;
  }
}
