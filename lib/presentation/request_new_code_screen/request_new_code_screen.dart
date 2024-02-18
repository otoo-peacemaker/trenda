import 'models/request_new_code_model.dart';
import 'package:flutter/material.dart';
import 'package:trenda/core/app_export.dart';
import 'package:trenda/core/utils/validation_functions.dart';
import 'package:trenda/widgets/app_bar/appbar_leading_image.dart';
import 'package:trenda/widgets/app_bar/appbar_title.dart';
import 'package:trenda/widgets/app_bar/custom_app_bar.dart';
import 'package:trenda/widgets/custom_outlined_button.dart';
import 'package:trenda/widgets/custom_text_form_field.dart';
import 'provider/request_new_code_provider.dart';

class RequestNewCodeScreen extends StatefulWidget {
  const RequestNewCodeScreen({Key? key})
      : super(
          key: key,
        );

  @override
  RequestNewCodeScreenState createState() => RequestNewCodeScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RequestNewCodeProvider(),
      child: RequestNewCodeScreen(),
    );
  }
}

class RequestNewCodeScreenState extends State<RequestNewCodeScreen> {
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
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 296.h,
                      margin: EdgeInsets.only(
                        left: 16.h,
                        right: 15.h,
                      ),
                      child: Text(
                        "msg_request_for_a_new".tr,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: CustomTextStyles.bodyLargeBluegray800.copyWith(
                          height: 1.50,
                        ),
                      ),
                    ),
                    SizedBox(height: 31.v),
                    Selector<RequestNewCodeProvider, TextEditingController?>(
                      selector: (
                        context,
                        provider,
                      ) =>
                          provider.emailController,
                      builder: (context, emailController, child) {
                        return CustomTextFormField(
                          controller: emailController,
                          hintText: "msg_enter_email_address".tr,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null ||
                                (!isValidEmail(value, isRequired: true))) {
                              return "err_msg_please_enter_valid_email".tr;
                            }
                            return null;
                          },
                        );
                      },
                    ),
                    SizedBox(height: 24.v),
                    CustomOutlinedButton(
                      text: "msg_request_new_code".tr,
                      buttonStyle: CustomButtonStyles.outlineTealA,
                    ),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ),
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
        text: "msg_request_new_code".tr,
      ),
      styleType: Style.bgFill,
    );
  }
}
