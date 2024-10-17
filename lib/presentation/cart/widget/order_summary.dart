import 'package:ecommerce_app_mobile/common/ui/theme/AppText.dart';
import 'package:ecommerce_app_mobile/data/model/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/ui/theme/AppColors.dart';
import '../../../common/ui/theme/AppSizes.dart';

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({
    super.key,
    this.isReturn = false,
    required this.subtotal,
    required this.shippingFee,
    required this.discount,
    required this.total,
  });

  final bool isReturn;
  final double subtotal;
  final double shippingFee;
  final double discount;
  final double total;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(AppSizes.defaultBorderRadius)),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  AppText.cartPageOrderSummary.capitalizeEveryWord.get,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: AppSizes.spaceBtwVerticalFields),
            _Row(title: AppText.cartPageSubtotal.capitalizeFirstWord.get, amount: subtotal),
            const SizedBox(height: AppSizes.spaceBtwVerticalFieldsSmall),
            _Row(
              title: AppText.cartPageShippingFee.capitalizeEveryWord.get,
              amount: shippingFee,
            ),
            const SizedBox(height: AppSizes.spaceBtwVerticalFieldsSmall),
            _Row(title: AppText.cartPageDiscount.capitalizeFirstWord.get, amount: discount),
            const SizedBox(height: AppSizes.spaceBtwVerticalFieldsSmall),
            const Divider(),
            const SizedBox(height: AppSizes.spaceBtwVerticalFieldsSmall),
            _Row(title: AppText.cartPageTotal.capitalizeFirstWord.get, amount: total),
          ],
        ),
      ),
    );
  }
}

class _Row extends StatelessWidget {
  final String title;
  final double amount;

  const _Row({
    super.key,
    required this.title,
   required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16),
        ),
        amount == 0.0
            ? Text(
                AppText.cartPageFree.capitalizeFirstWord.get,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.successColor),
              )
            : Text(
                "\$$amount",
                style: Theme.of(context).textTheme.titleMedium,
              )
      ],
    );
  }
}
