import 'package:flutter/material.dart';
import 'package:scube/config/font_constant.dart';
import 'app_colors.dart';


TextStyle customTextStyle(context,{Color? color,double? fontSize,fontWeight}){
  return  TextStyle(
      fontSize: fontSize ?? TextSize.font14(context),
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? AppColors.baseColor
  );
}
