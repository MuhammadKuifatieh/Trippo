import 'package:flutter/material.dart';
import 'package:trippo/core/widgets/custom_text_form_field.dart';

class SearcAppBar extends StatelessWidget {
  const SearcAppBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,),
      child: Container(
        height: 50,
        decoration: BoxDecoration( border:Border.all(color: Colors.grey) ,
            borderRadius: BorderRadius.circular(25)),
        child: const CustomTextFormField(isSearch: true,
          textInputType: TextInputType.text,
          prefix: Icon(Icons.search),
          hintText: 'Search.....',
        ),
      ),
    );
  }
}