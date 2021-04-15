import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mooc/tools/colors.dart';

import 'hexColor.dart';

Widget buildTextFormField(
    {String hintText,
    String initialValue,
    VoidCallback onEditingComplete,
    TextInputAction textInputAction,
    TextInputType keyboardType,
    bool enable,
    ValueChanged<String> onChanged,
    BorderRadius borderRadius,
    TextEditingController controller,
    TextAlign textAlign = TextAlign.start,
    Widget suffixIcon,
    Color borderColor,
    Color disableBorderColor,
    Color fillColor,
    bool obscureText = false,
    int maxLines,
    TextAlignVertical textAlignVertical,
    FormFieldValidator<String> validator}) {
  return TextFormField(
    initialValue: initialValue,
    controller: controller,
    textAlign: textAlign,
    textAlignVertical: textAlignVertical,
    obscureText: obscureText,
    maxLines: maxLines != null ? maxLines : null,
    enabled: enable != null ? enable : true,
    style: TextStyle(color: HexColor('#282828'), fontSize: 16),
    decoration: InputDecoration(
      suffixIcon: suffixIcon,
      contentPadding: EdgeInsets.only(bottom: 12, top: 8, right: 12, left: 12),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius:
              borderRadius != null ? borderRadius : BorderRadius.circular(0)),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: borderColor != null ? borderColor : Colors.grey),
          borderRadius:
              borderRadius != null ? borderRadius : BorderRadius.circular(0)),
      disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: disableBorderColor != null
                  ? disableBorderColor
                  : Colors.grey),
          borderRadius:
              borderRadius != null ? borderRadius : BorderRadius.circular(0)),
      fillColor: fillColor != null ? fillColor : Colors.white,
      filled: true,
      hintText: hintText,
      hintStyle: TextStyle(
          color: HexColor(hintColor),
          fontSize: 16,
          fontWeight: FontWeight.w400),
    ),
    validator: validator,
    onChanged: onChanged,
    textInputAction: textInputAction,
    keyboardType: keyboardType,
    // move to the next field
    onEditingComplete: onEditingComplete,
  );
}

Widget buildText(String text, Color color, double fontSize,
    {TextDecoration decoration,
    TextAlign textAlign,
    FontWeight fontWeight,
    int maxLines,
    TextOverflow overflow}) {
  return Text(
    text,
    textAlign: textAlign,
    maxLines: maxLines ?? null,
    overflow: overflow,
    style: TextStyle(
        color: color,
        fontSize: fontSize,
        decoration: decoration,
        fontWeight: fontWeight != null ? fontWeight : FontWeight.w400),
  );
}

Widget buildWrongText(String text) {
  return buildText(text, HexColor('#FF4848'), 12, fontWeight: FontWeight.w500);
}

Widget buildRoundedButton(
    {Color color, GestureTapCallback onTap, Widget text, double radius = 8}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: Get.width,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius), color: color),
      child: text,
    ),
  );
}
