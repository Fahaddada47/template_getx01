//
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:trimber/src/application/url/base_url.dart';
// import 'package:trimber/src/core/network_executor/network_executor.dart';
// import 'package:trimber/src/core/network_executor/network_response.dart';
// import 'package:trimber/src/features/auth/model/login_model.dart';
//
// class LoginRepository {
//   Future<LoginModel?> login(String email, String password) async {
//     final body = {
//       'email': email,
//       'password': password,
//     };
//
//     final NetworkResponse response = await NetworkCaller.postRequest(Urls.login, body: body, isLogin: false);
//
//     if (response.isSuccess) {
//       return LoginModel.fromJson(response.data);
//     } else {
//       return null;
//     }
//   }
//
// }