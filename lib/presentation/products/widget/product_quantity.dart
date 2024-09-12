import 'package:ecommerce_app_mobile/common/ui/assets/AppImages.dart';
import 'package:ecommerce_app_mobile/common/ui/theme/AppSizes.dart';
import 'package:ecommerce_app_mobile/common/ui/theme/AppText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ProductQuantity extends StatelessWidget {
  const ProductQuantity({
    super.key,
    required this.numOfItem,
    required this.onIncrement,
    required this.onDecrement,
  });

  final int? numOfItem;
  final VoidCallback onIncrement, onDecrement;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppText.productPageQuantity.capitalizeFirstWord,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: AppSizes.defaultPadding),
        Row(
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: OutlinedButton(
                onPressed: onDecrement,
                style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.all(AppSizes.defaultPadding / 2)),
                child: SvgPicture.asset(
                  AppImages.minusIcon,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
            ),
            SizedBox(
              width: 40,
              child: Center(
                child: Text(
                 numOfItem == null ? "?": numOfItem.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(
              height: 40,
              width: 40,
              child: OutlinedButton(
                onPressed: onIncrement,
                style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.all(AppSizes.defaultPadding / 2)),
                child: SvgPicture.asset(
                  AppImages.plusIcon,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
