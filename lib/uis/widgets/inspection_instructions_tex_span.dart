import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uitest/app_constants/global_variables.dart';
import 'package:uitest/config/styles.dart';

class PicInstructionOne extends StatelessWidget {
  const PicInstructionOne({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 421.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            softWrap: true,
            textAlign: TextAlign.left,
            text: TextSpan(
              style: Styles.regularTextStyle(
                height: 22.5 / 18.0,
                letterSpacing: -0.198,
                fontSize: 18.sp,
                color: colors.textBlack,
              ),
              children: [
                TextSpan(
                  text: 'Park your Vehicle in a',
                ),
                TextSpan(
                    text: 'well-lit, shaded, ',
                    style: Styles.mediumTextStyle(fontSize: 18.sp)),
                TextSpan(text: 'and '),
                TextSpan(
                    text: ' spacious area, ',
                    style: Styles.mediumTextStyle(fontSize: 18.sp)),
                TextSpan(
                  text: '  ensuring there are ',
                ),
                TextSpan(
                    text: '  no obstructions, ',
                    style: Styles.mediumTextStyle(fontSize: 18.sp)),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Image.asset(
              'assets/images/spacious-area.png',
              width: 302.w,
              height: 216.h,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}

class CommonInspectionInstruction extends StatelessWidget {
  const CommonInspectionInstruction(
      {super.key,
      required this.imageAsset,
      required this.view,
      this.greenSpan});

  final String? view;
  final String? imageAsset;
  final String? greenSpan;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 421.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            softWrap: true,
            textAlign: TextAlign.left,
            text: TextSpan(
              style: Styles.regularTextStyle(
                height: 22.5 / 18.0,
                letterSpacing: -0.198,
                fontSize: 18.sp,
                color: colors.textBlack,
              ),
              children: [
                TextSpan(
                  text: 'Take picture of your ',
                ),
                TextSpan(
                    text: "Vehicle's ",
                    style: Styles.mediumTextStyle(fontSize: 18.sp)),
                TextSpan(
                    text: greenSpan ?? view,
                    style: Styles.mediumTextStyle(
                        fontSize: 18.sp, color: colors.green)),
                TextSpan(text: ' ensuring it fills about '),
                TextSpan(
                    text: '80%',
                    style: Styles.mediumTextStyle(
                        fontSize: 18.sp, color: colors.green)),
                TextSpan(
                  text: '  of your camera screen ',
                ),
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: Styles.regular(view!, fontSize: 16.sp),
              ),
              Image.asset(
                imageAsset!,
                width: 302.w,
                height: 176.h,
                fit: BoxFit.cover,
              )
            ],
          )
        ],
      ),
    );
  }
}


class ChassisNo extends StatelessWidget {
  const ChassisNo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 421.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20.0.h),
                child: RichText(
                  softWrap: true,
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    style: Styles.regularTextStyle(
                      height: 22.5 / 18.0,
                      letterSpacing: -0.198,
                      fontSize: 18.sp,
                      color: colors.textBlack,
                    ),
                    children: [
                      TextSpan(
                        text: 'Take picture of your ',
                      ),
                      TextSpan(
                          text: "Vehicle's ",
                          style: Styles.mediumTextStyle(fontSize: 18.sp)),
                      TextSpan(
                          text: 'Chassis no.',
                          style: Styles.mediumTextStyle(
                              fontSize: 18.sp, color: colors.green)),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10.0.w),
                    child: Icon(
                      Icons.circle_outlined,
                      color: colors.purple,
                      size: 8,
                    ),
                  ),
                  Expanded(
                    child: RichText(
                      softWrap: true,
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        style: Styles.regularTextStyle(
                          height: 22.5 / 18.0,
                          letterSpacing: -0.198,
                          fontSize: 14.sp,
                          color: colors.subText3,
                        ),
                        children: [
                          TextSpan(
                            text: 'You can locate the chassis number on the  ',
                          ),
                          TextSpan(
                              text: "front windshield, ",
                              style: Styles.regularTextStyle(
                                  color: colors.green2)),
                          TextSpan(
                              text: 'or.',
                              style: Styles.regularTextStyle(
                                  fontSize: 18.sp, color: colors.textBlack)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0.h),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10.0.w),
                      child: Icon(
                        Icons.circle_outlined,
                        color: colors.purple,
                        size: 8,
                      ),
                    ),
                    Expanded(
                      child: RichText(
                        softWrap: true,
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          style: Styles.regularTextStyle(
                            height: 22.5 / 18.0,
                            letterSpacing: -0.198,
                            fontSize: 14.sp,
                            color: colors.subText3,
                          ),
                          children: [
                            TextSpan(
                              text: 'You can find it on the  ',
                            ),
                            TextSpan(
                                text: "interior door ",
                                style: Styles.regularTextStyle(
                                    color: colors.green2)),
                            TextSpan(
                              text: 'of the  ',
                            ),
                            TextSpan(
                                text: "driver's side ",
                                style: Styles.regularTextStyle(
                                    color: colors.green2)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Image.asset(
              'assets/images/chassis-no.png',
              width: 302.w,
              height: 216.h,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}

class VehicleSideViewSpan1 extends StatelessWidget {
  const VehicleSideViewSpan1(
      {super.key,
      required this.leading,
      required this.title,
      required this.trailing});

  final String? leading;
  final String? title;
  final String? trailing;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 22,
          height: 1.6,
          letterSpacing: 0.0,
          color: colors.white,
        ),
        children: [
          TextSpan(
              text: leading,
              style: TextStyle(
                  color: colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 22)),
          TextSpan(
              text: title,
              style: TextStyle(
                  color: colors.green2,
                  fontWeight: FontWeight.w600,
                  fontSize: 22)),
          TextSpan(
              text: trailing,
              style: TextStyle(
                  color: colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 22)),
        ],
      ),
    );
  }
}

class VehicleSideViewSpan2 extends StatelessWidget {
  const VehicleSideViewSpan2(
      {super.key, required this.leading, required this.title});

  final String? leading;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 22,
          height: 1.6,
          letterSpacing: 0.0,
          color: colors.white,
        ),
        children: [
          TextSpan(
              text: leading,
              style: TextStyle(
                  color: colors.green2,
                  fontWeight: FontWeight.w600,
                  fontSize: 22)),
          TextSpan(
              text: title,
              style: TextStyle(
                  color: colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 22)),
        ],
      ),
    );
  }
}
