import 'package:flutter/material.dart';
import 'package:trippo/core/config/app_text_styles.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    Key? key,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.hintText,
    this.obscureText = false,
  }) : super(key: key);

  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final String? hintText;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(
            color: Color(0xFFEEEEEE),
            width: 1.5,
          ),
        ),
        hintStyle: AppTextStyles.styleWeight400(
          fontSize: 16,
          color: const Color(0xFF3B3B3B),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
      style: AppTextStyles.styleWeight400(
        color: Colors.black,
        fontSize: 14,
      ).copyWith(height: 1),
    );
  }
}
