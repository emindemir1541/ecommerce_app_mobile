import 'dart:ffi';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce_app_mobile/common/ui/theme/AppText.dart';
import 'package:ecommerce_app_mobile/data/model/address.dart';
import 'package:ecommerce_app_mobile/data/model/product.dart';
import 'package:ecommerce_app_mobile/data/model/order.dart';

import '../../common/constant/api_constants.dart';

abstract class Purchase {
  String get id;

  String get uid;

  Address get address;

  PurchaseProcessHandler get purchaseProcessesHandler;

  List<ProductWithQuantity> get products;
// PurchaseProcess.fromMap(Map<String, dynamic> map);
}

abstract class PurchaseStatusType {
  AppText get userText;

  String get apiData;
}

class PurchaseProcess {
  final String? message;
  final Object? receipt;
  final PurchaseStatusType purchaseStatusType;
  final DateTime dateTime;
  final PurchaseStatus status;
  final bool cancelableWhileProcessing;

  PurchaseProcess({
    required this.cancelableWhileProcessing,
    this.message,
    this.receipt,
    required this.status,
    required this.purchaseStatusType,
    required this.dateTime,
  });

  PurchaseProcess? nextStatus(OrderModel orderModel) => null;

  PurchaseProcess copyWith({required PurchaseStatus status}) {
    return PurchaseProcess(
        cancelableWhileProcessing: cancelableWhileProcessing,
        message: message,
        receipt: receipt,
        status: status,
        purchaseStatusType: purchaseStatusType,
        dateTime: dateTime);
  }

  Map<String, dynamic> toMap() {
    return {
      ApiDeliveryProcesses.message: message,
      ApiDeliveryProcesses.receipt: receipt,
      ApiDeliveryProcesses.purchaseStatusType: purchaseStatusType.apiData,
      ApiDeliveryProcesses.dateTime: dateTime.toIso8601String(),
    };
  }

/*
  PurchaseProcess.fromMap(
    Map<String, dynamic> map,
  )   : message = map[ApiDeliveryProcesses.message],
        receipt = map[ApiDeliveryProcesses.receipt],
        status = PurchaseStatus.fromServerMessage(
            map[ApiDeliveryProcesses.purchaseStatus]),
        purchaseStatusType = map[ApiDeliveryProcesses.purchaseStatusType],
        dateTime = DateTime.parse(map[ApiDeliveryProcesses.dateTime]);
*/
}

class PurchaseProcessHandler {
  final PurchaseProcess one;
  final PurchaseProcess two;
  final PurchaseProcess three;
  final PurchaseProcess four;

  PurchaseProcessHandler({
    required this.one,
    required this.two,
    required this.three,
    required this.four,
  });

  List<PurchaseProcess> get all => [one, two, three, four];

  PurchaseProcess? get getProcessing => two.status == PurchaseStatus.success
      ? three.status == PurchaseStatus.success
          ? four.status == PurchaseStatus.success
              ? null
              : four
          : three
      : two;

  PurchaseProcess? getNext(PurchaseProcess current) => current == one
      ? two
      : current == two
          ? three
          : current == three
              ? four
              : null;

  @override
  String toString() {
    return 'PurchaseProcessHandler{one: $one, two: $two, three: $three, four: $four}';
  }
}

enum PurchaseStatus {
  success('success'),
  failed('failed'),
  canceled('canceled'),
  waiting('waiting'),
  ;

  static PurchaseStatus fromServerMessage(String message) {
    return PurchaseStatus.values
        .firstWhere((element) => element.apiData == message);
  }

  final String apiData;

  const PurchaseStatus(this.apiData);
}
