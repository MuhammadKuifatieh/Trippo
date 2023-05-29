import 'package:flutter/material.dart';
import 'package:trippo/core/config/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final Function()? onPressed;
  final String? Function(String?)? validator;
  final TextInputType textInputType;
  final TextInputAction? textInputAction;
  final Widget? prefix;
  final Widget? suffix;
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final bool autoFocus;
  final Function(String)? onChange;
  final Function(String)? onSubmit;
  final Function(String?)? onSave;
  final bool enabled;
  final FocusNode? focusNode;
  final Widget? label;
  final bool isProfile;
  final int? maxLength;
  final bool isSearch;
  const CustomTextFormField(
      { this.textInputType =TextInputType.name,
      Key? key,
      this.textEditingController,
      this.onPressed,
      this.validator,
      this.textInputAction,
      this.obscureText = false,
      this.autoFocus = false,
      this.prefix,
      this.suffix,
      this.hintText,
      this.onChange,
      this.onSubmit,
      this.errorText,
      this.focusNode,
      this.enabled = true,
      this.label,
      this.onSave,
      this.maxLength,
      this.isProfile = false, this.isSearch = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      onTap: onPressed,
      enabled: enabled,
      onSaved: onSave,
      maxLength: maxLength,
      focusNode: focusNode,
      autofocus: autoFocus,
      textDirection: TextDirection.ltr,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(18),
          prefixIcon: prefix,
          suffixIcon: suffix,
          hintText: hintText,
          label: label,
          labelStyle: AppTextStyles.styleWeight400(fontSize: 18, color: Colors.grey),
          counterText: '',
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2,color:isProfile?  Color(0xff39374D) : Colors.transparent)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color:isProfile? Colors.grey  : Colors.transparent)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color:isProfile? Colors.red  : Colors.transparent)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color:isSearch? Colors.grey  : Colors.transparent)),
          errorText: errorText),
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
      validator: validator,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      obscureText: obscureText,
    );
  }
}
