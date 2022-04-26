import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../app/constants/app_constants.dart';
import '../../widgets/non_cache_image.dart';

class HomeCard extends StatelessWidget {
  final bool loaded;
  const HomeCard({
    Key? key,
    this.loaded = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: VxCard(loaded
              ? const NonCacheNetworkImage(AppConstants.imageUrl)
              : VxBox().color(Colors.blue).make())
          .rounded
          .elevation(10)
          .make(),
    )
        .width(context.percentWidth * 85.0)
        .height(context.percentWidth * 85.0)
        .makeCentered();
  }
}
