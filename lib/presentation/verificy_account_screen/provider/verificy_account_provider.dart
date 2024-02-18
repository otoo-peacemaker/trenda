import 'package:flutter/material.dart';
import 'package:trenda/core/app_export.dart';
import 'package:trenda/presentation/verificy_account_screen/models/verificy_account_model.dart';

/// A provider class for the VerificyAccountScreen.
///
/// This provider manages the state of the VerificyAccountScreen, including the
/// current verificyAccountModelObj
class VerificyAccountProvider extends ChangeNotifier {
  TextEditingController otpController = TextEditingController();

  VerificyAccountModel verificyAccountModelObj = VerificyAccountModel();

  @override
  void dispose() {
    super.dispose();
  }
}
