import 'package:flutter/material.dart';
class ClickableWidget extends StatelessWidget {
  final Function() onPressed;
  final Widget child;
  const ClickableWidget({super.key, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed,style:TextButton.styleFrom(
      side: BorderSide.none,
     padding: EdgeInsets.zero,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero
      )

    ) , child: child,);
  }
}
