import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uitest/app_constants/route_paths.dart';
import 'package:uitest/core/services/app_service_manager.dart';

import '../models/how_to_inspect_step_model.dart';

class HowToInspectCtr extends GetxController {
  Rx<PageController> pageController = PageController().obs;
  RxList<HowToInspectModel> stepIndexIndicator = <HowToInspectModel>[].obs;
  RxInt pageCount = 0.obs;


  @override
  void onInit() {
    super.onInit();
    stepIndexIndicator.assignAll(
      List.generate(
        8,
        (index) => HowToInspectModel(
          index: index,
          isShown: index == 0,
        ),
      ),
    );
  }

  void nextInspectionInstruction() {
    if (pageController.value.hasClients) {
      pageCount.value += 1;

      pageController.value.animateToPage(
        pageCount.value,
        duration: const Duration(milliseconds: 300), // 300ms duration
        curve: Curves.easeOut, // Ease-out timing function
      );

      setSelectedIndex();
    }
  }

  void setSelectedIndex() {
    stepIndexIndicator.value = stepIndexIndicator.map((item) {
      return item.index == pageCount.value
          ? item.copyWith(isShown: true)
          : item.copyWith(isShown: false);
    }).toList();
  }

  void onIndexPressed(int index) {
    pageCount.value = index;
    pageController.value.animateToPage(
      pageCount.value,
      duration: const Duration(milliseconds: 300), // 300ms duration
      curve: Curves.easeOut, // Ease-out timing function
    );

    setSelectedIndex();
  }

  void startInspection() {
    as.routerService.getOffAll(Routes.startInspection);
  }
}



