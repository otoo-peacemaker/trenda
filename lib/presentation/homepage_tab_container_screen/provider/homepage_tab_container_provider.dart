import 'package:flutter/material.dart';
import 'package:trenda/core/app_export.dart';
import 'package:trenda/presentation/homepage_tab_container_screen/models/homepage_tab_container_model.dart';
import '../models/categorygrid_item_model.dart';

/// A provider class for the HomepageTabContainerScreen.
///
/// This provider manages the state of the HomepageTabContainerScreen, including the
/// current homepageTabContainerModelObj

// ignore_for_file: must_be_immutable
class HomepageTabContainerProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  HomepageTabContainerModel homepageTabContainerModelObj =
      HomepageTabContainerModel();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
}
