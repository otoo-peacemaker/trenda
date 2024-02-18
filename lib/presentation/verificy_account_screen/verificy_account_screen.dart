import 'models/verificy_account_model.dart';
import 'package:flutter/material.dart';
import 'package:trenda/core/app_export.dart';
import 'package:trenda/widgets/app_bar/appbar_leading_image.dart';
import 'package:trenda/widgets/app_bar/appbar_title.dart';
import 'package:trenda/widgets/app_bar/custom_app_bar.dart';
import 'package:trenda/widgets/custom_outlined_button.dart';
import 'package:trenda/widgets/custom_pin_code_text_field.dart';
import 'provider/verificy_account_provider.dart';

class VerificyAccountScreen extends StatefulWidget {
  const VerificyAccountScreen({Key? key})
      : super(
          key: key,
        );

  @override
  VerificyAccountScreenState createState() => VerificyAccountScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => VerificyAccountProvider(),
      child: VerificyAccountScreen(),
    );
  }
}

class VerificyAccountScreenState extends State<VerificyAccountScreen> {
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
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.h),
                child: Column(
                  children: [
                    Text(
                      "msg_enter_the_verification".tr,
                      style: CustomTextStyles.bodyLargeBluegray800,
                    ),
                    SizedBox(height: 34.v),
                    Selector<VerificyAccountProvider, TextEditingController?>(
                      selector: (
                        context,
                        provider,
                      ) =>
                          provider.otpController,
                      builder: (context, otpController, child) {
                        return CustomPinCodeTextField(
                          context: context,
                          controller: otpController,
                          onChanged: (value) {
                            otpController?.text = value;
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.v),
              CustomOutlinedButton(
                text: "lbl_verify".tr,
              ),
              SizedBox(height: 32.v),
              SizedBox(
                width: 213.h,
                child: Text(
                  "msg_you_have_not_received".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.bodyMediumGilroyRegularErrorContainer
                      .copyWith(
                    height: 1.43,
                  ),
                ),
              ),
              SizedBox(height: 7.v),
              Text(
                "lbl_resend_code".tr,
                style: CustomTextStyles.bodyLargeGilroyMediumGreenA700,
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 33.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgLeftarrowIcon,
        margin: EdgeInsets.only(
          left: 13.h,
          top: 28.v,
          bottom: 12.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_verify_account".tr,
      ),
      styleType: Style.bgFill,
    );
  }
}
