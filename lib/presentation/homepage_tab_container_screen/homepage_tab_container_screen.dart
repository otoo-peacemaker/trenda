import '../homepage_tab_container_screen/widgets/categorygrid_item_widget.dart';
import 'models/categorygrid_item_model.dart';
import 'models/homepage_tab_container_model.dart';
import 'package:flutter/material.dart';
import 'package:trenda/core/app_export.dart';
import 'package:trenda/presentation/homepage_page/homepage_page.dart';
import 'package:trenda/widgets/app_bar/appbar_leading_image.dart';
import 'package:trenda/widgets/app_bar/appbar_title_image.dart';
import 'package:trenda/widgets/app_bar/appbar_trailing_image.dart';
import 'package:trenda/widgets/app_bar/custom_app_bar.dart';
import 'package:trenda/widgets/custom_elevated_button.dart';
import 'package:trenda/widgets/custom_search_view.dart';
import 'provider/homepage_tab_container_provider.dart';

class HomepageTabContainerScreen extends StatefulWidget {
  const HomepageTabContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  HomepageTabContainerScreenState createState() =>
      HomepageTabContainerScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomepageTabContainerProvider(),
      child: HomepageTabContainerScreen(),
    );
  }
}

class HomepageTabContainerScreenState extends State<HomepageTabContainerScreen>
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
        backgroundColor: appTheme.whiteA70001,
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 32.v),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  child: Selector<HomepageTabContainerProvider,
                      TextEditingController?>(
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
                _buildSearchBar(context),
                SizedBox(height: 58.v),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  child: _buildFrameFiftyThree(
                    context,
                    text: "msg_explore_popular".tr,
                  ),
                ),
                SizedBox(height: 26.v),
                _buildCategoryGrid(context),
                SizedBox(height: 50.v),
                _buildHomeScreen(context),
              ],
            ),
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
        imagePath: ImageConstant.imgFrame,
        margin: EdgeInsets.only(
          left: 12.h,
          top: 28.v,
          bottom: 12.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitleImage(
        imagePath: ImageConstant.imgTrendaLogoUp1,
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgFrameErrorcontainer,
          margin: EdgeInsets.fromLTRB(12.h, 28.v, 12.h, 12.v),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildSearchBar(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 13.v,
      ),
      decoration: AppDecoration.outlineBlueGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
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
                    style: CustomTextStyles.bodyLargeGilroyExtraBoldWhiteA70001
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
                    style: CustomTextStyles.bodySmallGilroySemiBoldBluegray50
                        .copyWith(
                      height: 1.33,
                    ),
                  ),
                ),
                SizedBox(height: 15.v),
                CustomElevatedButton(
                  height: 36.v,
                  width: 101.h,
                  text: "lbl_shop_now".tr,
                  buttonStyle: CustomButtonStyles.outlinePrimary,
                  buttonTextStyle: CustomTextStyles.bodyMediumBluegray800,
                ),
              ],
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgBg51,
            height: 127.v,
            width: 132.h,
            margin: EdgeInsets.only(
              left: 11.h,
              top: 5.v,
              bottom: 5.v,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildCategoryGrid(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.h),
      child: Consumer<HomepageTabContainerProvider>(
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
            itemCount: provider
                .homepageTabContainerModelObj.categorygridItemList.length,
            itemBuilder: (context, index) {
              CategorygridItemModel model = provider
                  .homepageTabContainerModelObj.categorygridItemList[index];
              return CategorygridItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildHomeScreen(BuildContext context) {
    return SizedBox(
      height: 923.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFrameFiftyThree(
                    context,
                    text: "lbl_trending_ads".tr,
                  ),
                  SizedBox(height: 18.v),
                  Container(
                    height: 36.v,
                    width: 267.h,
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
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 74.v),
            height: 849.v,
            child: TabBarView(
              controller: tabviewController,
              children: [
                HomepagePage.builder(context),
                HomepagePage.builder(context),
                HomepagePage.builder(context),
              ],
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imageNotFound,
            height: 897.v,
            width: 360.h,
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildFrameFiftyThree(
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
