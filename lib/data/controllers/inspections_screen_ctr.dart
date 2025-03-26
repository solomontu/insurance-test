import 'dart:io';

import 'package:get/get.dart';
import 'package:uitest/app_constants/const.dart';
import 'package:uitest/app_constants/enum.dart';
import 'package:uitest/data/models/inpection_model.dart';

class InspectionsCtr extends GetxController {
  Rx<VerificationStage> verificationStage = VerificationStage.start.obs;
  RxString wasTappedCameraButton = 'default'.obs;
  RxBool showCameraButton = false.obs;
  Rx<File>? image = File('').obs;
  RxList<InspectionModel> inspectionModelList =
      RxList<InspectionModel>.from(Constants.inspectionStatus);
  RxInt currentViewIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getCurrentInspectionView();
  }

  void setVerificationState(VerificationStage nextState) {
    verificationStage.value = nextState;
  }

  void onTappedCameraButton() {
    if (wasTappedCameraButton.value == 'default') {
      wasTappedCameraButton.value = 'captured';
    } else if (wasTappedCameraButton.value == 'captured') {
      wasTappedCameraButton.value = 'default';
      onShowCameraButton();
      setVerificationState(VerificationStage.verify);
    }
  }

  onShowCameraButton() {
    showCameraButton.value = !showCameraButton.value;
  }

  void setImageImage(File file) {
    image?.value = file;
  }

  void getCurrentInspectionView() {
    InspectionModel newItem =
        inspectionModelList.firstWhere((item) => item.isVerified == false);
    currentViewIndex.value =
        inspectionModelList.indexWhere((item) => item.title == newItem.title);
  }

  void updateCurrentInspectionView() {
    InspectionModel newItem =
        inspectionModelList.firstWhere((item) => item.isVerified == false);
    inspectionModelList.value = inspectionModelList.map((item) {
      if (item.title == newItem.title) {
        return item.copyWith(isVerified: true, imagePath: image?.value.path);
      } else {
        return item;
      }
    }).toList();
    image?.value = File(' ');
  }
}
