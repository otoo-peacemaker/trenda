import 'models/homepage_model.dart';
import 'package:flutter/material.dart';
import 'package:trenda/core/app_export.dart';
import 'package:trenda/widgets/custom_elevated_button.dart';
import 'provider/homepage_provider.dart';

// ignore_for_file: must_be_immutable
class HomepagePage extends StatefulWidget {
  const HomepagePage({Key? key})
      : super(
          key: key,
        );

  @override
  HomepagePageState createState() => HomepagePageState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomepageProvider(),
      child: HomepagePage(),
    );
  }
}

class HomepagePageState extends State<HomepagePage>
    with AutomaticKeepAliveClientMixin<HomepagePage> {
  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA70001,
        body: _buildScrollView(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildScrollView(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 74.v),
        child: Column(
          children: [
            SizedBox(height: 21.v),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.only(
                  left: 16.h,
                  right: 184.h,
                ),
                padding: EdgeInsets.all(7.h),
                decoration: AppDecoration.outlineOnErrorContainer.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder8,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 184.v,
                      width: 144.h,
                      decoration: BoxDecoration(
                        color: appTheme.greenA200,
                        borderRadius: BorderRadius.circular(
                          4.h,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.v),
                    Container(
                      width: 144.h,
                      decoration: AppDecoration.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "lbl_ghs_10_500".tr,
                            style:
                                CustomTextStyles.bodyMediumGilroyBoldGreenA700,
                          ),
                          SizedBox(height: 9.v),
                          SizedBox(
                            width: 93.h,
                            child: Text(
                              "msg_lenovo_flex_12th".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: CustomTextStyles.bodySmallBluegray800
                                  .copyWith(
                                height: 1.50,
                              ),
                            ),
                          ),
                          SizedBox(height: 11.v),
                          Padding(
                            padding: EdgeInsets.only(right: 12.h),
                            child: Row(
                              children: [
                                CustomElevatedButton(
                                  width: 62.h,
                                  text: "lbl_electronics".tr,
                                ),
                                CustomElevatedButton(
                                  width: 62.h,
                                  text: "lbl_electronics".tr,
                                  margin: EdgeInsets.only(left: 8.h),
                                  buttonStyle: CustomButtonStyles.fillGray,
                                  buttonTextStyle:
                                      CustomTextStyles.bodySmallBluegray700,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
