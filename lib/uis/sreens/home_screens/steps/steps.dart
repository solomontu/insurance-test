import 'package:flutter/material.dart';
import 'package:uitest/app_constants/global_variables.dart';
import 'package:uitest/uis/widgets/buttons/action_button.dart';
import 'package:uitest/uis/widgets/inspection_instructions_tex_span.dart';

class StartStep extends StatelessWidget {
  const StartStep(
      {super.key,
      required this.leading,
      required this.middle,
      required this.trailing,
      required this.imagePath,
      required this.backButtonTitle,
      required this.proceedButtonTitle,
      required this.onProceed,
      required this.subTitle,
      this.rotationAngle,
      this.imageBottomPosition});

  final String? leading;
  final String? middle;
  final String? trailing;
  final String? imagePath;
  final String? backButtonTitle;
  final String? proceedButtonTitle;
  final void Function()? onProceed;
  final String? subTitle;
  final double? rotationAngle;
  final double? imageBottomPosition;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
            bottom: 290,
            child: VehicleSideViewSpan1(
                leading: leading, title: middle, trailing: trailing)),
        Positioned(
          bottom: 260,
          child: Text(
            subTitle!,
            style: TextStyle(
                fontSize: 16, color: colors.white, fontWeight: FontWeight.w400),
          ),
        ),
        Positioned(
          bottom: imageBottomPosition ?? 30,
          child: Transform.rotate(
              angle: rotationAngle ?? 45.54, child: Image.asset(imagePath!)),
        ),
        Positioned(
          bottom: 40,
          child: ActionButtons(
              backButtonTitle: backButtonTitle,
              proceedButtonTitle: proceedButtonTitle,
              onProceed: onProceed),
        )
      ],
    );
  }
}

class VerifyStep extends StatelessWidget {
  const VerifyStep({
    super.key,
    required this.leading,
    required this.middle,
    required this.trailing,
    this.subTitle,
    required this.backButtonTitle,
    required this.proceedButtonTitle,
    required this.onProceed,
  });

  final String? leading;
  final String? middle;
  final String? trailing;
  final String? subTitle;
  final String? backButtonTitle;
  final String? proceedButtonTitle;
  final void Function()? onProceed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
            bottom: 250,
            child: VehicleSideViewSpan1(
                leading: leading, title: middle, trailing: trailing)),
        Positioned(
            bottom: 190,
            left: 4,
            right: 4,
            child: Text(
              softWrap: true,
              subTitle!,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  color: colors.white,
                  fontWeight: FontWeight.w400),
            )),
        Positioned(
          bottom: 40,
          child: ActionButtons(
              backButtonTitle: backButtonTitle,
              proceedButtonTitle: proceedButtonTitle,
              onProceed: onProceed),
        )
      ],
    );
  }
}

class VerifyingStep extends StatelessWidget {
  const VerifyingStep({
    super.key,
    required this.leading,
    required this.title,
    this.imagePath,
    this.subtitle,
    required this.backButtonTitle,
    required this.proceedButtonTitle,
    required this.onProceed,
  });

  final String? leading;
  final String? title;
  final String? imagePath;
  final String? subtitle;
  final String? backButtonTitle;
  final String? proceedButtonTitle;
  final void Function()? onProceed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
            bottom: 290,
            child: VehicleSideViewSpan2(leading: leading, title: title)),
        Positioned(
          bottom: 190,
          child: Transform.rotate(angle: 45.54, child: Image.asset(imagePath!)),
        ),
        Positioned(
            bottom: 140,
            child: Text(
              subtitle!,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  color: colors.white,
                  fontWeight: FontWeight.w400),
            )),
        Positioned(
          bottom: 40,
          child: ActionButtons(
              backButtonTitle: backButtonTitle,
              proceedButtonTitle: proceedButtonTitle,
              onProceed: onProceed),
        )
      ],
    );
  }
}

class ActionButtons extends StatelessWidget {
  const ActionButtons(
      {super.key,
      required this.backButtonTitle,
      required this.proceedButtonTitle,
      required this.onProceed});

  final String? backButtonTitle;
  final String? proceedButtonTitle;
  final void Function()? onProceed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClickableContainer(
          title: backButtonTitle!,
          height: 46,
          width: 123,
          isGreenColor: false,
          textStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: colors.textBlack),
          onPressed: () {},
        ),
        SizedBox(width: 20),
        ClickableContainer(
          textStyle: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 14, color: colors.white),
          title: proceedButtonTitle!,
          width: 123,
          height: 46,
          onPressed: onProceed,
        ),
      ],
    );
  }
}
