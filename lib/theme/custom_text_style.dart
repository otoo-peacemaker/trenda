import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeBluegray800 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.blueGray800,
        fontSize: 16.fSize,
      );
  static get bodyLargeGilroyExtraBoldWhiteA70001 =>
      theme.textTheme.bodyLarge!.gilroyExtraBold.copyWith(
        color: appTheme.whiteA70001,
      );
  static get bodyLargeGilroyMediumBluegray800 =>
      theme.textTheme.bodyLarge!.gilroyMedium.copyWith(
        color: appTheme.blueGray800,
        fontSize: 16.fSize,
      );
  static get bodyLargeGilroyMediumErrorContainer =>
      theme.textTheme.bodyLarge!.gilroyMedium.copyWith(
        color: theme.colorScheme.errorContainer,
        fontSize: 16.fSize,
      );
  static get bodyLargeGilroyMediumGreenA700 =>
      theme.textTheme.bodyLarge!.gilroyMedium.copyWith(
        color: appTheme.greenA700,
        fontSize: 16.fSize,
      );
  static get bodyLargeGilroyMediumTeal800 =>
      theme.textTheme.bodyLarge!.gilroyMedium.copyWith(
        color: appTheme.teal800,
        fontSize: 16.fSize,
      );
  static get bodyMediumBluegray500 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray500,
      );
  static get bodyMediumBluegray700 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray700,
      );
  static get bodyMediumBluegray800 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray800,
      );
  static get bodyMediumErrorContainer => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.errorContainer,
      );
  static get bodyMediumGilroyBoldGreenA700 =>
      theme.textTheme.bodyMedium!.gilroyBold.copyWith(
        color: appTheme.greenA700,
      );
  static get bodyMediumGilroyRegular =>
      theme.textTheme.bodyMedium!.gilroyRegular;
  static get bodyMediumGilroyRegularBluegray500 =>
      theme.textTheme.bodyMedium!.gilroyRegular.copyWith(
        color: appTheme.blueGray500,
      );
  static get bodyMediumGilroyRegularBluegray800 =>
      theme.textTheme.bodyMedium!.gilroyRegular.copyWith(
        color: appTheme.blueGray800,
      );
  static get bodyMediumGilroyRegularErrorContainer =>
      theme.textTheme.bodyMedium!.gilroyRegular.copyWith(
        color: theme.colorScheme.errorContainer,
      );
  static get bodyMediumGilroyRegularGreenA700 =>
      theme.textTheme.bodyMedium!.gilroyRegular.copyWith(
        color: appTheme.greenA700,
      );
  static get bodyMediumGilroyRegularTeal900 =>
      theme.textTheme.bodyMedium!.gilroyRegular.copyWith(
        color: appTheme.teal900,
      );
  static get bodyMediumOnPrimary => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  static get bodyMediumOnPrimaryContainer =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get bodyMediumTeal900 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.teal900,
      );
  static get bodySmallBluegray700 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blueGray700,
      );
  static get bodySmallBluegray800 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blueGray800,
      );
  static get bodySmallGilroyRegularBluegray500 =>
      theme.textTheme.bodySmall!.gilroyRegular.copyWith(
        color: appTheme.blueGray500,
      );
  static get bodySmallGilroyRegularErrorContainer =>
      theme.textTheme.bodySmall!.gilroyRegular.copyWith(
        color: theme.colorScheme.errorContainer,
      );
  static get bodySmallGilroySemiBoldBluegray50 =>
      theme.textTheme.bodySmall!.gilroySemiBold.copyWith(
        color: appTheme.blueGray50,
      );
  static get bodySmallGreenA700 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.greenA700,
      );
  static get bodySmallTeal800 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.teal800,
      );
  static get bodySmallTeal80010 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.teal800,
        fontSize: 10.fSize,
      );
}

extension on TextStyle {
  TextStyle get gilroyExtraBold {
    return copyWith(
      fontFamily: 'Gilroy-ExtraBold',
    );
  }

  TextStyle get gilroyBold {
    return copyWith(
      fontFamily: 'Gilroy-Bold',
    );
  }

  TextStyle get gilroyRegular {
    return copyWith(
      fontFamily: 'Gilroy-Regular',
    );
  }

  TextStyle get gilroyMedium {
    return copyWith(
      fontFamily: 'Gilroy-Medium',
    );
  }

  TextStyle get gilroySemiBold {
    return copyWith(
      fontFamily: 'Gilroy-SemiBold',
    );
  }
}
