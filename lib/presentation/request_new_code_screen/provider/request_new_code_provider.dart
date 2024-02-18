import 'package:flutter/material.dart';
import 'package:trenda/core/app_export.dart';
import 'package:trenda/presentation/request_new_code_screen/models/request_new_code_model.dart';

/// A provider class for the RequestNewCodeScreen.
///
/// This provider manages the state of the RequestNewCodeScreen, including the
/// current requestNewCodeModelObj
class RequestNewCodeProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();

  RequestNewCodeModel requestNewCodeModelObj = RequestNewCodeModel();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }
}
