import 'package:flutter/cupertino.dart';
import 'package:uitest/data/models/inpection_model.dart';
import 'package:uitest/uis/widgets/inspection_instructions_tex_span.dart';

class Constants {
  static const List<Widget> inspectionSteps = [
    PicInstructionOne(),
    CommonInspectionInstruction(
      imageAsset: 'assets/images/frot-view.png',
      view: 'Front View',
    ),
    CommonInspectionInstruction(
      imageAsset: 'assets/images/left-view.png',
      view: 'Left View ( Driver side )',
      greenSpan: 'Left View,',
    ),
    CommonInspectionInstruction(
      imageAsset: 'assets/images/back-view.png',
      view: 'Back View',
    ),
    CommonInspectionInstruction(
      imageAsset: 'assets/images/right-view.png',
      view: 'Right View',
    ),
    ChassisNo(),
    CommonInspectionInstruction(
      imageAsset: 'assets/images/dash-board.png',
      view: 'Vehicle Dashboard',
    ),
    CommonInspectionInstruction(
      imageAsset: 'assets/images/interior-back.png',
      view: 'Vehicle Interior back',
    ),
  ];

  static const List<InspectionModel> inspectionStatus = [
    InspectionModel(title: 'left', isVerified: false),
    InspectionModel(title: 'front', isVerified: false),
    InspectionModel(title: 'right', isVerified: false),
    InspectionModel(title: 'back', isVerified: false),
    InspectionModel(title: 'well-lit-shade', isVerified: false),
    InspectionModel(title: 'chassis no,', isVerified: false),
    InspectionModel(title: 'dashboard', isVerified: false),
  ];
}
