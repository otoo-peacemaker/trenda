import 'package:flutter/material.dart';
import 'package:trenda/core/app_export.dart';
import 'package:trenda/presentation/select_option_to_verify_account_screen/models/select_option_to_verify_account_model.dart';

/// A provider class for the SelectOptionToVerifyAccountScreen.
///
/// This provider manages the state of the SelectOptionToVerifyAccountScreen, including the
/// current selectOptionToVerifyAccountModelObj
class SelectOptionToVerifyAccountProvider extends ChangeNotifier {
  SelectOptionToVerifyAccountModel selectOptionToVerifyAccountModelObj =
      SelectOptionToVerifyAccountModel();

  @override
  void dispose() {
    super.dispose();
  }
}
