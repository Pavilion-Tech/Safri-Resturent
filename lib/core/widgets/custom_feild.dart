import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/color_resources.dart';
import '../utils/font_manager.dart';

// ignore: must_be_immutable
class CustomField extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  final String? label;
  final String? prefixText;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final Widget? suffix;
  final Widget? prefix;
  final bool isPassword;
  final TextStyle? hintStyle;
  final TextStyle? lableStyle;
  final TextInputType? inputType;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final Function()? onEditingComplete;
  final Function()? onTap;
  final bool readOnly;
  final int? maxLines;
  final bool? filled;
  final Color? fillColor;
  final List<TextInputFormatter>? formatter;
  final TextStyle? style;
  double? radius;

  CustomField(
      {required this.controller,
      this.radius,
      this.hint,
      this.prefixText,
      this.label,
      this.lableStyle,
      this.suffix,
      this.prefix,
      this.isPassword = false,
      this.inputType = TextInputType.text,
      this.validator,
      this.onChanged,
      this.onEditingComplete,
      this.onTap,
      this.readOnly = false,
      this.maxLines = 1,
      this.filled = false,
      this.fillColor = Colors.white,
      this.formatter,
      super.key,
      this.hintStyle,
      this.focusNode,
      this.style,
      this.nextFocus});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autocorrect: true,
      showCursor: true,
      autofocus: false,
      cursorColor: ColorResources.kDefaultColor,
      focusNode: focusNode,
      maxLines: maxLines,
      readOnly: readOnly,
      obscureText: isPassword,
      textInputAction: TextInputAction.done,
      keyboardType: inputType,
      controller: controller,
      onFieldSubmitted: (text) => nextFocus != null
          ? FocusScope.of(context).requestFocus(nextFocus)
          : null,
      style: style ??
          FontManager.getMediumStyle(
              fontSize: 16, color: ColorResources.black),
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      validator: validator,
      inputFormatters: formatter,
      onTap: onTap,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 15),
          borderSide: BorderSide(color: ColorResources.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 15),
          borderSide: BorderSide(color: ColorResources.lightGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 15),
          borderSide: BorderSide(color: ColorResources.kDefaultColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 15),
          borderSide: BorderSide(color: ColorResources.kErrorColor),
        ),
        hintText: hint,
        labelText: label,
        labelStyle: lableStyle ??
            FontManager.getMediumStyle(
                fontSize: 14),
        hintStyle: hintStyle ??
            FontManager.getMediumStyle(
                fontSize: 14, color: ColorResources.lightGrey),
        suffixIcon: suffix!=null
            ?Padding(padding: EdgeInsets.all(10),child: suffix,)
            :null,
        prefixIcon: prefix,
        prefixText: prefixText,
        errorStyle: TextStyle(
          color: ColorResources.kErrorColor,
        ),
        filled: filled,
        fillColor: fillColor,
        contentPadding:const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 15,
        ),
      ),
    );
  }
}
