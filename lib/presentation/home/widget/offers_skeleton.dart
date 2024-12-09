import 'package:ecommerce_app_mobile/common/ui/theme/AppSizes.dart';
import 'package:flutter/material.dart';

import '../../common/skeleton/skelton.dart';

class OffersSkeletonScreen extends StatelessWidget {
  const OffersSkeletonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: OffersSkeleton()),
            ],
          ),
          SizedBox(height: AppSizes.spaceBtwVerticalFields),
          Row(
            children: [
              Expanded(child: OffersSkeleton()),
            ],
          ),
          SizedBox(height: AppSizes.spaceBtwVerticalFields),
          Row(
            children: [
              Expanded(child: OffersSkeleton()),
            ],
          ),
        ],
      ),
    );
  }
}

class OffersSkeleton extends StatelessWidget {
  const OffersSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.87,
      child: Stack(
        children: [
          const Skeleton(),
          const Positioned.fill(
            left: AppSizes.defaultPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Skeleton(
                  width: 140,
                  height: 20,
                ),
                SizedBox(height: AppSizes.defaultPadding / 2),
                Skeleton(
                  width: 200,
                  height: 20,
                ),
              ],
            ),
          ),
          Positioned(
            right: AppSizes.defaultPadding,
            bottom: AppSizes.defaultPadding,
            child: Row(
              children: List.generate(
                4,
                (index) => const Padding(
                  padding: EdgeInsets.only(left: AppSizes.defaultPadding / 4),
                  child: CircleSkeleton(size: 8),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
