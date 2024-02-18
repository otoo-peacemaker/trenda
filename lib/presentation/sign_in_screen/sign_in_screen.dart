import 'models/sign_in_model.dart';
import 'package:flutter/material.dart';
import 'package:trenda/core/app_export.dart';
import 'package:trenda/core/utils/validation_functions.dart';
import 'package:trenda/widgets/app_bar/appbar_leading_image.dart';
import 'package:trenda/widgets/app_bar/appbar_title.dart';
import 'package:trenda/widgets/app_bar/custom_app_bar.dart';
import 'package:trenda/widgets/custom_floating_text_field.dart';
import 'package:trenda/widgets/custom_outlined_button.dart';
import 'package:trenda/widgets/custom_text_form_field.dart';
import 'provider/sign_in_provider.dart';
import 'package:trenda/domain/facebookauth/facebook_auth_helper.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  SignInScreenState createState() => SignInScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SignInProvider(), child: SignInScreen());
  }
}

// ignore_for_file: must_be_immutable
class SignInScreenState extends State<SignInScreen> {
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
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.h, vertical: 56.v),
                            child: Column(children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgTrendaLogoUp1,
                                  height: 61.v,
                                  width: 93.h),
                              SizedBox(height: 32.v),
                              _buildEmailEditText(context),
                              SizedBox(height: 16.v),
                              _buildEmailFloatingTextField(context),
                              SizedBox(height: 12.v),
                              _buildRememberMeCheckboxRow(context),
                              SizedBox(height: 33.v),
                              _buildSignInButton(context),
                              SizedBox(height: 16.v),
                              _buildSignInWithFacebookButton(context),
                              SizedBox(height: 42.v),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 2.v),
                                        child: Text(
                                            "msg_don_t_have_an_account".tr,
                                            style: CustomTextStyles
                                                .bodyMediumBluegray500)),
                                    Padding(
                                        padding: EdgeInsets.only(left: 12.h),
                                        child: Text("lbl_sign_up".tr,
                                            style: CustomTextStyles
                                                .bodyLargeGilroyMediumGreenA700))
                                  ]),
                              SizedBox(height: 5.v)
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
        title: AppbarTitle(text: "lbl_sign_in".tr),
        styleType: Style.bgFill);
  }

  /// Section Widget
  Widget _buildEmailEditText(BuildContext context) {
    return Selector<SignInProvider, TextEditingController?>(
        selector: (context, provider) => provider.emailEditTextController,
        builder: (context, emailEditTextController, child) {
          return CustomTextFormField(
              controller: emailEditTextController,
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
  Widget _buildEmailFloatingTextField(BuildContext context) {
    return Selector<SignInProvider, TextEditingController?>(
        selector: (context, provider) =>
            provider.emailFloatingTextFieldController,
        builder: (context, emailFloatingTextFieldController, child) {
          return CustomFloatingTextField(
              controller: emailFloatingTextFieldController,
              labelText: "lbl_email".tr.toUpperCase(),
              labelStyle: theme.textTheme.bodyMedium!,
              hintText: "lbl_email".tr.toUpperCase(),
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.emailAddress,
              suffix: Container(
                  margin: EdgeInsets.symmetric(horizontal: 12.h),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgAirplane,
                      height: 24.adaptSize,
                      width: 24.adaptSize)),
              suffixConstraints: BoxConstraints(maxHeight: 56.v),
              validator: (value) {
                if (value == null || (!isValidEmail(value, isRequired: true))) {
                  return "err_msg_please_enter_valid_email".tr;
                }
                return null;
              });
        });
  }

  /// Section Widget
  Widget _buildRememberMeCheckboxRow(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 16.adaptSize,
                    width: 16.adaptSize,
                    margin: EdgeInsets.only(top: 1.v, bottom: 16.v),
                    decoration: BoxDecoration(
                        color: appTheme.whiteA70001,
                        borderRadius: BorderRadius.circular(4.h),
                        border: Border.all(
                            color: theme.colorScheme.onErrorContainer,
                            width: 1.h))),
                Padding(
                    padding: EdgeInsets.only(left: 8.h),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("lbl_remember_me".tr,
                              style: CustomTextStyles.bodySmallBluegray800),
                          SizedBox(height: 4.v),
                          Text("msg_save_my_login_details".tr,
                              style: CustomTextStyles
                                  .bodySmallGilroyRegularBluegray500)
                        ]))
              ]),
          Padding(
              padding: EdgeInsets.only(bottom: 17.v),
              child: Text("lbl_forgot_password".tr,
                  style: CustomTextStyles.bodySmallGreenA700))
        ]);
  }

  /// Section Widget
  Widget _buildSignInButton(BuildContext context) {
    return CustomOutlinedButton(text: "lbl_sign_in".tr);
  }

  /// Section Widget
  Widget _buildSignInWithFacebookButton(BuildContext context) {
    return CustomOutlinedButton(
        text: "msg_sign_in_with_facebook".tr,
        leftIcon: Container(
            margin: EdgeInsets.only(right: 12.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgSocialIcon,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        buttonStyle: CustomButtonStyles.outlineOnErrorContainerTL8,
        buttonTextStyle: CustomTextStyles.bodyMediumErrorContainer,
        onPressed: () {
          onTapSignInWithFacebookButton(context);
        });
  }

  /// Navigates to the signUpScreen when the action is triggered.
  onTapLeftArrowIcon(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signUpScreen,
    );
  }

  onTapSignInWithFacebookButton(BuildContext context) async {
    await FacebookAuthHelper().facebookSignInProcess().then((facebookUser) {
      //TODO Actions to be performed after signin
    }).catchError((onError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(onError.toString())));
    });
  }
}
