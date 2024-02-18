import '../homepage_screen/widgets/framefortytwo_item_widget.dart';
import 'models/framefortytwo_item_model.dart';
import 'models/homepage_model.dart';
import 'package:flutter/material.dart';
import 'package:trenda/core/app_export.dart';
import 'package:trenda/widgets/app_bar/appbar_leading_image.dart';
import 'package:trenda/widgets/app_bar/appbar_title_image.dart';
import 'package:trenda/widgets/app_bar/appbar_trailing_image.dart';
import 'package:trenda/widgets/app_bar/custom_app_bar.dart';
import 'package:trenda/widgets/custom_elevated_button.dart';
import 'package:trenda/widgets/custom_search_view.dart';
import 'provider/homepage_provider.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  HomepageScreenState createState() => HomepageScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomepageProvider(),
      child: HomepageScreen(),
    );
  }
}

class HomepageScreenState extends State<HomepageScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 3, vsync: this);
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
            padding: EdgeInsets.only(top: 32.v),
            child: _buildHomepage(context),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 64.v,
      leadingWidth: 36.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgFrameWhiteA70001,
        margin: EdgeInsets.only(
          left: 12.h,
          top: 20.v,
          bottom: 20.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitleImage(
        imagePath: ImageConstant.imgTrendaLogoUp1,
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgFrameWhiteA7000124x24,
          margin: EdgeInsets.symmetric(
            horizontal: 12.h,
            vertical: 20.v,
          ),
        ),
      ],
      styleType: Style.bgFill_1,
    );
  }

  /// Section Widget
  Widget _buildHomepage(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5.v),
      padding: EdgeInsets.symmetric(horizontal: 14.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 2.h),
            child: Selector<HomepageProvider, TextEditingController?>(
              selector: (
                context,
                provider,
              ) =>
                  provider.searchController,
              builder: (context, searchController, child) {
                return CustomSearchView(
                  controller: searchController,
                  hintText: "msg_search_what_you".tr,
                );
              },
            ),
          ),
          SizedBox(height: 16.v),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 2.h),
            padding: EdgeInsets.symmetric(vertical: 13.v),
            decoration: AppDecoration.outlineBlueGray.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 1.v),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 153.h,
                        child: Text(
                          "msg_black_friday_sales".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles
                              .bodyLargeGilroyExtraBoldWhiteA70001
                              .copyWith(
                            height: 1.33,
                          ),
                        ),
                      ),
                      SizedBox(height: 4.v),
                      SizedBox(
                        width: 116.h,
                        child: Text(
                          "msg_discover_the_perfect".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles
                              .bodySmallGilroySemiBoldBluegray50
                              .copyWith(
                            height: 1.33,
                          ),
                        ),
                      ),
                      SizedBox(height: 15.v),
                      CustomElevatedButton(
                        width: 101.h,
                        text: "lbl_shop_now".tr,
                      ),
                    ],
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgBg51,
                  height: 127.v,
                  width: 132.h,
                  margin: EdgeInsets.symmetric(vertical: 5.v),
                ),
              ],
            ),
          ),
          SizedBox(height: 33.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.h),
            child: _buildTrendingAds(
              context,
              text: "msg_explore_popular".tr,
            ),
          ),
          SizedBox(height: 18.v),
          Padding(
            padding: EdgeInsets.only(right: 2.h),
            child: Consumer<HomepageProvider>(
              builder: (context, provider, child) {
                return GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 115.v,
                    crossAxisCount: 4,
                    mainAxisSpacing: 8.h,
                    crossAxisSpacing: 8.h,
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount:
                      provider.homepageModelObj.framefortytwoItemList.length,
                  itemBuilder: (context, index) {
                    FramefortytwoItemModel model =
                        provider.homepageModelObj.framefortytwoItemList[index];
                    return FramefortytwoItemWidget(
                      model,
                    );
                  },
                );
              },
            ),
          ),
          SizedBox(height: 34.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.h),
            child: _buildTrendingAds(
              context,
              text: "lbl_trending_ads".tr,
            ),
          ),
          SizedBox(height: 18.v),
          Container(
            height: 36.v,
            width: 267.h,
            margin: EdgeInsets.only(left: 2.h),
            child: TabBar(
              controller: tabviewController,
              labelPadding: EdgeInsets.zero,
              labelColor: appTheme.teal900,
              labelStyle: TextStyle(
                fontSize: 14.fSize,
                fontFamily: 'Gilroy-Regular',
                fontWeight: FontWeight.w400,
              ),
              unselectedLabelColor: appTheme.blueGray800,
              unselectedLabelStyle: TextStyle(
                fontSize: 14.fSize,
                fontFamily: 'Gilroy-Regular',
                fontWeight: FontWeight.w400,
              ),
              indicator: BoxDecoration(
                color: appTheme.greenA100,
                borderRadius: BorderRadius.circular(
                  8.h,
                ),
                border: Border.all(
                  color: appTheme.greenA700,
                  width: 1.h,
                ),
                boxShadow: [
                  BoxShadow(
                    color: theme.colorScheme.primary,
                    spreadRadius: 2.h,
                    blurRadius: 2.h,
                    offset: Offset(
                      0,
                      1,
                    ),
                  ),
                ],
              ),
              tabs: [
                Tab(
                  child: Text(
                    "lbl_top_listings".tr,
                  ),
                ),
                Tab(
                  child: Text(
                    "lbl_trending".tr,
                  ),
                ),
                Tab(
                  child: Text(
                    "lbl_latest".tr,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildTrendingAds(
    BuildContext context, {
    required String text,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: CustomTextStyles.bodyLargeGilroyMediumBluegray800.copyWith(
            color: appTheme.blueGray800,
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgFrameBlueGray800,
          height: 20.adaptSize,
          width: 20.adaptSize,
        ),
      ],
    );
  }
}
