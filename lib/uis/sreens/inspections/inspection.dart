import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uitest/app_constants/global_variables.dart';
import 'package:uitest/config/styles.dart';
import 'package:uitest/data/controllers/inspections_screen_ctr.dart';
import 'package:uitest/main.dart';
import 'package:uitest/uis/sreens/inspections/vehicle_camera_angles.dart';

class Inspection extends StatefulWidget {
  const Inspection({super.key});

  @override
  State<Inspection> createState() => _InspectionState();
}

class _InspectionState extends State<Inspection> {
  late CameraController cameraController;
  bool selectExposure = false;

  InspectionsCtr inspectionCtr = Get.find<InspectionsCtr>();

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  initializeCamera() async {
    cameraController = CameraController(cameras![0], ResolutionPreset.high,
        enableAudio: false);
    cameraController.initialize().then((_) async {
      await cameraController.lockCaptureOrientation(DeviceOrientation.landscapeLeft);
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) async {
      if (e is CameraException) {
        await onCameraError(e);
      }
    });
  }

  Future<void> onCameraError(CameraException e) async {
    switch (e.code) {
      case 'CameraAccessDenied':
        await Permission.camera.request();
        break;
      default:
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Permission denied'),
            content: const Text('Accept the camera access'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Permission.camera.request();
                  Navigator.pop(context, 'OK');
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
        break;
    }
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (!cameraController.value.isInitialized)
          Expanded(
              child: Center(child: Center(child: CircularProgressIndicator())))
        else
          Expanded(
            child: OrientationBuilder(builder: (context, orientation) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  LayoutBuilder(builder: (context, constraints) {
                    double cameraAspectRatio = cameraController.value.aspectRatio;
                    return AspectRatio(
                        aspectRatio: cameraAspectRatio,
                        child: CameraPreview(cameraController));
                  }),
                  // if (orientation == Orientation.portrait)
                    Visibility(visible: orientation == Orientation.portrait,child:  Center(
                        child: Styles.regular('Rotate Device',
                            fontSize: 22, color: colors.white)),),

                  if (orientation == Orientation.landscape)
                    Positioned(
                        top: 0,
                        bottom: 0,
                        right: 0,
                        child: Obx(() {
                          if (inspectionCtr.showCameraButton.value) {
                            return CameraButtonContainer(
                              camControl: cameraController,
                            );
                          } else {
                            return InspectionCameraRightSide();
                          }
                        })),
                  if (orientation == Orientation.landscape)
                    Positioned(
                        top: 110,
                        bottom: 85,
                        left: 160,
                        right: 390,
                        child: BuildPictureFrame()),
                  if (orientation == Orientation.landscape)
                    Positioned(
                        top: 60.5,
                        bottom: 0,
                        left: 5,
                        child: SafeArea(
                          minimum: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 60),
                          child: BuildExposure(camController: cameraController),
                        )),
                  if (orientation == Orientation.landscape)
                    Positioned(
                      top: 90,
                      bottom: 0,
                      left: 0,
                      child: InspectionStatusBuilder(),
                    )
                ],
              );
            }),
          ),
      ],
    ));
  }
}

class InspectionStatusBuilder extends StatelessWidget {
  const InspectionStatusBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    InspectionsCtr inspectionCtr = Get.find<InspectionsCtr>();
    return Obx(() => Transform.rotate(
          origin: Offset(-20, -30),
          angle: 45.54,
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.red),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: colors.fadedBlack,
                      borderRadius: BorderRadius.circular(17.93)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: inspectionCtr.inspectionModelList
                        .map((item) => Padding(
                              padding: EdgeInsets.all(5.5),
                              child: SvgPicture.asset(item.isVerified!
                                  ? 'assets/icons/done-active.svg'
                                  : 'assets/icons/done-inactive.svg'),
                            ))
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class InspectionCameraRightSide extends StatelessWidget {
  const InspectionCameraRightSide({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> vehicleVies = [
      VehicleLeftView(),
      VehicleFrontView(),
      NoItem(),
      NoItem(),
      NoItem(),
      NoItem(),
      NoItem(),
      NoItem(),
    ];
    InspectionsCtr inspectionCtr = Get.find<InspectionsCtr>();
    return Obx(() => Container(
          width: 310,
          height: 375,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(85, 85, 85, 0.6), // First gradient layer (0deg)
                Color.fromRGBO(85, 85, 85, 0.6),
              ],
            ),
            backgroundBlendMode: BlendMode.overlay, // Blends the two gradients
          ),
          child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(124, 124, 124, 0.2),
                    Color.fromRGBO(255, 255, 255, 0.0),
                  ],
                ),
              ),
              child: vehicleVies[inspectionCtr.currentViewIndex.value]),
        ));
  }
}

class CameraButtonContainer extends StatelessWidget {
  const CameraButtonContainer({super.key, required this.camControl});

  final CameraController camControl;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.6,
      child: Container(
        alignment: Alignment.center,
        width: 156.99998474121108,
        height: 376.00000000000034,
        color: colors.fadedBlack2,
        child: CameraButton(cameraController: camControl),
      ),
    );
  }
}

class CameraButton extends StatelessWidget {
  const CameraButton({super.key, required this.cameraController});

  final CameraController cameraController;

  @override
  Widget build(BuildContext context) {
    InspectionsCtr inspectionCtr = Get.find<InspectionsCtr>();
    return GestureDetector(
        onTap: () async {
          if (inspectionCtr.image!.value.path.isEmpty) {
            await cameraController.takePicture().then((file) {
              inspectionCtr.setImageImage(File(file.path));
            });
          }
          inspectionCtr.onTappedCameraButton();
        },
        child: Obx(
          () => Container(
            alignment: Alignment.center,
            height: 60,
            width: 60,
            decoration:
                BoxDecoration(color: colors.white, shape: BoxShape.circle),
            child: Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                  color: inspectionCtr.wasTappedCameraButton.value == 'captured'
                      ? colors.green2
                      : colors.white,
                  border: Border.all(color: colors.fadedBlack2, width: 3),
                  shape: BoxShape.circle),
            ),
          ),
        ));
  }
}

class BuildExposure extends StatefulWidget {
  const BuildExposure({super.key, required this.camController});

  final CameraController camController;

  @override
  State<BuildExposure> createState() => _BuildExposureState();
}

class _BuildExposureState extends State<BuildExposure> {
  final double _minAvailableExposureOffset = 0.0;
  final double _maxAvailableExposureOffset = 8.0;
  double _currentExposureOffset = 0.0;

  Future<void> setExposureOffset(double offset) async {
    _currentExposureOffset = offset;
    setState(() {});
    try {
      offset = await widget.camController.setExposureOffset(offset);
    } on CameraException catch (e) {
      e.toString();
      rethrow;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3,
      child: Container(
        width: 15,
        decoration: BoxDecoration(
            color: colors.fadedBlack,
            borderRadius: BorderRadius.circular(17.8)),
        child: SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 9,
            trackShape: RectangularSliderTrackShape(),
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
            overlayShape: SliderComponentShape.noOverlay,
          ),
          child: Slider(
            value: _currentExposureOffset,
            min: _minAvailableExposureOffset,
            max: _maxAvailableExposureOffset,
            thumbColor: colors.white,
            activeColor: Colors.white,
            inactiveColor: colors.textGray,
            label: _currentExposureOffset.toString(),
            onChanged:
                _minAvailableExposureOffset == _maxAvailableExposureOffset
                    ? null
                    : setExposureOffset,
          ),
        ),
      ),
    );
  }
}

class BuildPictureFrame extends StatelessWidget {
  const BuildPictureFrame({super.key});

  @override
  Widget build(BuildContext context) {
    InspectionsCtr inspectionCtr = Get.find<InspectionsCtr>();
    return Obx(() => Stack(
          fit: StackFit.expand,
          children: [
            Container(
              width: 333,
              height: 194.54,
              decoration: BoxDecoration(
                  border: Border.all(width: 8, color: colors.white),
                  borderRadius: BorderRadius.circular(4)),
              child: inspectionCtr.image!.value.path.isEmpty
                  ? SizedBox()
                  : Image.file(inspectionCtr.image!.value,
                      fit: BoxFit.fill, width: 333, height: 194.54),
            ),
            DottedBorder(
              radius: Radius.circular(4),
              strokeWidth: 3,
              dashPattern: [18, 18],
              color: colors.black,
              child: SizedBox(
                width: 333,
                height: 194.54,
              ),
            ),
          ],
        ));
  }
}
