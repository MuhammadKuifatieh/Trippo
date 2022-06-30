import 'package:flutter/material.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({Key? key, this.color}) : super(key: key);
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
      ),
    );
  }
}
