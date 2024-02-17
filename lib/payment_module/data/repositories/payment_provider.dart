import 'package:flutter/foundation.dart';

import '../../../base_module/data/entity/graphql_service.dart';
import '../../../base_module/data/entity/models/data_response.dart';
import '../../../base_module/presentation/util/util.dart';
import '../../../orders_module/domain/models/order.dart';
import '../../../user_module/domain/entity/authentication.dart';
import '../../../user_module/domain/user_data.dart';
import '../../domain/entity/models/customer_wallet.dart';
import '../../domain/entity/models/customer_wallet_list.dart';
import '../../domain/entity/models/initiate_payment_response.dart';
import '../../domain/entity/models/promocode_info.dart';
import '../../domain/entity/models/wallet_balance.dart';
import '../entity/models/create_payment_input.dart';
import '../entity/models/initiate_payment_input.dart';
import '../entity/models/wallet_input.dart';
import '../schemas/payment_schema.dart';
import '../schemas/wallet_schema.dart';

class PaymentProvider {
  final _paymentSchema = PaymentSchema();
  final _walletSchema = WalletSchema();

  Future<DataResponse> initiatePayment({
    required InitiatePaymentInput initiatePaymentInput,
  }) async {
    // print("aaaaa");
    // print(initiatePaymentInput.customerAudio);
    final _queryOptions = GraphQLService().makeMutationOptions(
      query: _paymentSchema.initiatePayment,
      variables: {
        "input": {
          "addressId": initiatePaymentInput.addressId,
          "deviceId": initiatePaymentInput.deviceId,
         // "note": initiatePaymentInput.note,
          "paymentType": initiatePaymentInput.paymentType.name,
          "invoiceAmount": initiatePaymentInput.invoiceAmount,
          "promoDiscount": initiatePaymentInput.promoDiscount,
          "subTotal": initiatePaymentInput.subTotal,
          //"promoCode": initiatePaymentInput.promoCode,
          "deliveryDate":initiatePaymentInput.deliveryDate,
          "deliveryShift":initiatePaymentInput.deliveryShift
          // "applyWallet": initiatePaymentInput.applyWallet
          // "checkoutNote": initiatePaymentInput.note,
          // "customerAudio": initiatePaymentInput.customerAudio != null
          //     ? await util
          //         .multipartFileFrom(initiatePaymentInput.customerAudio!)
          //     : null
        }
      },
    );
    print("addressId${initiatePaymentInput.addressId}");
    print("deviceId${initiatePaymentInput.deviceId}");
    print("note${initiatePaymentInput.note}");
    print("paymentType${initiatePaymentInput.paymentType.name}");
    print("invoiceAmount${initiatePaymentInput.invoiceAmount}");
    print("promoDiscount${initiatePaymentInput.promoDiscount}");
    print("subTotal${initiatePaymentInput.subTotal}");
    print("promoCode${initiatePaymentInput.promoCode}");
     print("deliveryShift${initiatePaymentInput.deliveryShift}");
      print("deliveryDate${initiatePaymentInput.deliveryDate}");
    // debugPrint("payment provider->initiate payment $initiatePaymentInput");

    final _graphQLResponse = await graphQLService.performMutation(
      mutationOptions: _queryOptions,
    );
    print("DATA:${_graphQLResponse.data}OR - ERROR:${_graphQLResponse.error?.message}");

    if (_graphQLResponse.hasData) {
      debugPrint("payment provider->initiatePayment response" +
          _graphQLResponse.data.toString());
      return DataResponse(
        data: InitiatePaymentResponse.fromJson(
          _graphQLResponse.data["initiatePayment"],
        ),
      );
    }
    final errorInfo = _graphQLResponse.error;
    return DataResponse(error: errorInfo?.type);
  }

  Future<DataResponse> applyPromoCode(
      {required String promoCode,
      // required String pinCode,
      required String deviceId,
      required double? lat,
      required double? lng}) async {
    final _queryOptions = GraphQLService().makeQueryOptions(
        query: _paymentSchema.applyPromoCode,
        variables: {
          "promoCode": promoCode,
          "pinCode": userData.pinCode,
          "deviceId": deviceId,
          // "lat": lat,
          // "lng":lng
        },
        networkOnly: true);

    final _graphQLResponse =
        await graphQLService.performQuery(queryOptions: _queryOptions);

    if (_graphQLResponse.hasData) {
      // debugPrint("payment provider-> applyPromoCode" +
      //     _graphQLResponse.data.toString());
      return DataResponse(
          data:
              PromoCodeInfo.fromJson(_graphQLResponse.data["applyPromoCode"]));
    } else {
      final errorInfo = _graphQLResponse.error;

      return DataResponse(
        error: errorInfo?.type,
      );
    }
  }

  Future<DataResponse> createPayment({
    required CreatePaymentInput createPaymentInput,
  }) async {
    final _mutationOptions = GraphQLService().makeMutationOptions(
      query: _paymentSchema.createPayment,
      variables: {"input": createPaymentInput},
    );

    debugPrint("createPayment input is ${createPaymentInput.toJson()}");
    // debugPrint(
    //     "payment provider->create payment input pending orderId:${createPaymentInput.pendingOrderId},signature${createPaymentInput.razorpaySignature} ,paymentId:${createPaymentInput.razorpayPaymentId},deviceId${createPaymentInput.deviceId},razorpayOrderId:${createPaymentInput.razorpayOrderId}");

    final _graphQLResponse = await graphQLService.performMutation(
      mutationOptions: _mutationOptions,
    );

    if (_graphQLResponse.hasData) {
      debugPrint(
        "payment provider->createPayment response" +
            _graphQLResponse.data.toString(),
      );

      return DataResponse(
        data: Order.fromJson(_graphQLResponse.data["createPayment"]),
      );
    }

    final errorInfo = _graphQLResponse.error;
    return DataResponse(error: errorInfo?.type);
  }

  Future<DataResponse> getCustomerWallet(
      {required String? type, required bool? reFetch}) async {
    final _queryOptions = GraphQLService().makeQueryOptions(
        query: _walletSchema.getCustomerWallet,
        variables: {
          "type": type,
        },
        networkOnly: reFetch ?? false);

    final _graphQLResponse =
        await graphQLService.performQuery(queryOptions: _queryOptions);

    if (_graphQLResponse.hasData) {
      // debugPrint("payment provider-> getCustomerWallet" +
      //     _graphQLResponse.data.toString());
      return DataResponse(
          data: CustomerWalletList.fromJson(_graphQLResponse.data));
    } else {
      final errorInfo = _graphQLResponse.error;

      return DataResponse(
        error: errorInfo?.type,
      );
    }
  }

  Future<DataResponse> getWalletBalance({required bool? reFetch}) async {
    final _queryOptions = GraphQLService().makeQueryOptions(
        query: _walletSchema.getWalletBalance,
        variables: {
          "user": authentication.user?.id,
        },
        networkOnly: reFetch ?? false);

    final _graphQLResponse =
        await graphQLService.performQuery(queryOptions: _queryOptions);

    if (_graphQLResponse.hasData) {
      debugPrint("payment provider-> getWalletBalance" +
          _graphQLResponse.data.toString());
      return DataResponse(
          data: WalletBalance.fromJson(
              _graphQLResponse.data["getWalletBalance"]));
    } else {
      final errorInfo = _graphQLResponse.error;

      return DataResponse(
        error: errorInfo?.type,
      );
    }
  }

  Future<DataResponse> initiateCustomerWallet({
    required String? note,
    required double? credit,
  }) async {
    final _mutationOptions = GraphQLService().makeMutationOptions(
      query: _walletSchema.initiateCustomerWallet,
      variables: {"credit": credit, "note": note ?? ""},
    );
    // debugPrint("payment provider->create payment $createPaymentInput");

    final _graphQLResponse =
        await graphQLService.performMutation(mutationOptions: _mutationOptions);
    debugPrint("payment provider->initiate payment ${_graphQLResponse.error}");
    if (_graphQLResponse.hasData) {
      debugPrint("payment provider->initiateCustomerWallet response" +
          _graphQLResponse.data.toString());
      return DataResponse(
          data: InitiatePaymentResponse.fromJson(
              _graphQLResponse.data["initiateCustomerWallet"]));
    } else {
      final errorInfo = _graphQLResponse.error;
      return DataResponse(
        error: errorInfo?.type,
      );
    }
  }

  Future<DataResponse> addToWallet({
    required WalletInput? input,
  }) async {
    final _mutationOptions = GraphQLService().makeMutationOptions(
      query: _walletSchema.customerWallet,
      variables: {"input": input},
    );

    final _graphQLResponse =
        await graphQLService.performMutation(mutationOptions: _mutationOptions);

    if (_graphQLResponse.hasData) {
      debugPrint("payment provider->addToWallet response" +
          _graphQLResponse.data.toString());
      return DataResponse(
          data:
              CustomerWallet.fromJson(_graphQLResponse.data["customerWallet"]));
    } else {
      final errorInfo = _graphQLResponse.error;
      return DataResponse(
        error: errorInfo?.type,
      );
    }
  }
}
