import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListItems extends StatelessWidget {
    ListItems({ Key? key, required this.select, required this.widget, this.onSelect }) : super(key: key);
   bool select;
  final Widget widget;
  final void Function(bool)? onSelect;
  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
              selectedColor: Colors.transparent,
              label: widget,
              selected: select,
              onSelected:onSelect ,
              backgroundColor: Colors.transparent,
              side: BorderSide(width: select ? 2 : 0.5, color:Theme.of(context).primaryColor ),
            );
  }
}