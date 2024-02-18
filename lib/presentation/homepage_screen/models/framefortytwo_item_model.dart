import '../../../core/app_export.dart';

/// This class is used in the [framefortytwo_item_widget] screen.
class FramefortytwoItemModel {
  FramefortytwoItemModel({
    this.generalImage,
    this.generalText,
    this.adText,
    this.id,
  }) {
    generalImage = generalImage ?? ImageConstant.imgFda422ddD50c4;
    generalText = generalText ?? "General";
    adText = adText ?? "1 Ad";
    id = id ?? "";
  }

  String? generalImage;

  String? generalText;

  String? adText;

  String? id;
}
