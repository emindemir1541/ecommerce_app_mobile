
import 'package:ecommerce_app_mobile/common/ui/assets/AppImages.dart';
import 'package:ecommerce_app_mobile/common/ui/theme/AppSizes.dart';
import 'package:ecommerce_app_mobile/common/ui/theme/AppText.dart';
import 'package:ecommerce_app_mobile/data/usecase/payment_validation.dart';
import 'package:ecommerce_app_mobile/presentation/address/pages/addresses_screen.dart';
import 'package:ecommerce_app_mobile/presentation/address/widgets/address_card.dart';
import 'package:ecommerce_app_mobile/presentation/cart/bloc/cart_bloc.dart';
import 'package:ecommerce_app_mobile/presentation/cart/bloc/cart_event.dart';
import 'package:ecommerce_app_mobile/presentation/cart/bloc/cart_state.dart';
import 'package:ecommerce_app_mobile/presentation/cart/page/payment_correction.dart';
import 'package:ecommerce_app_mobile/presentation/cart/widget/order_summary.dart';
import 'package:ecommerce_app_mobile/presentation/common/widgets/ButtonPrimary.dart';
import 'package:ecommerce_app_mobile/presentation/common/widgets/app_bar_pop_back.dart';
import 'package:ecommerce_app_mobile/presentation/products/widget/text_field_default.dart';
import 'package:ecommerce_app_mobile/sddklibrary/helper/string_helper.dart';
import 'package:ecommerce_app_mobile/sddklibrary/ui/dialog_util.dart';
import 'package:ecommerce_app_mobile/sddklibrary/ui/widget_clickable_outlined.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/ui/theme/AppStyles.dart';
import '../../../common/ui/theme/color_filters.dart';
import '../../../data/model/user.dart';


class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key, required this.user});

  final User user;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final TextEditingController cardDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (BuildContext context, CartState state) => Scaffold(
        appBar: AppBarPopBack(
          title: AppText.paymentPageCompletePayment.capitalizeEveryWord.get,
        ),
        body: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultPadding),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _Title(title: AppText.addressesPageAddresses.capitalizeEveryWord.get),
                const SizedBox(height: AppSizes.spaceBtwVerticalFields),
                if (state.selectedAddress != null)
                  Row(
                    children: [
                      Expanded(
                        child: AddressCard(
                          address: state.selectedAddress!,
                          isSelected: false,
                          onSelected: () {},
                        ),
                      ),
                    ],
                  ),
                ClickableWidgetOutlined(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddressesScreen(
                                user: widget.user,
                                onSelected: (address) {
                                  BlocProvider.of<CartBloc>(context).add(SelectAddress(address: address));
                                },
                              )));
                    },
                    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      SvgPicture.asset(state.selectedAddress == null ? AppImages.plusIcon : AppImages.editIcon,
                          colorFilter: ColorFilters.greyIconColorFilter(context)),
                      const SizedBox(width: AppSizes.spaceBtwHorizontalFields),
                      Text(
                        state.selectedAddress == null
                            ? AppText.paymentPageSelectAddress.capitalizeEveryWord.get
                            : AppText.paymentPageChangeAddress.capitalizeEveryWord.get,
                      ),
                    ])),
                const SizedBox(height: AppSizes.spaceBtwVerticalFieldsLarge),
                _Title(
                  title: AppText.paymentPagePaymentMethod.capitalizeEveryWord.get,
                ),
                const SizedBox(height: AppSizes.spaceBtwVerticalFields),
                Container(
                  padding: const EdgeInsets.all(AppSizes.defaultPadding),
                  decoration: AppStyles.defaultBoxDecoration,
                  child: Column(
                    children: [
                      Row(children: [
                        Flexible(
                          child: TextFieldDefault(
                              maxLength: 40,
                              onChanged: (text) {
                                BlocProvider.of<CartBloc>(context).add(NameSurnameEvent(nameSurname: text));
                              },
                              enableLabel: true,
                              labelOrHint: AppText.name.addSpace.combine(AppText.surname).capitalizeEveryWord.get),
                        ),
                      ]),
                      const SizedBox(height: AppSizes.spaceBtwVerticalFields),
                      Row(children: [
                        Flexible(
                          child: TextFieldDefault(
                              isNumber: true,
                              inputFormatters: [MaskedInputFormatter('#### #### #### ####')],
                              onChanged: (text) {
                                BlocProvider.of<CartBloc>(context).add(CardNumberEvent(cardNumber: text));
                              },
                              enableLabel: true,
                              labelOrHint: AppText.paymentPageCardNumber.capitalizeEveryWord.get),
                        ),
                      ]),
                      const SizedBox(height: AppSizes.spaceBtwVerticalFields),
                      Row(children: [
                        Flexible(
                          child: TextFieldDefault(
                              onChanged: (text) {
                                BlocProvider.of<CartBloc>(context).add(CvvEvent(cvv: text));
                              },
                              maxLength: 3,
                              enableLabel: true,
                              isNumber: true,
                              labelOrHint: AppText.paymentPageCvcCvv.capitalizeEveryWord.get),
                        ),
                        const SizedBox(width: AppSizes.spaceBtwHorizontalFieldsLarge),
                        Flexible(
                          child: TextFieldDefault(
                              onChanged: (text) {
                                if (text.length == 1 && text.toInt > 1) {
                                  cardDateController.text = "0$text";
                                }
                                if (text.isNotEmpty && text.length < 3 && text.toInt > 12) {
                                  cardDateController.text = text.removeLast();
                                }
                                BlocProvider.of<CartBloc>(context).add(ExpirationDateEvent(expirationDate: text));
                              },
                              isNumber: true,
                              controller: cardDateController,
                              inputFormatters: [
                                MaskedInputFormatter(
                                  '##/##',
                                )
                              ],
                              enableLabel: true,
                              labelOrHint: AppText.paymentPageExpiryDate.capitalizeEveryWord.get),
                        ),
                      ]),
                    ],
                  ),
                ),
                const SizedBox(height: AppSizes.spaceBtwVerticalFieldsLarge),
                _Title(
                  title: AppText.cartPageOrderSummary.capitalizeEveryWord.get,
                ),
                const SizedBox(height: AppSizes.spaceBtwVerticalFields),
                OrderSummaryCard(
                  purchaseSummary: state.purchaseSummary,
                 isReturn: false,
                  showOrderSummaryLabel: false,
                ),
                const SizedBox(height: AppSizes.spaceBtwVerticalFieldsLarge),
                ButtonPrimary(
                  text: AppText.paymentPagePay.capitalizeEveryWord.get,
                  onTap: () {
                    final dialogUtil = DialogUtil(context);
                    final validationResult = PaymentValidation.validate(state);
                    if (!validationResult.success) {
                      dialogUtil.info(AppText.errorCouldNotValidate.capitalizeEveryWord.get, validationResult.message);
                    } else {
                      //todo: start purchase processes
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => const PaymentCorrectionScreen()));
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
    ;
  }
}
