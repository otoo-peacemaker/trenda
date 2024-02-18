import 'package:flutter/material.dart';
import 'package:trenda/core/app_export.dart';
import 'package:trenda/presentation/reset_password_screen/models/reset_password_model.dart';

/// A provider class for the ResetPasswordScreen.
///
/// This provider manages the state of the ResetPasswordScreen, including the
/// current resetPasswordModelObj
class ResetPasswordProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();

  ResetPasswordModel resetPasswordModelObj = ResetPasswordModel();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }
}
