import 'models/select_option_to_verify_account_model.dart';
import 'package:flutter/material.dart';
import 'package:trenda/core/app_export.dart';
import 'package:trenda/widgets/app_bar/appbar_leading_image.dart';
import 'package:trenda/widgets/app_bar/appbar_title.dart';
import 'package:trenda/widgets/app_bar/custom_app_bar.dart';
import 'package:trenda/widgets/custom_outlined_button.dart';
import 'provider/select_option_to_verify_account_provider.dart';

class SelectOptionToVerifyAccountScreen extends StatefulWidget {
  const SelectOptionToVerifyAccountScreen({Key? key}) : super(key: key);

  @override
  SelectOptionToVerifyAccountScreenState createState() =>
      SelectOptionToVerifyAccountScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SelectOptionToVerifyAccountProvider(),
        child: SelectOptionToVerifyAccountScreen());
  }
}

class SelectOptionToVerifyAccountScreenState
    extends State<SelectOptionToVerifyAccountScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 294.h,
                          margin: EdgeInsets.only(left: 17.h, right: 16.h),
                          child: Text("msg_select_the_options".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.bodyLargeBluegray800
                                  .copyWith(height: 1.50))),
                      SizedBox(height: 31.v),
                      CustomOutlinedButton(
                          height: 40.v,
                          text: "lbl_233249021200".tr,
                          leftIcon: Container(
                              margin: EdgeInsets.only(right: 8.h),
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgSmartphone,
                                  height: 20.adaptSize,
                                  width: 20.adaptSize)),
                          buttonStyle:
                              CustomButtonStyles.outlineOnErrorContainer,
                          buttonTextStyle:
                              CustomTextStyles.bodyMediumBluegray800),
                      SizedBox(height: 16.v),
                      CustomOutlinedButton(
                          height: 40.v,
                          text: "msg_bigsam_gmail_com".tr,
                          leftIcon: Container(
                              margin: EdgeInsets.only(right: 8.h),
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgMail,
                                  height: 20.adaptSize,
                                  width: 20.adaptSize)),
                          buttonStyle:
                              CustomButtonStyles.outlineOnErrorContainer,
                          buttonTextStyle:
                              CustomTextStyles.bodyMediumBluegray800),
                      SizedBox(height: 5.v)
                    ]))));
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
        title: AppbarTitle(text: "lbl_verify_account".tr),
        styleType: Style.bgFill);
  }

  /// Navigates to the signInScreen when the action is triggered.
  onTapLeftArrowIcon(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signInScreen,
    );
  }
}
