import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/widgets/image_setter.dart';
import '../../../../core/widgets/main_button.dart';

class UploadImageBottomSheet extends StatefulWidget {
  UploadImageBottomSheet({
    Key? key,
    required this.size,
    required this.onTapUpload,
  }) : super(key: key);

  final Size size;
  final void Function(String) onTapUpload;

  @override
  State<UploadImageBottomSheet> createState() => _UploadImageBottomSheetState();
}

class _UploadImageBottomSheetState extends State<UploadImageBottomSheet> {
  late final ValueNotifier<String?> imageName;
  @override
  void initState() {
    imageName = ValueNotifier(null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: widget.size.width * .025,
              bottom: widget.size.width * .05,
            ),
            child: Container(
              width: widget.size.width * .225,
              height: 3,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          Text(
            AppLocalizations.of(context)!.uploadImage,
            style: AppTextStyles.styleWeight500(
              color: Theme.of(context).primaryColor,
              fontSize: widget.size.width * .05,
            ),
          ),
          SizedBox(height: widget.size.width * .025),
          ImageSetter(
            onChange: (image) {
              imageName.value = image;
            },
            height: widget.size.width * .5,
            width: widget.size.width * .5,
          ),
          SizedBox(height: widget.size.width * .025),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              MainButton(
                child: Text(
                  AppLocalizations.of(context)!.cancel,
                  style: AppTextStyles.styleWeight400(
                    color: Theme.of(context).primaryColor,
                    fontSize: widget.size.width * .035,
                  ),
                ),
                height: widget.size.width * .1,
                width: widget.size.width * .35,
                color: Colors.white,
                border: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(width: widget.size.width * .1),
              MainButton(
                child: Text(
                  AppLocalizations.of(context)!.upload,
                  style: AppTextStyles.styleWeight400(
                    color: Colors.white,
                    fontSize: widget.size.width * .035,
                  ),
                ),
                height: widget.size.width * .1,
                width: widget.size.width * .35,
                onTap: () {
                  if (imageName.value != null) {
                    widget.onTapUpload(imageName.value!);
                  } else {
                    BotToast.showText(
                      text: AppLocalizations.of(context)!.somethingWrong,
                    );
                  }
                },
              ),
            ],
          ),
          SizedBox(height: widget.size.width * .05),
        ],
      ),
    );
  }
}
