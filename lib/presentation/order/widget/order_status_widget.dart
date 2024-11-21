import 'package:ecommerce_app_mobile/common/ui/theme/AppColors.dart';
import 'package:ecommerce_app_mobile/common/ui/theme/AppSizes.dart';
import 'package:ecommerce_app_mobile/common/ui/theme/AppStyles.dart';
import 'package:ecommerce_app_mobile/common/util/cart_util.dart';
import 'package:ecommerce_app_mobile/data/model/purchase_process.dart';
import 'package:ecommerce_app_mobile/presentation/cart/widget/order_summary.dart';
import 'package:ecommerce_app_mobile/presentation/common/widgets/product_card_large.dart';
import 'package:ecommerce_app_mobile/presentation/common/widgets/text_button_default.dart';
import 'package:ecommerce_app_mobile/sddklibrary/helper/date_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/ui/theme/AppText.dart';
import 'order_process_widget.dart';

class OrderStatusWidget extends StatelessWidget {
  const OrderStatusWidget(
      {super.key, required this.purchaseProcess, required this.onCancel});

  final PurchaseProcess purchaseProcess;
  final Function() onCancel;

  @override
  Widget build(BuildContext context) {
    PurchaseSummary purchaseSummary =
        PurchaseSummary(purchaseProcess.selectedProducts);
    return Container(
      decoration: AppStyles.defaultBoxDecoration,
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultPadding),
        child: Column(children: [
          Row(
            children: [
              Text(
                "${AppText.orderPageOrder.capitalizeEveryWord.get}    #${purchaseProcess.id}",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: AppColors.whiteColor60),
              ),
            ],
          ),
          const SizedBox(
            height: AppSizes.spaceBtwVerticalFieldsSmall,
          ),
          Row(children: [
            Text(
                "${AppText.orderPagePlacedOn.capitalizeEveryWord.get}    ${purchaseProcess.processStatusList.firstWhere((element) => element.purchaseStatusType == PurchaseStatusType.payingSuccess).dateTime.formatedDate}",
                style: Theme.of(context).textTheme.titleMedium),
          ]),
          const SizedBox(
            height: AppSizes.spaceBtwVerticalFieldsSmall,
          ),
          const Divider(),
          const SizedBox(
            height: AppSizes.spaceBtwVerticalFields,
          ),
          OrderProgressWidget(purchaseProcess: purchaseProcess),
          const SizedBox(
            height: AppSizes.spaceBtwVerticalFields,
          ),
          Column(
            children:
                List.generate(purchaseProcess.selectedProducts.length, (index) {
              return Padding(
                padding: const EdgeInsets.all(
                    AppSizes.spaceBtwHorizontalFieldsSmall),
                child: Row(
                  children: [
                    Expanded(
                        child: ProductCardLarge(
                            product:
                                purchaseProcess.selectedProducts[index].product,
                            onPressed: () {})),
                  ],
                ),
              );
            }),
          ),
          const SizedBox(
            height: AppSizes.spaceBtwVerticalFieldsSmall,
          ),
          OrderSummaryCard(
            purchaseSummary: purchaseSummary,
          ),
          const SizedBox(
            height: AppSizes.spaceBtwVerticalFieldsSmall,
          ),
          if (purchaseProcess.processStatusList.last.purchaseStatusType ==
                  PurchaseStatusType.payingSuccess ||
              purchaseProcess.processStatusList.last.purchaseStatusType ==
                  PurchaseStatusType.orderTaken)
            Row(
              children: [
                TextButtonDefault(
                  onPressed: onCancel,
                  text: AppText.cancel.capitalizeFirstWord.get,
                  color: AppColors.errorColor,
                ),
              ],
            )
        ]),
      ),
    );
  }
}
