import '../models/framefortytwo_item_model.dart';
import 'package:flutter/material.dart';
import 'package:trenda/core/app_export.dart';

// ignore: must_be_immutable
class FramefortytwoItemWidget extends StatelessWidget {
  FramefortytwoItemWidget(
    this.framefortytwoItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  FramefortytwoItemModel framefortytwoItemModelObj;

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
            imagePath: framefortytwoItemModelObj?.generalImage,
            height: 32.adaptSize,
            width: 32.adaptSize,
          ),
          SizedBox(height: 8.v),
          Text(
            framefortytwoItemModelObj.generalText!,
            style: CustomTextStyles.bodySmallGilroyRegularErrorContainer,
          ),
          SizedBox(height: 12.v),
          Text(
            framefortytwoItemModelObj.adText!,
            style: theme.textTheme.bodySmall,
          ),
          SizedBox(height: 15.v),
        ],
      ),
    );
  }
}
