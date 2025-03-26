import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uitest/app_constants/global_variables.dart';
import 'package:uitest/config/styles.dart';

class ClickableContainer extends StatelessWidget {
  const ClickableContainer({
    super.key,
    this.padding,
    this.onPressed,
    this.backgroundColor,
    this.height,
    this.width,
    this.isGreenColor,
    this.textStyle,
    required this.title,
  });

  final EdgeInsets? padding;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final bool? isGreenColor;
  final String title;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Container(
            width: width ?? 335.w,
            height: height ?? 48.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: isGreenColor == null || isGreenColor!
                  ? colors.green
                  : colors.white,
            ),
            child: Styles.medium(title,textStyle: textStyle,
                fontSize: 14.sp,
                color: isGreenColor == null || isGreenColor!
                    ? colors.white
                    : colors.textBlack),
          ),
        ),
      ),
    );
  }
}
