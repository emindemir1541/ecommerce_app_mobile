import 'package:ecommerce_app_mobile/common/constant/app_durations.dart';
import 'package:ecommerce_app_mobile/common/ui/assets/AppImages.dart';
import 'package:ecommerce_app_mobile/common/ui/theme/AppColors.dart';
import 'package:ecommerce_app_mobile/common/ui/theme/AppSizes.dart';
import 'package:ecommerce_app_mobile/common/ui/theme/AppText.dart';
import 'package:ecommerce_app_mobile/data/database/app_database.dart';
import 'package:ecommerce_app_mobile/presentation/common/widgets/ButtonPrimary.dart';
import 'package:ecommerce_app_mobile/presentation/common/widgets/button_secondary.dart';
import 'package:ecommerce_app_mobile/common/ui/theme/color_filters.dart';
import 'package:ecommerce_app_mobile/presentation/common/widgets/text_button_default.dart';
import 'package:ecommerce_app_mobile/sddklibrary/util/Log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
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
  void initState() {
    FlutterNativeSplash.remove();
    hideWelcomeScreen();
    Log.test(data: "Welcome Screen");
/*
    BlocProvider.of<MainBlocs>(context).add(GetInitItemsEvent());
    BlocProvider.of<HomeBloc>(context).add(GetProductsHomeEvent());
    BlocProvider.of<SearchBloc>(context).add(GetRecentSearchesEvent());
*/
    super.initState();
  }

  Future<void> hideWelcomeScreen() async {
    AppDatabase appDatabase = await AppDatabase.create();
    await appDatabase.hideWelcomeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: pageController,
          children: [
            _Page(
                title: AppText.welcomePageOneTitle.capitalizeEveryWord.get,
                content: AppText.welcomePageOneContent.capitalizeFirstWord.get,
                image: AppImages.shoppingBags,
                buttonOneText: AppText.commonNext.capitalizeFirstWord.get,
                onButtonOneTap: () {
                  pageController.animateToPage(
                    pageController.page!.toInt() + 1,
                    duration: AppDurations.splashAnimation,
                    curve: Curves.easeInOut,
                  );
                }),
            _Page(
                title: AppText.welcomePageTwoTitle.capitalizeEveryWord.get,
                content: AppText.welcomePageTwoContent.capitalizeFirstWord.get,
                image: AppImages.windowShopping,
                buttonOneText: AppText.commonNext.capitalizeFirstWord.get,
                onButtonOneTap: () {
                  pageController.animateToPage(
                    pageController.page!.toInt() + 1,
                    duration: AppDurations.splashAnimation,
                    curve: Curves.easeInOut,
                  );
                }),
            _Page(
              title: AppText.welcomePageThreeTitle.capitalizeEveryWord.get,
              content: AppText.welcomePageThreeContent.capitalizeFirstWord.get,
              image: AppImages.signIn,
              buttonOneText: AppText.signIn.capitalizeEveryWord.get,
              buttonTwoText: AppText.signUp.capitalizeEveryWord.get,
              onButtonOneTap: () {
                Navigator.of(context).pushNamed(
                  Screens.signInScreen,
                );
              },
              onButtonTwoTap: () {
                Navigator.of(context).pushNamed(Screens.signUpScreen);
              },
              onSkipButton: () {
                Navigator.of(context).pushNamedAndRemoveUntil(Screens.mainScreen, (route) => false);
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
            child: SvgPicture.asset(image, colorFilter: ColorFilters.pinkToPrimaryColor(context)),
          ),
          Column(
            children: [
              Text(title, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(
                height: 12,
              ),
              Text(
                content,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.greyColor),
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
                        child: TextButtonDefault(onPressed: onSkipButton!, text: AppText.commonSkip.capitalizeFirstWord.get),
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
