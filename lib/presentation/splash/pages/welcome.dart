import 'package:ecommerce_app_mobile/common/ui/assets/AppImages.dart';
import 'package:ecommerce_app_mobile/common/ui/theme/AppSizes.dart';
import 'package:ecommerce_app_mobile/common/ui/theme/AppText.dart';
import 'package:ecommerce_app_mobile/presentation/common/widgets/ButtonPrimary.dart';
import 'package:ecommerce_app_mobile/sddklibrary/helper/Log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/constant/Screens.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          _Page(
              title: AppText.welcomePageOneTitle,
              content: AppText.welcomePageOneContent,
              image: AppImages.shoppingBags,
              buttonOneText: AppText.commonNext,
              onButtonOneTap: () {
                pageController.animateToPage(
                  pageController.page!.toInt() + 1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }),
          _Page(
              title: AppText.welcomePageTwoTitle,
              content: AppText.welcomePageTwoContent,
              image: AppImages.windowShopping,
              buttonOneText: AppText.commonNext,
              onButtonOneTap: () {
                Log.test("page test");
                pageController.animateToPage(
                  pageController.page!.toInt() + 1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }),
          _Page(
            title: AppText.welcomePageThreeTitle,
            content: AppText.welcomePageThreeContent,
            image: AppImages.signIn,
            buttonOneText: AppText.signIn,
            buttonTwoText: AppText.signUp,
            onButtonOneTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(Screens.signInScreen, (route) => false);
            },
            onButtonTwoTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(Screens.signUpScreen, (route) => false);
            },
          ),
        ],
      ),
    );
  }
}

class _Page extends StatelessWidget {
  final String title;
  final String content;
  final String image;
  final String buttonOneText;
  final String? buttonTwoText;
  final Function() onButtonOneTap;
  final Function()? onButtonTwoTap;

  const _Page({
    required this.title,
    required this.content,
    required this.image,
    required this.buttonOneText,
    required this.onButtonOneTap,
    this.buttonTwoText,
    this.onButtonTwoTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.defaultSpace),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 300,
            height: 300,
            child: SvgPicture.asset(image),
          ),
          Column(
            children: [
              Text(title, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineMedium),
              Text(
                content,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          buttonTwoText != null
              ? Column(
                  children: [
                    ButtonPrimary(
                      text: buttonOneText,
                      onTap: onButtonOneTap,
                    ),
                    const SizedBox(
                      height: AppSizes.spaceBtwVerticalFields,
                    ),
                    ButtonPrimary(
                      text: buttonTwoText!,
                      onTap: onButtonTwoTap,
                      primaryDecoration: false,
                    )
                  ],
                )
              : ButtonPrimary(
                  text: buttonOneText,
                  onTap: onButtonOneTap,
                ),
        ],
      ),
    );
  }
}
