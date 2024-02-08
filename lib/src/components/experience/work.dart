import 'package:flutter/material.dart';

import '../../../config/consts.dart';
import '../../../generated/assets.gen.dart';
import '../../extensions/context.dart';
import '../../models/work_model.dart';
import 'work_banner.dart';
import 'work_description.dart';

class Work extends StatelessWidget {
  const Work({
    super.key,
    required this.work,
  });

  final WorkModel work;
  final logoSize = 50.0;
  final borderWidth = 1.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(left: logoSize / 2),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: context.colors.primary,
                  width: borderWidth,
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: logoSize / 2 + 5,
                bottom: paddingLarge,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WorkBanner(work: work),
                  Padding(
                    padding: const EdgeInsets.only(top: paddingSmall),
                    child: WorkDescription(work: work),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          width: logoSize,
          height: logoSize,
          decoration: BoxDecoration(
            border: Border.all(
              color: context.colors.primary,
              width: borderWidth,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
            image: DecorationImage(
              image: work.logo?.provider() ?? Assets.logos.building.provider(),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
