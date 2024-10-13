import 'package:ecommerce_app_mobile/common/ui/theme/AppStyles.dart';
import 'package:ecommerce_app_mobile/presentation/authentication/pages/sign_up_screen.dart';
import 'package:ecommerce_app_mobile/sddklibrary/helper/ui_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/ui/theme/AppColors.dart';

class WidgetClickableOutlined extends StatelessWidget {
  const WidgetClickableOutlined(
      {super.key,
      this.onPressed,
      required this.child,
      this.shape,
      this.style});

  final Function()? onPressed;
  final Widget child;
  final OutlinedBorder? shape;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    return style == null
        ? OutlinedButton(
            onPressed: onPressed,
            style: context.isDarkMode
                ? AppStyles.clickableWidgetOutlinedStyleDark
                : AppStyles.clickableWidgetOutlinedStyleLight,
            child: child,
          )
        : OutlinedButton(
            onPressed: onPressed,
            style: style,
            child: child,
          );
  }
}
