part of 'promo_code_bloc.dart';

abstract class PromoCodeEvent extends Equatable {
  const PromoCodeEvent();
  @override
  List<Object?> get props => [];
}

class PromoCodeApplyEvent extends PromoCodeEvent {
  final String promoCode;
  // final String pinCode;
  final String deviceId;
  final double ? lat;
  final double ? lng;


  PromoCodeApplyEvent(
      {required this.promoCode,  required this.deviceId, this.lng,this.lat
      // required this.pinCode,
      });
  @override
  List<Object?> get props => [promoCode, deviceId, lat, lng];
}

class PromoCodeResetEvent extends PromoCodeEvent {}
