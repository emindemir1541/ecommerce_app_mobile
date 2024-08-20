import 'package:ecommerce_app_mobile/common/ui/theme/AppSizes.dart';
import 'package:ecommerce_app_mobile/presentation/common/widgets/app_bar_pop_back.dart';
import 'package:ecommerce_app_mobile/presentation/products/bloc/prodcut_screen_bloc.dart';
import 'package:ecommerce_app_mobile/presentation/products/bloc/product_screen_event.dart';
import 'package:ecommerce_app_mobile/presentation/products/bloc/product_screen_state.dart';
import 'package:ecommerce_app_mobile/presentation/search/bloc/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/skeleton/product_skeleton.dart';
import '../../common/widgets/fail_form.dart';
import '../../common/widgets/product_card.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {


  @override
  void deactivate() {
    BlocProvider.of<ProductScreenBloc>(context).add(ClearStateEvent());
    super.deactivate();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarPopBack(),
        body: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              BlocBuilder<ProductScreenBloc, ProductScreenState>(
                  builder: (BuildContext context, ProductScreenState state) => switch (state) {
                        ProductsLoadingState() =>
                          Expanded(child: ListView.builder(itemCount: 6, itemBuilder: (context, index) => const ProductsSkeleton())),
                        ProductsFailState failState => Expanded(
                            child: FailForm(
                                fail: failState.fail,
                                onRefreshTap: () {
                                  BlocProvider.of<ProductScreenBloc>(context).add(GetProductsEvent());
                                }),
                          ),
                        ProductSuccessState _ || ProductScreenState _ => Expanded(
                            child: GridView.builder(
                              itemCount: state.products.length,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.75,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                              ),
                              itemBuilder: (context, index) => ProductCard(
                                product: state.products[index],
                                press: () {
                                  // Navigate to product details page
                                  /*
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ProductDetailsPage(product: state.products[index]),
                                          ),
                                        );
                    */
                                },
                              ),
                            ),
                          ),
                      }),
            ],
          ),
        ));
  }
}
