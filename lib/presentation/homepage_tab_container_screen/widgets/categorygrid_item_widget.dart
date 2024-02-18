import '../models/categorygrid_item_model.dart';
import 'package:flutter/material.dart';
import 'package:trenda/core/app_export.dart';

// ignore: must_be_immutable
class CategorygridItemWidget extends StatelessWidget {
  CategorygridItemWidget(
    this.categorygridItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  CategorygridItemModel categorygridItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 14.h,
        vertical: 7.v,
      ),
      decoration: AppDecoration.outlineOnErrorContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: categorygridItemModelObj?.generalImage,
            height: 28.adaptSize,
            width: 28.adaptSize,
          ),
          SizedBox(height: 8.v),
          Text(
            categorygridItemModelObj.generalText!,
            style: CustomTextStyles.bodySmallGilroyRegularErrorContainer,
          ),
          SizedBox(height: 12.v),
          Text(
            categorygridItemModelObj.adText!,
            style: theme.textTheme.bodySmall,
          ),
          SizedBox(height: 19.v),
        ],
      ),
    );
  }
}
