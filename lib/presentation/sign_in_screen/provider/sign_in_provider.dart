import 'package:flutter/material.dart';
import 'package:trenda/core/app_export.dart';
import 'package:trenda/presentation/sign_in_screen/models/sign_in_model.dart';

/// A provider class for the SignInScreen.
///
/// This provider manages the state of the SignInScreen, including the
/// current signInModelObj

// ignore_for_file: must_be_immutable
class SignInProvider extends ChangeNotifier {
  TextEditingController emailEditTextController = TextEditingController();

  TextEditingController emailFloatingTextFieldController =
      TextEditingController();

  SignInModel signInModelObj = SignInModel();

  @override
  void dispose() {
    super.dispose();
    emailEditTextController.dispose();
    emailFloatingTextFieldController.dispose();
  }
}
