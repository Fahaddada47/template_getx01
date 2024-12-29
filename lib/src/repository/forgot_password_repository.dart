import 'package:fahad_flutter/src/application/url/base_url.dart';
import 'package:fahad_flutter/src/core/network_executor/network_response.dart';
// import 'package:trimber/src/application/url/base_url.dart';
// import 'package:trimber/src/core/network_executor/network_executor.dart';
// import 'package:trimber/src/core/network_executor/network_response.dart';
// import 'package:trimber/src/features/auth/model/login_model.dart';

import '../core/network_executor/network_executor.dart';

class ForgotPasswordRepository {

  Future<NetworkResponse> sendEmailForOtp(String email ) async {
    final body = {
      'email': email,
    };

    return await NetworkCaller.postRequest(Urls.forgotPassSendMail, body: body);
  }

  Future<NetworkResponse> sendOtpForVerifyForgot(String otp ,String email) async {
    final body = {
      'otp': otp,
      'email': email
    };

    return await NetworkCaller.postRequest(Urls.forgotPassSendOtp, body: body);
  }


  Future<NetworkResponse> resetPassword(
      {required String email, required String password, required String confirmPassword}) async {
    final body = {
      'email': email,
      'password': password,
      'password_confirmation': confirmPassword
    };

    return await NetworkCaller.postRequest(Urls.resetPassword, body: body);
  }

  Future<NetworkResponse> resendOtp(String email) async {
    final body = {
      'email': email
    };

    return await NetworkCaller.postRequest(Urls.resendOtp, body: body);
  }

}
