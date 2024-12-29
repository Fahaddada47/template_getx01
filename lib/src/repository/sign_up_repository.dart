// import 'package:trimber/src/application/url/base_url.dart';
// import 'package:trimber/src/core/network_executor/network_executor.dart';
// import 'package:trimber/src/core/network_executor/network_response.dart';
// import 'package:trimber/src/features/auth/model/login_model.dart';
//
// class SignUpRepository {
//   Future<NetworkResponse?> signUp(
//       {required String email,
//         required String password,
//         required String name,
//         required String companyName,
//         required String comRegNum,
//         required String industryType,
//
//
//       }) async {
//     final body = {
//       'email': email,
//       'password': password,
//       'name': name,
//       'industry_type': industryType,
//       'company_reg_number': comRegNum,
//       'company_name': companyName,
//     };
//
//     return await NetworkCaller.postRequest(Urls.registration, body: body);
//
//   }
//   Future<NetworkResponse> sendOtpForVerify(String otp ,String email) async {
//     final body = {
//       'otp': otp,
//       'email': email
//     };
//
//     return await NetworkCaller.postRequest(Urls.registrationVerifyOtp, body: body);
//   }
//
//   Future<NetworkResponse> resendOtp(String email) async {
//     final body = {
//       'email': email
//     };
//
//     return await NetworkCaller.postRequest(Urls.resendOtp, body: body);
//   }
//
// }
