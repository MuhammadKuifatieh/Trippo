import 'package:flutter/material.dart';
import 'package:trippo/core/widgets/main_button.dart';
import 'package:trippo/features/profile/presentation/widgets/host_request_sheet.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/config/global_functions.dart';
import '../../../../core/constants/images/svg_images.dart';
import '../../../../core/widgets/asset_svg.dart';

class HostInfoScreen extends StatelessWidget {
  const HostInfoScreen({Key? key}) : super(key: key);

  static const routeName = '/host-info';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Host Information',
          style: AppTextStyles.styleWeight600(
            color: Theme.of(context).primaryColor,
            fontSize: 18,
          ).copyWith(height: 1),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: AssetSvg(
              GlobalFunctions().isRTLDirectionality(context)
                  ? SvgImages.arrowForward
                  : SvgImages.arrowBackward,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'The host is a user that authorized to post a tourist experience (has a company or an office that makes journeys).',
              style: AppTextStyles.styleWeight500(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'If you want to became a host you have to send a transform request and the admins will see if you are authorized or not to become one.',
              style: AppTextStyles.styleWeight500(
                fontSize: 12,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: MainButton(
                child: Text(
                  'Transform Request',
                  style: AppTextStyles.styleWeight500(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                height: 50,
                width: 200,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    builder: (context) {
                      return HostRequestSheet();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
