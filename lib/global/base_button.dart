import 'package:flutter/material.dart';
import 'package:scube/config/font_constant.dart';
import 'package:scube/config/responsive_scale.dart';
import 'package:scube/core/const/color_utils.dart';

class BaseButton extends StatelessWidget {
  final VoidCallback onClick;
  final String title;
  final Widget? icon;
  final bool? inActive;
  final double? fontSize;
  final bool? scaleDown;
  final Widget? leading;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? contentPadding;
  const BaseButton({
    super.key,
    required this.onClick,
    required this.title,
    this.icon,
    this.inActive,
    this.fontSize,
    this.scaleDown,
    this.leading,
    this.padding,
    this.borderRadius,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: onClick,
          child: Container(
            padding: padding ?? EdgeInsets.symmetric(vertical: 12),
            decoration: ShapeDecoration(
              color: ColorUtils.competeBorderColor,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: ColorUtils.baseColor),
                borderRadius: BorderRadius.circular(borderRadius ?? 10),
              ),

            ),
            child: Row(
              mainAxisSize: scaleDown == true ? MainAxisSize.min : MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                scaleDown == true || leading != null
                    ? Padding(
                      // padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      padding: contentPadding ?? const EdgeInsets.only(left: 2, right: 12.0),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontSize ?? TextSize.font18(context),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                    : Expanded(
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontSize ?? TextSize.font18(context),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
              ],
            ),
          ),
        );
  }
}