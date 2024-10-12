import 'package:ecommerce_app_mobile/common/constant/app_durations.dart';
import 'package:ecommerce_app_mobile/common/ui/assets/AppImages.dart';
import 'package:ecommerce_app_mobile/common/ui/theme/AppColors.dart';
import 'package:ecommerce_app_mobile/common/ui/theme/AppSizes.dart';
import 'package:ecommerce_app_mobile/common/ui/theme/AppText.dart';
import 'package:ecommerce_app_mobile/presentation/common/widgets/ButtonPrimary.dart';
import 'package:ecommerce_app_mobile/presentation/common/widgets/button_secondary.dart';
import 'package:ecommerce_app_mobile/common/ui/theme/color_filters.dart';
import 'package:ecommerce_app_mobile/presentation/common/widgets/text_button_default.dart';
import 'package:ecommerce_app_mobile/sddklibrary/helper/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/constant/Screens.dart';
import '../../home/bloc/home_bloc.dart';
import '../../home/bloc/home_event.dart';
import '../../main/bloc/main_blocs.dart';
import '../../main/bloc/main_events.dart';
import '../../search/bloc/search_bloc.dart';
import '../../search/bloc/search_event.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    FlutterNativeSplash.remove();
    BlocProvider.of<MainBlocs>(context).add(GetInitItemsEvent());
    BlocProvider.of<HomeBloc>(context).add(GetProductsHomeEvent());
    BlocProvider.of<SearchBloc>(context).add(GetRecentSearchesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: pageController,
          children: [
            _Page(
                title: AppText.welcomePageOneTitle.capitalizeEveryWord,
                content: AppText.welcomePageOneContent.capitalizeFirstWord,
                image: AppImages.shoppingBags,
                buttonOneText: AppText.commonNext.capitalizeFirstWord,
                onButtonOneTap: () {
                  pageController.animateToPage(
                    pageController.page!.toInt() + 1,
                    duration: AppDurations.splashAnimation,
                    curve: Curves.easeInOut,
                  );
                }),
            _Page(
                title: AppText.welcomePageTwoTitle.capitalizeEveryWord,
                content: AppText.welcomePageTwoContent.capitalizeFirstWord,
                image: AppImages.windowShopping,
                buttonOneText: AppText.commonNext.capitalizeFirstWord,
                onButtonOneTap: () {
                  pageController.animateToPage(
                    pageController.page!.toInt() + 1,
                    duration: AppDurations.splashAnimation,
                    curve: Curves.easeInOut,
                  );
                }),
            _Page(
              title: AppText.welcomePageThreeTitle.capitalizeEveryWord,
              content: AppText.welcomePageThreeContent.capitalizeFirstWord,
              image: AppImages.signIn,
              buttonOneText: AppText.signIn.capitalizeEveryWord,
              buttonTwoText: AppText.signUp.capitalizeEveryWord,
              onButtonOneTap: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    Screens.signInScreen, (route) => false);
              },
              onButtonTwoTap: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    Screens.signUpScreen, (route) => false);
              },
              onSkipButton: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    Screens.mainScreen, (route) => false);
              },
            ),
          ],
        ),
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
  final Function()? onSkipButton;

  const _Page({
    required this.title,
    required this.content,
    required this.image,
    required this.buttonOneText,
    required this.onButtonOneTap,
    this.buttonTwoText,
    this.onButtonTwoTap,
    this.onSkipButton,
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
            child: SvgPicture.asset(image,
                colorFilter: ColorFilters.pinkToPrimaryColor(context)),
          ),
          Column(
            children: [
              Text(title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(
                height: 12,
              ),
              Text(
                content,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: AppColors.greyColor),
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
                    ButtonSecondary(
                      text: buttonTwoText!,
                      onTap: onButtonTwoTap,
                    ),
                    const SizedBox(
                      height: AppSizes.spaceBtwVerticalFields,
                    ),
                    if (onSkipButton != null)
                      SizedBox(
                        width: 400,
                        height: 50,
                        child: TextButtonDefault(
                            onPressed: onSkipButton!,
                            text: AppText.commonSkip.capitalizeFirstWord),
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
