import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../data/repositories/payment_provider.dart';
import '../../../../../domain/entity/models/promocode_info.dart';

part 'promo_code_event.dart';
part 'promo_code_state.dart';

class PromoCodeBloc extends Bloc<PromoCodeEvent, PromoCodeState> {
  PromoCodeBloc() : super(PromoCodeInitial());

  final _paymentProvider = PaymentProvider();
  double? _discountedPrice;
  double? get discountedPrice => _discountedPrice;

  @override
  Stream<PromoCodeState> mapEventToState(PromoCodeEvent event) async* {
    if (event is PromoCodeApplyEvent) {
      try {
        yield PromoCodeApplyLoading();
        final dataResponse = await _paymentProvider.applyPromoCode(
            promoCode: event.promoCode,
            // pinCode: event.pinCode,
            deviceId: event.deviceId,
            lng: event.lng,
            lat: event.lat
        );
        if (dataResponse.hasData) {
          PromoCodeInfo data = dataResponse.data;
          _discountedPrice = data.discountedPrice;
          yield PromoCodeApplySuccess(response: data);
        } else if (dataResponse.hasError) {
          yield PromoCodeApplyFailed(
            message: dataResponse.error?.toUpperCase() ?? "",
          );
        }
      } catch (e) {
        yield PromoCodeApplyFailed(
          message: e.toString().toUpperCase(),
        );
      }
    } else if (event is PromoCodeResetEvent) {
      yield PromoCodeInitial();
    }
  }
}
