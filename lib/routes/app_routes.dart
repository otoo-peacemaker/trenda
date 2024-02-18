import 'package:flutter/material.dart';
import 'package:trenda/presentation/select_option_to_verify_account_screen/select_option_to_verify_account_screen.dart';
import 'package:trenda/presentation/onboarding_two_screen/onboarding_two_screen.dart';
import 'package:trenda/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:trenda/presentation/sign_in_screen/sign_in_screen.dart';
import 'package:trenda/presentation/verificy_account_screen/verificy_account_screen.dart';
import 'package:trenda/presentation/request_new_code_screen/request_new_code_screen.dart';
import 'package:trenda/presentation/reset_password_screen/reset_password_screen.dart';
import 'package:trenda/presentation/homepage_screen/homepage_screen.dart';
import 'package:trenda/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String selectOptionToVerifyAccountScreen =
      '/select_option_to_verify_account_screen';

  static const String onboardingTwoScreen = '/onboarding_two_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String signInScreen = '/sign_in_screen';

  static const String verificyAccountScreen = '/verificy_account_screen';

  static const String requestNewCodeScreen = '/request_new_code_screen';

  static const String resetPasswordScreen = '/reset_password_screen';

  static const String homepageScreen = '/homepage_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        selectOptionToVerifyAccountScreen:
            SelectOptionToVerifyAccountScreen.builder,
        onboardingTwoScreen: OnboardingTwoScreen.builder,
        signUpScreen: SignUpScreen.builder,
        signInScreen: SignInScreen.builder,
        verificyAccountScreen: VerificyAccountScreen.builder,
        requestNewCodeScreen: RequestNewCodeScreen.builder,
        resetPasswordScreen: ResetPasswordScreen.builder,
        homepageScreen: HomepageScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: OnboardingTwoScreen.builder
      };
}
