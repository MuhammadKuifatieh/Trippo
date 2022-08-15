// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';

class DateDialog extends StatelessWidget {
  final String title;
  final String buttonText;
  final void Function() onTap;
  final Size size;
  DateTime? dateTime;
  final DateTime? lastDate;
  DateDialog({
    Key? key,
    required this.title,
    required this.onTap,
    required this.size,
    required this.buttonText,
    this.dateTime,
    this.lastDate,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.1,
          vertical: size.width * 0.1,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(30),
        ),
        width: size.width * .75,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: size.width * .06),
            ),
            DatePickerWidget(
              initialDate: dateTime,
              lastDate: lastDate,
              onChange: (startingDate, _) {
                dateTime = startingDate;
              },
              pickerTheme: DateTimePickerTheme(
                backgroundColor: Colors.transparent,
                itemHeight: 40,
                dividerColor: Theme.of(context).primaryColor,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop(dateTime ?? DateTime.now());
                onTap();
              },
              child: Container(
                // width: size.width * .2,
                // height: size.width * .1,
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).primaryColor,
                ),
                child: Center(
                  child: Text(
                    buttonText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
