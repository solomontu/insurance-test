import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:uitest/app_constants/app_strings.dart';
import 'package:uitest/app_constants/const.dart';
import 'package:uitest/app_constants/global_variables.dart';
import 'package:uitest/config/styles.dart';
import 'package:uitest/data/controllers/inspetion_instruction_controller.dart';
import 'package:uitest/data/models/how_to_inspect_step_model.dart';
import 'package:uitest/uis/widgets/buttons/action_button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  void dispose() {
    // Reset to system default when leaving this screen
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  int selectedIndex = 2;

  void onItemTapped(int index) {
    selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w, bottom: 20.h),
        child: SafeArea(
            minimum: EdgeInsets.only(top: 24.h, bottom: 22),
            child: Column(
              children: [
                Expanded(flex: 100, child: Header()),
                Expanded(flex: 502, child: BodyBuilder()),
                Expanded(flex: 20, child: SizedBox()),
                Expanded(flex: 48, child: CallToActions())
              ],
            )),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Styles.semiBold(Strings.stepOnHowToInspect,
            fontSize: 22.sp, color: colors.textBlack),
        Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: SubTitleText(),
        ),
      ],
    );
  }
}

class SubTitleText extends StatelessWidget {
  const SubTitleText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      softWrap: true,
      textAlign: TextAlign.center,
      text: TextSpan(
        style: Styles.regularTextStyle(
          fontSize: 16.sp,
          color: colors.subText,
        ),
        children: [
          TextSpan(
            text: 'It is important to note all these ',
          ),
          TextSpan(
            text: 'STEP ',
            style:
                Styles.semiBoldTextStyles(fontSize: 16, color: colors.purple),
          ),
          TextSpan(
            text: 'before starting your Inspection',
          ),
        ],
      ),
    );
  }
}

class BodyBuilder extends StatelessWidget {
  const BodyBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final HowToInspectCtr inspectCtr = Get.find<HowToInspectCtr>();
    return Obx(() => Container(
          margin: EdgeInsets.only(top: 28.h),
          padding:
              EdgeInsets.only(top: 20.0.h, bottom: 15.h, left: 8.w, right: 8.w),
          height: 502.h,
          // width: 335.w,
          decoration: BoxDecoration(
              color: colors.purpleLight,
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 26,
                child: ListView.builder(
                    itemCount: inspectCtr.stepIndexIndicator.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => StepIndexBuilder(
                          step: inspectCtr.stepIndexIndicator[index],
                          onTap: () {
                            inspectCtr.onIndexPressed(index);
                          },
                        )),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 50.h),
                  // height: 77.h,
                  width: 313.w,
                  // color: Colors.black,
                  child: PageView(
                    controller: inspectCtr.pageController.value,
                    physics: NoScrollPhysics(),
                    children: Constants.inspectionSteps,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class StepIndexBuilder extends StatelessWidget {
  const StepIndexBuilder({super.key, required this.step, required this.onTap});

  final HowToInspectModel step;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0.w),
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 2.w),
            alignment: Alignment.center,
            height: 26.h,
            width: !step.isShown! ? 26.w : 74.w,
            decoration: BoxDecoration(
                color: colors.offWhite,
                borderRadius: BorderRadius.circular(20)),
            child: !step.isShown!
                ? Styles.regular('${step.index! + 1}',
                    fontSize: 18.sp, color: colors.textGray)
                : RichText(
                    softWrap: true,
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: Styles.regularTextStyle(
                        fontSize: 18.sp,
                        color: colors.subText,
                      ),
                      children: [
                        TextSpan(
                          text: 'STEP ',
                          style: Styles.semiBoldTextStyles(
                              fontSize: 18, color: colors.black),
                        ),
                        TextSpan(
                            text: '${step.index! + 1}',
                            style: Styles.semiBoldTextStyles(
                                fontSize: 18.sp, color: colors.purple)),
                      ],
                    ),
                  )),
      ),
    );
  }
}

class CallToActions extends StatelessWidget {
  const CallToActions({super.key});

  @override
  Widget build(BuildContext context) {
    final HowToInspectCtr inspectCtr = Get.find<HowToInspectCtr>();
    return Obx(() {
      if (inspectCtr.pageCount.value == 7) {
        return ClickableContainer(
          title: 'Start Inspection',
          // width: 140.w,
          onPressed: () {
            inspectCtr.startInspection();
          },
        );
      } else {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SkipButton(
              onTap: () {
                inspectCtr.startInspection();
              },
            ),
            ClickableContainer(
              title: 'Next Step',
              width: 140.w,
              onPressed: () {
                inspectCtr.nextInspectionInstruction();
              },
            ),
          ],
        );
      }
    });
  }
}

class SkipButton extends StatelessWidget {
  const SkipButton({super.key, required this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 48.h,
        width: 170.w,
        child: Center(
            child: Styles.medium('Skip',
                fontSize: 14.sp, color: colors.textBlack)),
      ),
    );
  }
}

class NoScrollPhysics extends ScrollPhysics {
  const NoScrollPhysics({super.parent});

  @override
  NoScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return NoScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  bool get allowImplicitScrolling => false;

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) => 0.0;

  @override
  bool shouldAcceptUserOffset(ScrollMetrics position) => false;

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) => 0.0;
}
