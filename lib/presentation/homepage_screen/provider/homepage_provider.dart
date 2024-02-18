import 'package:flutter/material.dart';
import 'package:trenda/core/app_export.dart';
import 'package:trenda/presentation/homepage_screen/models/homepage_model.dart';
import '../models/framefortytwo_item_model.dart';

/// A provider class for the HomepageScreen.
///
/// This provider manages the state of the HomepageScreen, including the
/// current homepageModelObj

// ignore_for_file: must_be_immutable
class HomepageProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  HomepageModel homepageModelObj = HomepageModel();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
}
