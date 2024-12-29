import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../application/common/widgets/snack_message.dart';
import '../core/network_executor/network_response.dart';
import '../repository/forgot_password_repository.dart';

class ForgotPasswordController extends GetxController {
  final ForgotPasswordRepository _repository = ForgotPasswordRepository();

  var isLoading = false.obs;
  var isOtpLoading = false.obs;
  var isPasswordReset = false.obs;
  var otpValid = true.obs;
  var email = ''.obs;

  void clear(){
     isLoading = false.obs;
     isOtpLoading = false.obs;
     isPasswordReset = false.obs;
     otpValid = true.obs;
  }

  Future<void> sendOtpForVerifyForgot({
    required String otp,
    required String email,
    required BuildContext context,
  })
  async {
    isOtpLoading.value = true;

    try {
      final NetworkResponse response =
          await _repository.sendOtpForVerifyForgot(otp, email.toString());

      if (response.statusCode == 200 && response.status == true) {
        otpValid.value = true;
        showSnackMessage(
          message: response.message ??
              'Email verified successfully! Please set a new password.',
          type: SnackMessageType.success,
          context: context,
        );

      } else if (response.statusCode == 200 && response.status == false) {
        otpValid.value = false;
        showSnackMessage(
          message: response.message ?? 'Failed to verified email.',
          type: SnackMessageType.error,
          context: context,
        );
      }
    } catch (e) {
      showSnackMessage(
        message: 'An error occurred: $e',
        type: SnackMessageType.error,
        context: context,
      );
    } finally {
      isOtpLoading.value = false;
    }
  }

  Future<void> sendEmailForOtp({
    required String email,
    required BuildContext context,
  })
  async {
    isOtpLoading.value = true;

    try {
      final NetworkResponse response =
          await _repository.sendEmailForOtp(email.toString());

      if (response.statusCode == 200 && response.status == true) {
        showSnackMessage(
          message: response.message ??
              'Email verified successfully! Please set a new password.',
          type: SnackMessageType.success,
          context: context,
        );
        clear();

        // Get.to(() => OtpVerifyScreen(
        //   email: email.toString(),
        // ));
      } else if (response.statusCode == 200 && response.status == false) {
        showSnackMessage(
          message: response.message ?? 'Failed to verified email.',
          type: SnackMessageType.error,
          context: context,
        );
      }
    } catch (e) {
      showSnackMessage(
        message: 'An error occurred: $e',
        type: SnackMessageType.error,
        context: context,
      );
    } finally {
      isOtpLoading.value = false;
    }
  }

  Future<void> resetPassword({
    required String email,
    required String password,
    required String confirmPassword,
    required BuildContext context,
  })
  async {
    isPasswordReset.value = true;

    try {
      final NetworkResponse response = await _repository.resetPassword(
          email: email, password: password, confirmPassword: confirmPassword);

      if (response.statusCode == 200 && response.status == true) {
        isPasswordReset.value = true;

        showSnackMessage(
          message: response.message ?? 'Password reset successfully',
          type: SnackMessageType.success,
          context: context,
        );
   //     Get.offAll(() => const LoginScreen());

        //_showDialog(context);
      } else if (response.statusCode == 200 && response.status == false) {
        isPasswordReset.value = false;

        showSnackMessage(
          message: response.message.toString(),
          type: SnackMessageType.error,
          context: context,
        );
      }
    } catch (e) {
      showSnackMessage(
        message: 'An error occurred: $e',
        type: SnackMessageType.error,
        context: context,
      );
    } finally {
      isPasswordReset.value = false;
    }
  }


  Future<void> resendOtp({
    required BuildContext context,
  })
  async {
    isLoading.value = true;

    try {
      final NetworkResponse response = await _repository.sendEmailForOtp(
        email.value,
      );

      if (response.statusCode == 200 && response.status == true) {
        isLoading.value = true;

        showSnackMessage(
          message: response.message ?? 'Otp sent successfully',
          type: SnackMessageType.success,
          context: context,
        );
      } else if (response.statusCode == 200 && response.status == false) {
        isLoading.value = false;

        showSnackMessage(
          message: response.message.toString(),
          type: SnackMessageType.error,
          context: context,
        );
      }
    } catch (e) {
      showSnackMessage(
        message: 'An error occurred: $e',
        type: SnackMessageType.error,
        context: context,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _showDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(.9),
      builder: (BuildContext context) {
        return AlertDialog(
            shadowColor: const Color(0xff303131),
            content: SizedBox(
              height: 90,
              width: 320,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   AppLocalizations.of(context)!.passwordUpdated,
                  // ),
                  const Gap(20),
                  // ElevatedButton(
                  //     onPressed: () {
                  //      // Get.offAll(() => const LoginScreen());
                  //     },
                  //     style: ElevatedButton.styleFrom(
                  //       fixedSize: const Size(double.infinity, 40),
                  //       minimumSize: const Size(double.infinity, 40),
                  //       maximumSize: const Size(double.infinity, 40),
                  //     ),
                  //     child: Text(
                  //       AppLocalizations.of(context)!.backToLogin,
                  //       style: TextStyles.heavy14.copyWith(color: white),
                  //     ))
                ],
              ),
            ));
      },
    );
  }
}
