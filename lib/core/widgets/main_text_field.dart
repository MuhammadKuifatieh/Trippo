import 'package:flutter/material.dart';

class MainTextField extends StatelessWidget {
  const MainTextField({
    Key? key,
    this.maxLines = 1,
    required this.controller,
    this.hintText,
    this.onTap,
    this.readOnly = false,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);
  final int maxLines;
  final TextEditingController controller;
  final String? hintText;
  final void Function()? onTap;
  final bool readOnly;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onTap: onTap,
      readOnly: readOnly,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      maxLines: maxLines,
    );
  }
}
