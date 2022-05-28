
import 'package:flutter/material.dart';

class MainTextField extends StatelessWidget {
  const MainTextField({
    Key? key,
    this.maxLines = 1,
    required this.controller,
  }) : super(key: key);
  final int maxLines;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
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
