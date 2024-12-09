import 'package:ecommerce_app_mobile/common/constant/currency.dart';
import 'package:ecommerce_app_mobile/data/model/communication_model.dart';
import 'package:ecommerce_app_mobile/sddklibrary/annotation/test_annotation.dart';
import 'package:latlong2/latlong.dart';

class AppSettings {
  final int maxProductQuantityCustomerCanBuyInOrder;
  final double defaultShippingFee;
  final LatLng defaultMapLocation;
  final Currency defaultCurrency;
  final int defaultReturnDay;

  // final String defaultLanguage;
  final List<ContactModel> contacts;

  @TestOnly()
  const AppSettings.testOnly(
      {required this.maxProductQuantityCustomerCanBuyInOrder,
        required this.defaultShippingFee,
        required this.defaultMapLocation,
        required this.defaultCurrency,
        required this.defaultReturnDay,
        // required this.defaultLanguage,
        required this.contacts});

  factory AppSettings.fromJson(Map<String, dynamic> json) {
    //todo: implement
    throw UnimplementedError();
  }

  AppSettings._({
    required this.maxProductQuantityCustomerCanBuyInOrder,
    required this.defaultShippingFee,
    required this.defaultMapLocation,
    required this.defaultCurrency,
    required this.contacts,
    required this.defaultReturnDay,});


  static  AppSettings defaultAppSettings() {
    return AppSettings._(
        maxProductQuantityCustomerCanBuyInOrder: 10,
        defaultShippingFee: 0.0,
        defaultMapLocation: const LatLng(41.0082, 28.9784),
        defaultCurrency: Currency.try_,
        contacts: [],
        defaultReturnDay: 14);
  }
}
