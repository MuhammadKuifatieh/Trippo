import 'package:flutter/material.dart';
import 'package:trippo/features/plans/presentation/pages/plan_content_screen.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/widgets/cache_image.dart';
import '../../../plans/data/models/plan/plan_model.dart';

class PlanCard extends StatelessWidget {
  const PlanCard({
    Key? key,
    required this.plan,
  }) : super(key: key);

  final PlanModel plan;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          PlanContentScreen.routeName,
          arguments: plan,
        );
      },
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 8,
        ),
        elevation: 3,
        child: SizedBox(
          height: size.width / 2.8,
          child: Row(
            children: [
              if (plan.image != null)
                Expanded(
                  flex: 3,
                  child: CacheImage(
                    height: double.infinity,
                    width: size.width * 0.3,
                    imageUrl: plan.image!.url!,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              const SizedBox(width: 20),
              Expanded(
                flex: 7,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
                  width: size.width * 0.65,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Plan Name:',
                              style: AppTextStyles.styleWeight600(),
                            ),
                            const SizedBox(width: 4),
                            Flexible(
                              child: Text(
                                plan.name,
                                style: AppTextStyles.styleWeight400(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Expanded(
                        flex: 4,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                'Plan Details:',
                                style: AppTextStyles.styleWeight600(),
                              ),
                            ),
                            const SizedBox(width: 4),
                            Flexible(
                              child: Text(
                                plan.description ?? "Description",
                                style: AppTextStyles.styleWeight400(),
                                overflow: TextOverflow.clip,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
