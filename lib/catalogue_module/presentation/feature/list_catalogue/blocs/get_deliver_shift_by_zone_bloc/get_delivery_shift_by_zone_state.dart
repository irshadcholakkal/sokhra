part of 'get_delivery_shift_by_zone_bloc.dart';


abstract class GetDeliveryShiftByZoneState extends Equatable{
  const GetDeliveryShiftByZoneState();


}
class GetDeliveryShiftByZoneInitial extends GetDeliveryShiftByZoneState{
   @override
  List<Object> get props => [];
}

class GetDeliveryShiftByZoneLoading extends GetDeliveryShiftByZoneState{
   @override
  List<Object> get props => [];
}

class GetDeliveryShiftByZoneLoadedSucess extends GetDeliveryShiftByZoneState{
  final List<DeliveryShift> deliveryshift;

  GetDeliveryShiftByZoneLoadedSucess({required this.deliveryshift});

   @override
  List<Object> get props => [deliveryshift];


}
class GetDeliveryShiftByZoneLoadedFailed extends GetDeliveryShiftByZoneState{
  final String error;

  GetDeliveryShiftByZoneLoadedFailed({required this.error});
  @override
  List<Object> get props => [error];

}
