import 'package:ecommerce_app_mobile/common/constant/currency.dart';
import 'package:ecommerce_app_mobile/common/ui/assets/AppImages.dart';
import 'package:ecommerce_app_mobile/data/model/address.dart';
import 'package:ecommerce_app_mobile/data/model/banner.dart';
import 'package:ecommerce_app_mobile/data/model/cart_item.dart';
import 'package:ecommerce_app_mobile/data/model/categories.dart';
import 'package:ecommerce_app_mobile/data/model/money.dart';
import 'package:ecommerce_app_mobile/data/model/product.dart';
import 'package:ecommerce_app_mobile/data/model/product_details_item.dart';
import 'package:ecommerce_app_mobile/data/model/product_feature.dart';
import 'package:ecommerce_app_mobile/data/model/order_process.dart';
import 'package:ecommerce_app_mobile/data/model/purchase_process.dart';
import 'package:ecommerce_app_mobile/data/model/recent_search.dart';
import 'package:ecommerce_app_mobile/data/model/return_process.dart';
import 'package:ecommerce_app_mobile/data/model/review.dart';
import 'package:ecommerce_app_mobile/data/model/user.dart';
import 'package:ecommerce_app_mobile/presentation/home/constant/banner_style.dart';
import 'package:flutter/material.dart';

import '../../common/constant/gender.dart';
import '../model/Reviews.dart';
import '../model/category.dart';
import '../model/tag.dart';

class FakeUserModels {
/*
  static UserRequestState emin = UserRequestState(
      name: "emin",
      surname: "demir",
      gender: Gender.man,
      birthYear: "2001",
      passwordConfirm: "testpassword",
      email: "emindemir1541@proton.me",
      password: "testpassword");
*/
  static User someUser = User.test(
    "uid",
    "Mustafa",
    "Salıveren",
    "mustafa@mail.com",
    2000,
    Gender.man,
  );
/*
  static UserRequestState test = UserRequestState(
    name: "test",
    surname: "test",
    email: "test",
    password: "test", birthYear: '', gender: null,
  );
  static UserRequestState admin = UserRequestState(
    name: "admin",
    surname: "admin",
    email: "admin@mail.com",
    password: "adminTest",
  );
  static UserRequestState testValidUser = UserRequestState(
    name: "admin",
    surname: "admin",
    email: "admin@mail.com",
    password: "adminTest",
  );
*/
}

class FakeMapModels {}

class FakeProductModels {
  static Category category1 =
      Category(id: "0", name: "Elbiseler", superId: "", layer: 0);
  static Category category2 =
      Category(id: "1", name: "Ayakkabılar", superId: "", layer: 0);
  static Category category21 =
      Category(id: "12", name: "Sandalet", superId: "1", layer: 1);
  static Category category22 =
      Category(id: "13", name: "Kundura", superId: "1", layer: 1);
  static Category category23 =
      Category(id: "14", name: "Bot", superId: "1", layer: 1);
  static Category category231 =
      Category(id: "15", name: "Deri Bot", superId: "14", layer: 2);
  static Category category3 =
      Category(id: "2", name: "Bileklikler", superId: "", layer: 0);
  static Category category4 =
      Category(id: "3", name: "Pantolonlar", superId: "", layer: 0);
  static Category category5  = Category(id: "4", name: "Armalar", superId: "", layer: 0);
  // static Category category51  = Category(id: "41", name: "Güneş gözlikleri", superId: "4", layer: 1);

  static List<Category> categoriesUnSorted = [
    category5,
    category1,
    category2,
    category21,
    category22,
    category23,
    category231,
    category3,
    category4
  ];

  static CartItem cartItem1 = CartItem(
      id: "0",
      productWithQuantity: ProductWithQuantity(
          product: product1, subProduct: subProduct1, quantity: 2));
  static CartItem cartItem2 = CartItem(
      id: "1",
      productWithQuantity: ProductWithQuantity(
          product: product2, subProduct: subProduct2, quantity: 1));
  static CartItem cartItem3 = CartItem(
      id: "2",
      productWithQuantity: ProductWithQuantity(
          product: product3, subProduct: subProduct2, quantity: 3));
  static CartItem cartItem4 = CartItem(
      id: "3",
      productWithQuantity: ProductWithQuantity(
          product: product4, subProduct: subProduct2, quantity: 4));

  static List<CartItem> cartItems = [
    cartItem1,
    cartItem2,
    cartItem3,
    cartItem4,
  ];

  static final addresses = [address1, address2, address3];
  static final address1 = Address(
      addressName: "Home",
      id: "1",
      uid: "3248543",
      phoneNo: 2334323452,
      street: "123 Main St",
      area: "Downtown",
      streetNo: "A-203",
      floor: 2,
      doorNo: "5B",
      city: "Los Angeles",
      country: "USA",
      postCode: "90210",
      latitude: 34.052235,
      longitude: -118.243683,
      openAddress: "123 Main St, A-203, 2nd Floor, Los Angeles, CA",
      userNote: "Leave the package at the front desk if no one answers.",
      state: 'state',
      isSelected: false);

// Example Address 2
  static final address2 = Address(
      addressName: "Work",
      id: "2",
      uid: "3248543",
      phoneNo: 9876543210,
      street: "456 Corporate Ave",
      area: "Business District",
      streetNo: "Suite 1500",
      floor: 15,
      doorNo: "15A",
      city: "New York",
      country: "USA",
      postCode: "10001",
      latitude: 40.712776,
      longitude: -74.005974,
      openAddress: "456 Corporate Ave, Suite 1500, 15th Floor, New York, NY",
      userNote: "Deliver to the reception desk.",
      state: 'state',
      isSelected: true);

// Example Address 3
  static final address3 = Address(
      addressName: "Vacation Home",
      id: "3",
      uid: "3248543",
      phoneNo: 1122334455,
      street: "789 Ocean Drive",
      area: "Beachside",
      streetNo: "",
      floor: 0,
      doorNo: "2",
      city: "Miami",
      country: "USA",
      postCode: "33101",
      latitude: 25.761681,
      longitude: -80.191788,
      openAddress: "789 Ocean Drive, Beachside, Miami, FL",
      userNote: "Call upon arrival to open the gate.",
      state: 'state',
      isSelected: false);

  static Categories categories = Categories(categoriesUnSorted);

  static final ProductFeatureOption _option7 =
      ProductFeatureOption("6", "silk");
  static final ProductFeatureOption _option8 =
      ProductFeatureOption("7", "polyester");
  static final ProductFeatureOption _option9 =
      ProductFeatureOption("8", "cotton");

  static final ProductFeatureOption _option1 = ProductFeatureOption("0", "S");
  static final ProductFeatureOption _option2 = ProductFeatureOption("1", "M");
  static final ProductFeatureOption _option3 = ProductFeatureOption("2", "L");

  static final ProductFeatureOption _option4 =
      ProductFeatureOption("3", Colors.cyan.value.toString());
  static final ProductFeatureOption _option5 =
      ProductFeatureOption("4", Colors.yellow.value.toString());
  static final ProductFeatureOption _option6 =
      ProductFeatureOption("5", Colors.green.value.toString());

  static final ProductFeatureOption _optionUnselected =
      ProductFeatureOption("unselected", "Unselected");
  static final ProductFeature productFeatureMaterial = ProductFeature(
    id: "2",
    name: "Material",
    options: [_option7, _option8, _option9],
    productFeatureType: ProductFeatureType.text,
  );

  static final ProductFeature productFeatureSize = ProductFeature(
    id: "0",
    name: "Size",
    options: [_option1, _option2, _option3],
    productFeatureType: ProductFeatureType.character,
  );
  static final ProductFeature productFeatureColor = ProductFeature(
      id: "1",
      name: "Color",
      options: [_option4, _option5, _option6],
      productFeatureType: ProductFeatureType.color);

  static final allProductFeatures = AllProductFeatures(
      [productFeatureSize, productFeatureColor, productFeatureMaterial]);

  static Review review1 = Review(
    star: ReviewStar.one,
    title: "About clothes",
    content:
        "This is not a bad one. but you should do what you have to do, this is insulting, so what tha hell will you do",
    dateTime: DateTime.now(),
    user: FakeUserModels.someUser,
  );

  static Review review2 = Review(
    star: ReviewStar.two,
    title: "Average Quality",
    content: "The quality is average, not too impressive.",
    dateTime: DateTime.now(),
    user: FakeUserModels.someUser,
  );

  static Review review3 = Review(
    star: ReviewStar.three,
    title: "Good Enough",
    content: "The product meets expectations but nothing extraordinary.",
    dateTime: DateTime.now(),
    user: FakeUserModels.someUser,
  );

  static Review review4 = Review(
    star: ReviewStar.four,
    title: "Satisfied",
    content: "I am satisfied with the product and would recommend it.",
    dateTime: DateTime.now(),
    user: FakeUserModels.someUser,
  );

  static Review review5 = Review(
    star: ReviewStar.five,
    title: "Excellent!",
    content: "Excellent quality, completely satisfied with the purchase.",
    dateTime: DateTime.now(),
    user: FakeUserModels.someUser,
  );

  static Review review6 = Review(
    star: ReviewStar.one,
    title: "Disappointed",
    content: "The product did not meet my expectations.",
    dateTime: DateTime.now(),
    user: FakeUserModels.someUser,
  );

  static Review review7 = Review(
    star: ReviewStar.two,
    title: "Not Worth the Price",
    content: "Could have been better for the price.",
    dateTime: DateTime.now(),
    user: FakeUserModels.someUser,
  );

  static Review review8 = Review(
    star: ReviewStar.three,
    title: "Decent",
    content: "A decent product with reasonable quality.",
    dateTime: DateTime.now(),
    user: FakeUserModels.someUser,
  );

  static Review review9 = Review(
    star: ReviewStar.four,
    title: "Happy with the Purchase",
    content: "Overall, I'm happy with the purchase and the service.",
    dateTime: DateTime.now(),
    user: FakeUserModels.someUser,
  );

  static Review review10 = Review(
    star: ReviewStar.five,
    title: "Highly Recommended",
    content: "Outstanding product, would highly recommend to others!",
    dateTime: DateTime.now(),
    user: FakeUserModels.someUser,
  );

  static Reviews reviews1(String userId) => Reviews(userId, [
        review1,
        review2,
        review3,
        review4,
        review5,
        review6,
        review7,
        review8,
        review9,
        review10,
      ]);

  static Reviews reviews2(String userId) => Reviews(userId, [
        review1,
        review2,
        review8,
        review9,
        review10,
      ]);

  static Reviews reviews3(String userId) => Reviews(userId, [
        review8,
        review3,
        review4,
        review5,
        review6,
        review7,
      ]);

/*
  static final productFeaturesWithSelectedOption = [
    ProductFeatureWithSelectedOption(productFeatureColor, _optionUnselected),
    ProductFeatureWithSelectedOption(productFeatureColor, _optionUnselected),
    ProductFeatureWithSelectedOption(productFeatureColor, _optionUnselected),
    ProductFeatureWithSelectedOption(productFeatureColor, _optionUnselected),
    ProductFeatureWithSelectedOption(productFeatureColor, _optionUnselected),
    ProductFeatureWithSelectedOption(productFeatureColor, _optionUnselected),
    ProductFeatureWithSelectedOption(productFeatureColor, _optionUnselected),
    ProductFeatureWithSelectedOption(productFeatureColor, _optionUnselected),
  ];
  static final productFeaturesWithSelectedOptions = [
    ProductFeatureWithSelectedOptions(productFeatureColor, [_optionUnselected]),
    ProductFeatureWithSelectedOptions(productFeatureColor, [_option4,_option5]),
    ProductFeatureWithSelectedOptions(productFeatureColor, [_option6]),
    ProductFeatureWithSelectedOptions(productFeatureColor, [_option5]),
    ProductFeatureWithSelectedOptions(productFeatureColor, [_option4]),
    ProductFeatureWithSelectedOptions(productFeatureColor, [_option6,_option4]),
    ProductFeatureWithSelectedOptions(productFeatureColor, [_optionUnselected]),
    ProductFeatureWithSelectedOptions(productFeatureColor, [_optionUnselected]),
  ];
*/

  static OrderModel orderPaidSuccess = OrderModel.testOnly(
    id: "1",
    address: address1,
    products: [
      ProductWithQuantity(
          product: product1, subProduct: subProduct1, quantity: 1),
      ProductWithQuantity(
          product: product2, subProduct: subProduct2, quantity: 2),
      ProductWithQuantity(
          product: product3, subProduct: subProduct3, quantity: 3),
    ],
    uid: "1",
    statusPaid: OrderPaid.create(),
    statusOrderTaken: OrderTaken.waiting(),
    statusShipped: OrderShipped.waiting(),
    statusDelivered: OrderDelivered.waiting(), activeReturn: null,
  );

  static OrderModel orderPaidCanceled = OrderModel.testOnly(
    id: "2",
    address: address2,
    products: [
      ProductWithQuantity(
          product: product1, subProduct: subProduct1, quantity: 1),
      ProductWithQuantity(
          product: product2, subProduct: subProduct2, quantity: 2),
      ProductWithQuantity(
          product: product3, subProduct: subProduct3, quantity: 3),
    ],
    uid: "1",
    statusPaid: OrderPaid.create(
    ),
    statusOrderTaken: OrderTaken.testOnly(
      status: PurchaseStatus.canceled,
      dateTime: DateTime.now(),
    ),
    statusShipped: OrderShipped.waiting(),
    statusDelivered: OrderDelivered.testOnly(
        dateTime: DateTime.now(), status: PurchaseStatus.waiting), activeReturn: null,
  );

  static final orderTakenSuccess = OrderModel.testOnly(
    id: "3",
    address: address3,
    products: [
      ProductWithQuantity(
          product: product1, subProduct: subProduct1, quantity: 1),
      ProductWithQuantity(
          product: product2, subProduct: subProduct2, quantity: 2),
      ProductWithQuantity(
          product: product3, subProduct: subProduct3, quantity: 3),
    ],
    uid: "1",
    statusPaid: OrderPaid.create(
    ),
    statusOrderTaken: OrderTaken.testOnly(
      status: PurchaseStatus.success,
      dateTime: DateTime.now(),
    ),
    statusShipped: OrderShipped.waiting(),
    statusDelivered: OrderDelivered.testOnly(
        dateTime: DateTime.now(), status: PurchaseStatus.waiting), activeReturn: null,
  );

  static final orderShippedSuccess = OrderModel.testOnly(
    id: "4",
    address: address1,
    products: [
      ProductWithQuantity(
          product: product1, subProduct: subProduct1, quantity: 1),
      ProductWithQuantity(
          product: product2, subProduct: subProduct2, quantity: 2),
      ProductWithQuantity(
          product: product3, subProduct: subProduct3, quantity: 3),
    ],
    uid: "1",
    statusPaid: OrderPaid.create(
    ),
    statusOrderTaken: OrderTaken.testOnly(
      status: PurchaseStatus.success,
      dateTime: DateTime.now(),
    ),
    statusShipped: OrderShipped.testOnly(
        dateTime: DateTime.now(),
        status: PurchaseStatus.success,
        cargoNo: "34290892349834"),
    statusDelivered: OrderDelivered.testOnly(
        dateTime: DateTime.now(), status: PurchaseStatus.waiting), activeReturn: null,
  );

  static final orderDeliveredSuccess = OrderModel.testOnly(
    id: "5",
    address: address2,
    products: [
      ProductWithQuantity(
          product: product1, subProduct: subProduct1, quantity: 1),
      ProductWithQuantity(
          product: product2, subProduct: subProduct2, quantity: 2),
      ProductWithQuantity(
          product: product3, subProduct: subProduct3, quantity: 3),
    ],
    uid: "1",
    statusPaid: OrderPaid.create(
    ),
    statusOrderTaken: OrderTaken.testOnly(
      status: PurchaseStatus.success,
      dateTime: DateTime.now(),
    ),
    statusShipped: OrderShipped.testOnly(
        dateTime: DateTime.now(),
        status: PurchaseStatus.success,
        cargoNo: "429383493948w"),
    statusDelivered: OrderDelivered.testOnly(
        dateTime: DateTime.now(), status: PurchaseStatus.success), activeReturn: returnProcessSuccess,
  );

  static ReturnModel returnProcessSuccess = ReturnModel.testOnly(
    orderId: '5',
    id: "0",
    uid: "0",
    address: address2,
    statusReturnRequested: ReturnStatusReturnRequested.testOnly(
        message: "reason",
        dateTime: DateTime.now(),
        returnReason: "damaged",
        returnType: ReturnType.damagedProduct),
    statusRequestAccepted: ReturnStatusRequestAccepted.testOnly(
      cargoNo: "e9w854239",
        dateTime: DateTime.now(),
        message: "reason",
        status: PurchaseStatus.success),
    statusReturnShipped: ReturnStatusShipped.testOnly(
        dateTime: DateTime.now(),
        message: "reason",
        status: PurchaseStatus.success,
        cargoNo: "123456789"),
    statusReturnDelivered: ReturnStatusDelivered.testOnly(
        dateTime: DateTime.now(),
        message: "reason",
        status: PurchaseStatus.success),
    statusReturnAccepted: ReturnStatusReturnAccepted.testOnly(
        dateTime: DateTime.now(),
        message: "reason",
        status: PurchaseStatus.success),
    products: [
      ProductWithQuantity(
          product: product1, quantity: 3, subProduct: subProduct1),
      ProductWithQuantity(
          product: product2, quantity: 2, subProduct: subProduct2),
      ProductWithQuantity(
          product: product3, quantity: 1, subProduct: subProduct3),
    ],
  );

  static ReturnModel returnProcessRejected = ReturnModel.testOnly(
    orderId: '23',
    id: "0",
    uid: "0",
    statusReturnRequested: ReturnStatusReturnRequested.testOnly(
        message: "reason",
        dateTime: DateTime.now(),
        returnReason: "damaged",
        returnType: ReturnType.damagedProduct),
    statusRequestAccepted: ReturnStatusRequestAccepted.testOnly(
      cargoNo: "23489023",
        dateTime: DateTime.now(),
        message: "reason",
        status: PurchaseStatus.canceled),
    statusReturnShipped: ReturnStatusShipped.waiting(),
    statusReturnDelivered: ReturnStatusDelivered.waiting(),
    statusReturnAccepted: ReturnStatusReturnAccepted.waiting(),
    products: [
      ProductWithQuantity(
          product: product1, quantity: 3, subProduct: subProduct1),
      ProductWithQuantity(
          product: product2, quantity: 2, subProduct: subProduct2),
      ProductWithQuantity(
          product: product3, quantity: 1, subProduct: subProduct3),
    ],
    address: address1,
  );

  static ReturnModel returnProcessCanceledByCustomer = ReturnModel.testOnly(
      orderId: '23',
      id: "0",
      uid: "0",
      address: address3,
      statusReturnRequested: ReturnStatusReturnRequested.testOnly(
          message: "reason",
          dateTime: DateTime.now(),
          returnReason: "damaged",
          returnType: ReturnType.damagedProduct),
      statusRequestAccepted: ReturnStatusRequestAccepted.waiting().canceledByCustomer("not necessary anymore"),
      statusReturnShipped: ReturnStatusShipped.waiting(),
      statusReturnDelivered: ReturnStatusDelivered.waiting(),
      statusReturnAccepted: ReturnStatusReturnAccepted.waiting(),
      products: [
        ProductWithQuantity(
            product: product1, quantity: 3, subProduct: subProduct1),
        ProductWithQuantity(
            product: product2, quantity: 2, subProduct: subProduct2),
      ]);

  static const productDemoImg1 = "https://i.imgur.com/CGCyp1d.png";
  static const productDemoImg2 = "https://i.imgur.com/AkzWQuJ.png";
  static const productDemoImg3 = "https://i.imgur.com/J7mGZ12.png";
  static const productDemoImg4 = "https://i.imgur.com/q9oF9Yq.png";
  static const productDemoImg5 = "https://i.imgur.com/MsppAcx.png";
  static const productDemoImg6 = "https://i.imgur.com/JfyZlnO.png";
  static const loginDemoImage = AppImages.loginImage;

  static SubProduct subProduct1 = SubProduct(
      id: "100",
      productId: "0",
      barcode: "4203854832",
      addedDate: DateTime.now(),
      modifiedDate: DateTime.now(),
      quantity: 0,
      price: Money(200),
      discount: Money(0),
      productFeatureOptionIds: ["0", "3", "7"]);
  static SubProduct subProduct2 = SubProduct(
      id: "101",
      productId: "0",
      barcode: "4203854832",
      addedDate: DateTime.now(),
      modifiedDate: DateTime.now(),
      quantity: 8,
      price: Money(300),
      discount: Money(25  ),
      productFeatureOptionIds: ["0", "3", "8"]);
  static SubProduct subProduct3 = SubProduct(
      id: "102",
      productId: "0",
      barcode: "4203854832",
      addedDate: DateTime.now(),
      modifiedDate: DateTime.now(),
      quantity: 6,
      price: Money(400),
      discount: Money(0),
      productFeatureOptionIds: ["0", "3", "6"]);
  static SubProduct subProduct4 = SubProduct(
      id: "103",
      productId: "0",
      barcode: "4203854832",
      addedDate: DateTime.now(),
      modifiedDate: DateTime.now(),
      quantity: 2,
      price: Money(100),
     discount: Money(0),
      productFeatureOptionIds: ["0", "5", "6"]);

  static SubProduct subProduct5 = SubProduct(
      id: "104",
      productId: "0",
      barcode: "4203854832",
      addedDate: DateTime.now(),
      modifiedDate: DateTime.now(),
      quantity: 2,
      price:Money(100),
      discount: Money(0),
      productFeatureOptionIds: ["0", "5", "7"]);
  static SubProduct subProduct6 = SubProduct(
      id: "105",
      productId: "0",
      barcode: "4203854832",
      addedDate: DateTime.now(),
      modifiedDate: DateTime.now(),
      quantity: 4,
      price : Money(100),
      discount: Money(0),
      productFeatureOptionIds: ["0", "5", "6"]);
  static SubProduct subProduct7 = SubProduct(
      id: "106",
      productId: "0",
      barcode: "4203854832",
      addedDate: DateTime.now(),
      modifiedDate: DateTime.now(),
      quantity: 4,
      price: Money(130),
      discount: Money(20),
      productFeatureOptionIds: ["2", "4", "8"]);
  static SubProduct subProduct8 = SubProduct(
      id: "0",
      productId: "0",
      barcode: "4203854832",
      addedDate: DateTime.now(),
      modifiedDate: DateTime.now(),
      quantity: 4,
      price: Money(214),
      discount: Money(54),
      productFeatureOptionIds: ["0", "3", "7"]);

  static List<SubProduct> _subProductList(int count, int productId) {
    List<SubProduct> subProductList = [];
    for (int i = 0; i < count; i++) {
      final index = i * (productId + 1);
      String id = index.toString();
      String barcode =
          "420385483${index % 10}"; // Simple barcode generation for uniqueness
      DateTime now = DateTime.now();
      double price = 100 + (index * 10);
      double discount = index % 6 == 3 ? price / (index + 1) : 0;

      // Randomly selecting feature options (sizes, colors, materials)
      String materialOptionId = productFeatureMaterial
          .options[(index % productFeatureMaterial.options.length)].id;
      String colorOptionId = productFeatureColor
          .options[(index % productFeatureColor.options.length)].id;
      String sizeOptionId = productFeatureSize
          .options[index % productFeatureMaterial.options.length].id;

      subProductList.add(SubProduct(
        id: id,
        productId: productId.toString(),
        barcode: barcode,
        addedDate: now,
        modifiedDate: now,
        quantity: 5 + (index % 5),
        // Random quantity between 5 to 9
        price: Money(price),
        // Incremental price for variety
        discount: Money(discount),
        // Assuming no discount
        productFeatureOptionIds: [
          sizeOptionId,
          colorOptionId,
          materialOptionId
        ],
      ));
    }
    return subProductList;
  }

  static Product product1 = Product.testOnly(

      returns: productPageReturnText,
      allProductFeatures: allProductFeatures,
      id: "0",
      name: "Nike Ayakkabı",
      categoryId: "1",
      info: "Mükemmel ayakkabı",
      cargoPrice: Money( 34.2, ),
      images: [productDemoImg1, productDemoImg2, productDemoImg3],
      brandName: "Nike",
      subProducts: SubProducts([
        subProduct1,
        subProduct2,
        subProduct3,
        subProduct4,
        subProduct5,
        subProduct6,
        subProduct7,
        subProduct8,
      ]),
      productDetails: [],
  );

  static Product product2 = Product.testOnly(
      productDetails: [],
      returns: "This product has not returns",
      allProductFeatures: allProductFeatures,
      id: "1",
      name: "Adidas Sandalet aosdfjlasdjflkasdjflksfdjasldfj  thisis whait ist is",
      categoryId: "12",
      info: "Rahat sandalet",
      cargoPrice: Money( 34.2, ),
      images: [productDemoImg4, productDemoImg5, productDemoImg6],
      subProducts: SubProducts(_subProductList(5, 1)),
      brandName: "Adidas");

  static Product product3 = Product.testOnly(
      productDetails: [],
      allProductFeatures: allProductFeatures,
      returns: "This product has not returns",
      id: "2",
      name: "Clarks Kundura",
      categoryId: "13",
      info: "Şık kundura",
      cargoPrice: Money( 34.2, ),
      images: [productDemoImg1, productDemoImg2, productDemoImg3],
      subProducts: SubProducts(_subProductList(5, 2)),
      brandName: "Clarks");

  static Product product4 = Product.testOnly(
      productDetails: [],
      allProductFeatures: allProductFeatures,
      returns: productPageReturnText,
      id: "3",
      name: "Timberland Bot",
      categoryId: "14",
      info: "Dayanıklı bot",
      cargoPrice: Money( 34.2, ),
      images: [productDemoImg4, productDemoImg5, productDemoImg6],
      subProducts: SubProducts(_subProductList(5, 3)),
      brandName: "Timberland");

  static Product product5 = Product.testOnly(
      productDetails: [],
      allProductFeatures: allProductFeatures,
      returns: productPageReturnText,
      id: "4",
      name: "Deri Bot",
      categoryId: "15",
      info: "Kaliteli deri bot",
      cargoPrice: Money( 54.2, ),
      images: [productDemoImg1, productDemoImg2, productDemoImg3],
      subProducts: SubProducts(_subProductList(5, 4)),
      brandName: "Derimod");

/*
  static Product product2 = Product("1", "Tuvalet", "0", "Gelinlik", 34.2, 6, "34905743", "0", 3, 54,
      [ProductFeatureWithSelectedOption(productFeatureSize, _option2) ,ProductFeatureWithSelectedOption(productFeatureColor, _option5) ], 10);
  static Product product3 = Product("2", "Gömlek", "0", "Güzel bir kuyafet", 34.2, 6, "34905743", "0", 3, 54,
      [ProductFeatureWithSelectedOption(productFeatureSize, _option3) ,ProductFeatureWithSelectedOption(productFeatureColor, _option6) ], 10);
*/

  static final products = [product1, product2, product3, product4, product5];
  static final products2 = [
    product1,
  ];
  static final products3 = [
    product2,
  ];
  static final products4 = [product3];

  static List<RecentSearch> recentSearches = [
    RecentSearch("0", "3333", "Ayakkabı"),
    RecentSearch("1", "3333", "Pantolon"),
    RecentSearch("2", "3333", "Krampon"),
    RecentSearch("3", "3333", "Kulaklık"),
    RecentSearch("4", "3333", "Gömlek"),
  ];

  static final Tag summerTag = Tag("Summer");
  static final Tag winterTag = Tag("Winter");
  static final Tag holidayTag = Tag("Holiday");

  static final productDetails = [
    ProductDetailsItem("Size", "55"),
    ProductDetailsItem("Color", "blue, grey, cyan"),
    ProductDetailsItem("kumaş", "ipek"),
  ];

  static List<BannerModel> banners = [
    BannerModel(
        title: "Grab yours own",
        subtitle: "Collections",
        discount: 30,
        image: AppImages.shoppingBags,
        style: BannerStyle.bannerM1Style,
        tag: summerTag),
    BannerModel(
        title: "Summer Sale",
        subtitle: "Collections",
        discount: 59,
        image: AppImages.windowShopping,
        style: BannerStyle.bannerM2Style,
        tag: winterTag),
    BannerModel(
        title: "New items",
        subtitle: "Collections",
        discount: 30,
        image: AppImages.shoppingBags,
        style: BannerStyle.bannerM1Style,
        tag: holidayTag),
  ];
  static const productPageReturnText =
      "Free pre-paid returns and exchanges for orders shipped to the US. Get refunded faster with easy online returns and print a FREE pre-paid return SmartLabel@ online! Return or exchange any unused or defective merchandise by mail or at one of our US or Canada store locations. Made to order items cannot be canceled, exchange or returned.";
}
