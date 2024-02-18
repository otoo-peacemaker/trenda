import 'models/sign_up_model.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:trenda/core/app_export.dart';
import 'package:trenda/core/utils/validation_functions.dart';
import 'package:trenda/widgets/app_bar/appbar_leading_image.dart';
import 'package:trenda/widgets/app_bar/appbar_title.dart';
import 'package:trenda/widgets/app_bar/custom_app_bar.dart';
import 'package:trenda/widgets/custom_checkbox_button.dart';
import 'package:trenda/widgets/custom_outlined_button.dart';
import 'package:trenda/widgets/custom_phone_number.dart';
import 'package:trenda/widgets/custom_text_form_field.dart';
import 'provider/sign_up_provider.dart';
import 'package:trenda/domain/facebookauth/facebook_auth_helper.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  SignUpScreenState createState() => SignUpScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SignUpProvider(), child: SignUpScreen());
  }
}

// ignore_for_file: must_be_immutable
class SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Center(
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.h, vertical: 56.v),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomImageView(
                                      imagePath: ImageConstant.imgTrendaLogoUp1,
                                      height: 52.v,
                                      width: 80.h),
                                  SizedBox(height: 32.v),
                                  _buildPlaceholderTextThree(context),
                                  SizedBox(height: 16.v),
                                  _buildEmail(context),
                                  SizedBox(height: 16.v),
                                  _buildPhoneNumber(context),
                                  SizedBox(height: 16.v),
                                  _buildAirplane(context),
                                  SizedBox(height: 12.v),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text("msg_must_be_at_least".tr,
                                          style: CustomTextStyles
                                              .bodySmallBluegray700)),
                                  SizedBox(height: 18.v),
                                  _buildAirplane1(context),
                                  SizedBox(height: 12.v),
                                  _buildCheckBox(context),
                                  SizedBox(height: 31.v),
                                  _buildSignUp(context),
                                  SizedBox(height: 16.v),
                                  _buildSignInWithFacebook(context),
                                  SizedBox(height: 42.v),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 44.h, right: 52.h),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 1.v),
                                                child: Text(
                                                    "msg_already_have_an".tr,
                                                    style: CustomTextStyles
                                                        .bodyMediumBluegray700)),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 12.h),
                                                child: Text("lbl_sign_in".tr,
                                                    style: CustomTextStyles
                                                        .bodyLargeGilroyMediumTeal800))
                                          ])),
                                  SizedBox(height: 2.v)
                                ])))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 33.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgLeftarrowIcon,
            margin: EdgeInsets.only(left: 13.h, top: 28.v, bottom: 12.v),
            onTap: () {
              onTapLeftArrowIcon(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "lbl_sign_up".tr),
        styleType: Style.bgFill);
  }

  /// Section Widget
  Widget _buildPlaceholderTextThree(BuildContext context) {
    return Selector<SignUpProvider, TextEditingController?>(
        selector: (context, provider) =>
            provider.placeholderTextThreeController,
        builder: (context, placeholderTextThreeController, child) {
          return CustomTextFormField(
              controller: placeholderTextThreeController,
              hintText: "msg_placeholder_text".tr);
        });
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return Selector<SignUpProvider, TextEditingController?>(
        selector: (context, provider) => provider.emailController,
        builder: (context, emailController, child) {
          return CustomTextFormField(
              controller: emailController,
              hintText: "msg_enter_email_address".tr,
              textInputType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || (!isValidEmail(value, isRequired: true))) {
                  return "err_msg_please_enter_valid_email".tr;
                }
                return null;
              });
        });
  }

  /// Section Widget
  Widget _buildPhoneNumber(BuildContext context) {
    return Consumer<SignUpProvider>(builder: (context, provider, child) {
      return CustomPhoneNumber(
          country: provider.selectedCountry ??
              CountryPickerUtils.getCountryByPhoneCode('1'),
          controller: provider.phoneNumberController,
          onTap: (Country value) {
            context.read<SignUpProvider>().changeCountry(value);
          });
    });
  }

  /// Section Widget
  Widget _buildAirplane(BuildContext context) {
    return Selector<SignUpProvider, TextEditingController?>(
        selector: (context, provider) => provider.airplaneController,
        builder: (context, airplaneController, child) {
          return CustomTextFormField(
              controller: airplaneController,
              hintText: "msg_placeholder_text".tr,
              suffix: Container(
                  margin: EdgeInsets.fromLTRB(30.h, 10.v, 12.h, 10.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgAirplane,
                      height: 24.adaptSize,
                      width: 24.adaptSize)),
              suffixConstraints: BoxConstraints(maxHeight: 44.v),
              contentPadding:
                  EdgeInsets.only(left: 12.h, top: 13.v, bottom: 13.v));
        });
  }

  /// Section Widget
  Widget _buildAirplane1(BuildContext context) {
    return Selector<SignUpProvider, TextEditingController?>(
        selector: (context, provider) => provider.airplaneController1,
        builder: (context, airplaneController1, child) {
          return CustomTextFormField(
              controller: airplaneController1,
              hintText: "msg_placeholder_text".tr,
              textInputAction: TextInputAction.done,
              suffix: Container(
                  margin: EdgeInsets.fromLTRB(30.h, 10.v, 12.h, 10.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgAirplane,
                      height: 24.adaptSize,
                      width: 24.adaptSize)),
              suffixConstraints: BoxConstraints(maxHeight: 44.v),
              contentPadding:
                  EdgeInsets.only(left: 12.h, top: 13.v, bottom: 13.v));
        });
  }

  /// Section Widget
  Widget _buildCheckBox(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Selector<SignUpProvider, bool?>(
            selector: (context, provider) => provider.checkBox,
            builder: (context, checkBox, child) {
              return CustomCheckboxButton(
                  alignment: Alignment.centerLeft,
                  text: "msg_i_agree_wih_terms".tr,
                  value: checkBox,
                  onChange: (value) {
                    context.read<SignUpProvider>().changeCheckBox1(value);
                  });
            }));
  }

  /// Section Widget
  Widget _buildSignUp(BuildContext context) {
    return CustomOutlinedButton(text: "lbl_sign_up".tr);
  }

  /// Section Widget
  Widget _buildSignInWithFacebook(BuildContext context) {
    return CustomOutlinedButton(
        text: "msg_sign_in_with_facebook".tr,
        leftIcon: Container(
            margin: EdgeInsets.only(right: 12.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgSocialIcon,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        buttonStyle: CustomButtonStyles.outlineOnErrorContainerTL8,
        onPressed: () {
          onTapSignInWithFacebook(context);
        });
  }

  /// Navigates to the onboardingTwoScreen when the action is triggered.
  onTapLeftArrowIcon(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.onboardingTwoScreen,
    );
  }

  onTapSignInWithFacebook(BuildContext context) async {
    await FacebookAuthHelper().facebookSignInProcess().then((facebookUser) {
      //TODO Actions to be performed after signin
    }).catchError((onError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(onError.toString())));
    });
  }
}
