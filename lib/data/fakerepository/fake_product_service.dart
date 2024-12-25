import 'dart:math';

import 'package:ecommerce_app_mobile/data/fakerepository/fake_models.dart';
import 'package:ecommerce_app_mobile/data/model/address.dart';
import 'package:ecommerce_app_mobile/data/model/cart_item.dart';
import 'package:ecommerce_app_mobile/data/model/category.dart';
import 'package:ecommerce_app_mobile/data/model/order_process.dart';
import 'package:ecommerce_app_mobile/data/model/product.dart';
import 'package:ecommerce_app_mobile/data/model/product_details_item.dart';
import 'package:ecommerce_app_mobile/data/model/product_feature.dart';
import 'package:ecommerce_app_mobile/data/model/recent_search.dart';
import 'package:ecommerce_app_mobile/data/model/return_process.dart';
import 'package:ecommerce_app_mobile/data/service/product_service.dart';
import 'package:ecommerce_app_mobile/presentation/address/bloc/add_address_state.dart';
import 'package:ecommerce_app_mobile/presentation/products/bloc/order_state.dart';
import 'package:ecommerce_app_mobile/presentation/return/bloc/return_state.dart';
import 'package:ecommerce_app_mobile/sddklibrary/util/fail.dart';
import 'package:ecommerce_app_mobile/sddklibrary/util/resource.dart';

import '../../presentation/products/bloc/product_details_state.dart';
import '../../presentation/products/bloc/review_state.dart';
import '../model/Reviews.dart';
import '../model/tag.dart';

class FakeProductService implements ProductService {
  Random random = Random();

  @override
  Future<ResourceStatus<List<Category>>> getCategories() async {
    List<Category> categories = [
      FakeProductModels.category1,
      FakeProductModels.category2,
      FakeProductModels.category3,
      FakeProductModels.category4,
      FakeProductModels.category21,
      FakeProductModels.category22,
      FakeProductModels.category23,
      FakeProductModels.category231
    ];

    return ResourceStatus.success(FakeProductModelsNew.categoriesUnsorted);
    // return ResourceStatus.fail(Fail(userMessage: "Fake product service fail situation"));

    return random.nextBool()
        ? ResourceStatus.success(categories)
        : ResourceStatus.fail(Fail(userMessage: "Fake product service fail situation"));
  }

  @override
  Future<ResourceStatus<Product>> getProductsById(String id) async {
    return ResourceStatus.success(FakeProductModelsNew.productSlimFitJeans);
    return random.nextBool()
        ? ResourceStatus.success(FakeProductModels.product1)
        : ResourceStatus.fail(Fail(userMessage: "Fake product service fail situation"));
  }

  @override
  Future<ResourceStatus<AllProductFeatures>> getProductFeatures() async {
    return ResourceStatus.success(FakeProductModelsNew.productFeatureList);
    return random.nextBool()
        ? ResourceStatus.success(FakeProductModels.allProductFeatures)
        : ResourceStatus.fail(Fail(userMessage: "Fake product service fail situation"));
  }

  @override
  Future<ResourceStatus<List<Product>>> getProductsBySearchEvents(
      {String? searchText,
      List<ProductFeatureOption>? selectedFeatureOptions,
      List<Category>? selectedCategories,
      List<Tag>? selectedTags}) async {
    // return ResourceStatus.success([]);
    await Future.delayed(const Duration(seconds: 1));

    return ResourceStatus.success(FakeProductModelsNew.products);
    // return ResourceStatus.fail(Fail(userMessage: "Fake product service fail situation"));

    return random.nextBool()
        ? ResourceStatus.success(FakeProductModels.products)
        : ResourceStatus.fail(Fail(userMessage: "Fake product service fail situation"));
  }

  @override
  Future<ResourceStatus<RecentSearch>> addRecentSearch(String recentSearch) async {
    return ResourceStatus.success(RecentSearch(random.nextDouble().toString(), "", recentSearch));
  }

  @override
  Future<ResourceStatus> clearAllRecentSearch() async {
    return const ResourceStatus.success("");
    return random.nextBool()
        ? const ResourceStatus.success("")
        : ResourceStatus.fail(Fail(userMessage: "Fake product service fail situation"));
  }

  @override
  Future<ResourceStatus> clearRecentSearch(RecentSearch recentSearchList) async {
    return const ResourceStatus.success("");
    return random.nextBool()
        ? const ResourceStatus.success("")
        : ResourceStatus.fail(Fail(userMessage: "Fake product service fail situation"));
  }

  @override
  Future<ResourceStatus<List<RecentSearch>>> getRecentSearches() async {
    return ResourceStatus.success(FakeProductModelsNew.recentSearches);
    return random.nextBool()
        ? ResourceStatus.success(FakeProductModels.recentSearches)
        : ResourceStatus.fail(Fail(userMessage: "Fake product service fail situation"));
  }

  @override
  Future<ResourceStatus<List<Product>>> getProductByDiscount(int count) async {
    final List<Product> products =
        FakeProductModelsNew.products.where((product) => product.subProducts.getIdealSubProduct.hasDiscount).toList();
    return ResourceStatus.success(products);
  }

  @override
  Future<ResourceStatus<List<Product>>> getProductByBestSeller(int count) async {
    return ResourceStatus.success(FakeProductModelsNew.products);
  }

  @override
  Future<ResourceStatus<List<Product>>> getProductByLastAdded(int count) async {
    return ResourceStatus.success(FakeProductModelsNew.products);
  }

  @override
  Future<ResourceStatus<Reviews>> getReviews(String productId) async {
    return ResourceStatus.success(switch (random.nextInt(2)) {
      0 => FakeProductModels.reviews1(productId),
      1 => FakeProductModels.reviews2(productId),
      2 => FakeProductModels.reviews3(productId),
      int() => FakeProductModels.reviews3(productId),
    });
  }

  @override
  Future<ResourceStatus<List<Product>>> getYouMayAlsoLike(String categoryId) async {
    return ResourceStatus.success(FakeProductModelsNew.products.where((product) => product.categoryId == categoryId).toList());
  }

  @override
  Future<ResourceStatus<List<ProductDetailsItem>>> getProductDetails(String productId) async {
    final Product product = FakeProductModelsNew.products.firstWhere((product) => product.id == productId);

    return ResourceStatus.success(product.productDetails);
  }

  @override
  Future<ResourceStatus> addReview(ReviewState reviewState) async {
    return const ResourceStatus.success("");
  }

  @override
  Future<ResourceStatus> addOrder(OrderState purchaseProcess, String uid) async {
    return const ResourceStatus.success("");
  }

  @override
  Future<ResourceStatus<List<CartItem>>> getCart(String uid) async {
    final cartItems = FakeProductModelsNew.cartItems.where((element) => element.productWithQuantity.subProduct.availableInStock).toList();
    return ResourceStatus.success(cartItems);
  }

  @override
  Future<ResourceStatus> updateCartItem(CartItem cartItem) async {
    return const ResourceStatus.success("");
  }

  @override
  Future<ResourceStatus> deleteCartItem(String cartItemId) async {
    return const ResourceStatus.success("");
  }

  @override
  Future<ResourceStatus> addAddress(AddressState addressState) async {
    return const ResourceStatus.success("");
  }

  @override
  Future<ResourceStatus<List<Address>>> getAddresses(String uid) async {
    return ResourceStatus.success(FakeProductModels.addresses);
  }

  @override
  Future<ResourceStatus> removeAddress(AddressState addressState) async {
    return const ResourceStatus.success("");
    return ResourceStatus.fail(
      Fail(userMessage: "Fake product service fail situation"),
    );
    return const ResourceStatus.success("");
  }

  @override
  Future<ResourceStatus<List<Address>>> selectAddress(AddressState selectedAddress, String uid) async {
    final List<Address> newAddressList = [];
    for (var address in FakeProductModels.addresses) {
      if (selectedAddress.id == address.id) {
        newAddressList.add(address.copyWith(isSelected: true));
      } else {
        newAddressList.add(address.copyWith(isSelected: false));
      }
    }
    return ResourceStatus.success(newAddressList);
  }

  @override
  Future<ResourceStatus<Address>> getSelectedAddress(String uid) async {
    return ResourceStatus.success(FakeProductModels.addresses[0]);
  }

  @override
  Future<ResourceStatus> addToCart(CartItemState cartItemState, String uid) async {
    return const ResourceStatus.success("");
  }

  @override
  Future<ResourceStatus<List<OrderModel>>> getOrderList(String uid) async {
    return ResourceStatus.success([
      FakeProductModelsNew.orderPaidSuccess,
      FakeProductModelsNew.orderDeliveredSuccess,
      FakeProductModelsNew.orderPaidCanceled,
      FakeProductModelsNew.orderShippedSuccess,
      FakeProductModelsNew.orderTakenSuccess,
    ]);
  }

  @override
  Future<ResourceStatus> cancelOrder(OrderModel order) async {
    return const ResourceStatus.success("");
  }

  @override
  Future<ResourceStatus> addReturn(ReturnState returnProcess, String uid) async {
    return const ResourceStatus.success("");
  }

  @override
  Future<ResourceStatus> updateReturnProcess(ReturnModel returnProcess) async {
    return const ResourceStatus.success("");
  }

  @override
  Future<ResourceStatus<List<ReturnModel>>> getReturnProcessList(String uid) async {
    bool random = Random().nextBool();
    return ResourceStatus.success([
      random
          ? FakeProductModelsNew.returnProcessSuccess
          : FakeProductModelsNew.returnProcessSuccess.cancelReturn("canceled") ?? FakeProductModelsNew.returnProcessSuccess,
      random
          ? FakeProductModelsNew.returnProcessRejected
          : FakeProductModelsNew.returnProcessRejected.cancelReturn("canceled") ?? FakeProductModelsNew.returnProcessRejected,
      random
          ? FakeProductModelsNew.returnProcessCanceledByCustomer
          : FakeProductModelsNew.returnProcessCanceledByCustomer.cancelReturn("canceled") ?? FakeProductModelsNew.returnProcessCanceledByCustomer
    ]);
  }

  @override
  Future<ResourceStatus> getActiveReturnOfOrder(String orderId) async {
    return ResourceStatus.success(
        FakeProductModelsNew.returnProcessSuccess.orderId == orderId ? FakeProductModelsNew.returnProcessSuccess : null);
  }
}
