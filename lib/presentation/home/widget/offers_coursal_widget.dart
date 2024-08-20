import 'dart:async';

import 'package:ecommerce_app_mobile/common/constant/Screens.dart';
import 'package:ecommerce_app_mobile/common/ui/theme/AppSizes.dart';
import 'package:ecommerce_app_mobile/common/ui/theme/AppText.dart';
import 'package:ecommerce_app_mobile/data/fakerepository/fake_models.dart';
import 'package:ecommerce_app_mobile/data/model/banner.dart';
import 'package:ecommerce_app_mobile/presentation/home/widget/offers_skeleton.dart';
import 'package:ecommerce_app_mobile/presentation/products/bloc/prodcut_screen_bloc.dart';
import 'package:ecommerce_app_mobile/presentation/products/bloc/product_screen_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'categories_widget.dart';
import 'dot_indicators.dart';

class OffersCarouselAndCategories extends StatelessWidget {
  final List<BannerModel> bannerList;
  final bool isLoading;

  const OffersCarouselAndCategories({
    super.key,
    required this.bannerList,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isLoading
            ? const OffersSkeleton()
            : OffersCarousel(
                bannerList: bannerList,
              ),
        const SizedBox(height: AppSizes.spaceBtwVerticalFields),
        Padding(
          padding: const EdgeInsets.all(AppSizes.defaultPadding),
          child: Text(
            AppText.commonPageCategories,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        CategoriesWidget(
          categoriesByLayer: FakeProductModels.categories,
        ),
      ],
    );
  }
}

class OffersCarousel extends StatefulWidget {
  final List<BannerModel> bannerList;

  const OffersCarousel({
    super.key,
    required this.bannerList,
  });

  @override
  State<OffersCarousel> createState() => _OffersCarouselState();
}

class _OffersCarouselState extends State<OffersCarousel> {
  int _selectedIndex = 0;
  late PageController _pageController;
  late Timer _timer;

  // Offers List

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (_selectedIndex < widget.bannerList.length - 1) {
        _selectedIndex++;
      } else {
        _selectedIndex = 0;
      }

      _pageController.animateToPage(
        _selectedIndex,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutCubic,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.87,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.bannerList.length,
            onPageChanged: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            itemBuilder: (context, index) => widget.bannerList[index].bannerWidget(
              (banner) {
                BlocProvider.of<ProductScreenBloc>(context).add(AddTagEvent([banner.tag]));
                BlocProvider.of<ProductScreenBloc>(context).add(GetProductsEvent());
                Navigator.of(context).pushNamed(Screens.productScreen);
              },
            ),
          ),
          FittedBox(
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.defaultPadding),
              child: SizedBox(
                height: 16,
                child: Row(
                  children: List.generate(
                    widget.bannerList.length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: AppSizes.defaultPadding / 4),
                        child: DotIndicator(
                          isActive: index == _selectedIndex,
                          activeColor: Colors.white70,
                          inActiveColor: Colors.white54,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
