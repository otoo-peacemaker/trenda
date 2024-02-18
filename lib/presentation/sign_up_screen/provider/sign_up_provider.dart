import 'package:flutter/material.dart';
import 'package:trenda/core/app_export.dart';
import 'package:trenda/presentation/sign_up_screen/models/sign_up_model.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';

/// A provider class for the SignUpScreen.
///
/// This provider manages the state of the SignUpScreen, including the
/// current signUpModelObj

// ignore_for_file: must_be_immutable
class SignUpProvider extends ChangeNotifier {
  TextEditingController placeholderTextThreeController =
      TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController airplaneController = TextEditingController();

  TextEditingController airplaneController1 = TextEditingController();

  SignUpModel signUpModelObj = SignUpModel();

  Country? selectedCountry;

  bool checkBox = false;

  @override
  void dispose() {
    super.dispose();
    placeholderTextThreeController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    airplaneController.dispose();
    airplaneController1.dispose();
  }

  void changeCountry(Country value) {
    selectedCountry = value;
    notifyListeners();
  }

  void changeCheckBox1(bool value) {
    checkBox = value;
    notifyListeners();
  }
}
