import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/widgets/custom_text_form_field.dart';

class SearcAppBar extends StatelessWidget {
  const SearcAppBar({
    Key? key,
    required this.onChange,
    required this.onSubmit,
  }) : super(key: key);
  final void Function(String?) onChange;
  final void Function(String?) onSubmit;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(25)),
        child: CustomTextFormField(
          onChange: onChange,
          onSubmit: onSubmit,
          isSearch: true,
          textInputType: TextInputType.text,
          prefix: const Icon(Icons.search),
          hintText: '${AppLocalizations.of(context)!.search}.....',
        ),
      ),
    );
  }
}
