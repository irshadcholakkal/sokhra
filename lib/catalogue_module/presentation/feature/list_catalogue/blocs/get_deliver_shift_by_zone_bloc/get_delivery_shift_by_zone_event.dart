part of 'get_delivery_shift_by_zone_bloc.dart';



abstract class GetDeliveryShiftByZoneEvent extends Equatable{
  const GetDeliveryShiftByZoneEvent();
 
}

class GetDeliveryShiftByZoneFetchEvent extends GetDeliveryShiftByZoneEvent{
  final String ?zone;

  GetDeliveryShiftByZoneFetchEvent({ this.zone});

  @override
  List<Object?> get props => [zone];
}