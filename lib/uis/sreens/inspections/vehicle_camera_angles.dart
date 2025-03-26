import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uitest/app_constants/enum.dart';
import 'package:uitest/data/controllers/inspections_screen_ctr.dart';
import 'package:uitest/uis/sreens/home_screens/steps/steps.dart';

class VehicleLeftView extends StatelessWidget {
  const VehicleLeftView({super.key});

  @override
  Widget build(BuildContext context) {
    InspectionsCtr inspectionCtr = Get.find<InspectionsCtr>();
    List<Widget> stages = [
      StartStep(
        imagePath: 'assets/images/vehicle-lef-side-view1.png',
        leading: 'Vehicle ',
        middle: 'Left side,',
        trailing: 'View',
        backButtonTitle: 'Go back',
        subTitle: 'Take Vehicle left view',
        proceedButtonTitle: 'Start',
        onProceed: () => inspectionCtr.onShowCameraButton(),
      ),
      VerifyStep(
        leading: 'Vehicle ',
        middle: 'Left side ',
        trailing: 'View',
        subTitle:
            'Confirm Vehicle side view to move to\n the next Vehicle view',
        backButtonTitle: 'Re capture',
        proceedButtonTitle: 'Verify',
        onProceed: () =>
            inspectionCtr.setVerificationState(VerificationStage.verifying),
      ),
      VerifyingStep(
        imagePath: 'assets/images/app-icon.png',
        leading: 'Verifying ',
        title: 'Vehicle image ',
        subtitle: 'Hold on while we verify\n your image',
        backButtonTitle: 'Re capture',
        proceedButtonTitle: 'Verify',
        onProceed: () {
          inspectionCtr.updateCurrentInspectionView();
          inspectionCtr.getCurrentInspectionView();
          inspectionCtr.setVerificationState(VerificationStage.start);
        },
      ),
    ];

    return Obx(() => IndexedStack(
        index: inspectionCtr.verificationStage.value.index, children: stages));
  }
}

class VehicleFrontView extends StatelessWidget {
  const VehicleFrontView({super.key});

  @override
  Widget build(BuildContext context) {
    InspectionsCtr inspectionCtr = Get.find<InspectionsCtr>();
    List<Widget> stages = [
      StartStep(
        imagePath: 'assets/images/vehicle-front-side-view.png',
        imageBottomPosition: 90,
        leading: 'Vehicle ',
        middle: 'Front Side,',
        trailing: 'View',
        backButtonTitle: 'Go back',
        subTitle: 'Take Vehicle left view',
        proceedButtonTitle: 'Start',
        onProceed: () => inspectionCtr.onShowCameraButton(),
      ),
      VerifyStep(
        leading: 'Vehicle ',
        middle: 'Front side ',
        trailing: 'View',
        subTitle:
            'Confirm Vehicle front view to\n move to the next Vehicle view',
        backButtonTitle: 'Re capture',
        proceedButtonTitle: 'Verify',
        onProceed: () =>
            inspectionCtr.setVerificationState(VerificationStage.verifying),
      ),
      VerifyingStep(
        imagePath: 'assets/images/app-icon.png',
        leading: 'Verifying ',
        title: 'Vehicle image ',
        subtitle: 'Hold on while we verify\n your image',
        backButtonTitle: 'Re capture',
        proceedButtonTitle: 'Verify',
        onProceed: () {
          inspectionCtr.updateCurrentInspectionView();
          inspectionCtr.getCurrentInspectionView();
          inspectionCtr.setVerificationState(VerificationStage.start);
        },
      ),
    ];

    return Obx(() => IndexedStack(
        index: inspectionCtr.verificationStage.value.index, children: stages));
  }
}

class NoItem extends StatelessWidget {
  const NoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('No Item Yet'),
    );
  }
}
