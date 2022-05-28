import 'package:flutter/material.dart';
import '../../../../core/config/app_text_styles.dart';
import '../pages/place_screen.dart';

class UploadImageBottomSheet extends StatelessWidget {
  const UploadImageBottomSheet({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: size.width * .025,
              bottom: size.width * .05,
            ),
            child: Container(
              width: size.width * .225,
              height: 3,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          Text(
            "Upload Image",
            style: AppTextStyles.styleWeight500(
              color: Theme.of(context).primaryColor,
              fontSize: size.width * .05,
            ),
          ),
          SizedBox(height: size.width * .025),
          Container(
            width: size.width * .8,
            height: size.width * .4,
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).primaryColor,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                'add image',
                style: AppTextStyles.styleWeight500(
                  fontSize: size.width * .04,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          SizedBox(height: size.width * .025),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              MainButton(
                child: Text(
                  "Cancel",
                  style: AppTextStyles.styleWeight400(
                    color: Theme.of(context).primaryColor,
                    fontSize: size.width * .035,
                  ),
                ),
                height: size.width * .1,
                width: size.width * .35,
                color: Colors.white,
                border: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(width: size.width * .1),
              MainButton(
                child: Text(
                  "Upload",
                  style: AppTextStyles.styleWeight400(
                    color: Colors.white,
                    fontSize: size.width * .035,
                  ),
                ),
                height: size.width * .1,
                width: size.width * .35,
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          SizedBox(height: size.width * .05),
        ],
      ),
    );
  }
}
