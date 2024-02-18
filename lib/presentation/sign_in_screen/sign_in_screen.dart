import 'models/sign_in_model.dart';
import 'package:flutter/material.dart';
import 'package:trenda/core/app_export.dart';
import 'package:trenda/core/utils/validation_functions.dart';
import 'package:trenda/widgets/app_bar/appbar_leading_image.dart';
import 'package:trenda/widgets/app_bar/appbar_title.dart';
import 'package:trenda/widgets/app_bar/custom_app_bar.dart';
import 'package:trenda/widgets/custom_checkbox_button.dart';
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
                              _buildEmail(context),
                              SizedBox(height: 16.v),
                              _buildPassword(context),
                              SizedBox(height: 12.v),
                              _buildFrameTwentyEight(context),
                              SizedBox(height: 32.v),
                              _buildSignIn(context),
                              SizedBox(height: 16.v),
                              _buildSignInWithFacebook(context),
                              SizedBox(height: 42.v),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 2.v),
                                        child: Text(
                                            "msg_don_t_have_an_account".tr,
                                            style: CustomTextStyles
                                                .bodyMediumBluegray700)),
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
            margin: EdgeInsets.only(left: 13.h, top: 28.v, bottom: 12.v)),
        centerTitle: true,
        title: AppbarTitle(text: "lbl_sign_in".tr),
        styleType: Style.bgFill);
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return Selector<SignInProvider, TextEditingController?>(
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
  Widget _buildPassword(BuildContext context) {
    return Selector<SignInProvider, TextEditingController?>(
        selector: (context, provider) => provider.passwordController,
        builder: (context, passwordController, child) {
          return CustomTextFormField(
              controller: passwordController,
              hintText: "lbl_enter_password".tr,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.visiblePassword,
              validator: (value) {
                if (value == null ||
                    (!isValidPassword(value, isRequired: true))) {
                  return "err_msg_please_enter_valid_password".tr;
                }
                return null;
              },
              obscureText: true);
        });
  }

  /// Section Widget
  Widget _buildFrameTwentyEight(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
          padding: EdgeInsets.only(bottom: 1.v),
          child: Selector<SignInProvider, bool?>(
              selector: (context, provider) => provider.rememberMe,
              builder: (context, rememberMe, child) {
                return CustomCheckboxButton(
                    text: "lbl_remember_me".tr,
                    value: rememberMe,
                    onChange: (value) {
                      context.read<SignInProvider>().changeCheckBox1(value);
                    });
              })),
      Text("lbl_forgot_password".tr,
          style: CustomTextStyles.bodyMediumGilroyRegularGreenA700)
    ]);
  }

  /// Section Widget
  Widget _buildSignIn(BuildContext context) {
    return CustomOutlinedButton(text: "lbl_sign_in".tr);
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
        buttonTextStyle: CustomTextStyles.bodyMediumErrorContainer,
        onPressed: () {
          onTapSignInWithFacebook(context);
        });
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
