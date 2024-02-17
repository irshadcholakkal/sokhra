part of 'delivery_check_cubit.dart';

abstract class DeliveryCheckState extends Equatable {
  const DeliveryCheckState();

  @override
  List<Object> get props => [];
}

class DeliveryCheckInitial extends DeliveryCheckState {}

class DeliveryCheckLoading extends DeliveryCheckState {}

class DeliveryCheckSuccess extends DeliveryCheckState {
  final DeliveryCheckResponse data;
  final LocationDetails? locationDetails;
  final bool isByEmitter;

  DeliveryCheckSuccess({
    required this.data,
    this.locationDetails,
    this.isByEmitter = false,
  });

  @override
  List<Object> get props => [data];
}

class DeliveryCheckFailed extends DeliveryCheckState {
  final String message;

  DeliveryCheckFailed({required this.message});

  @override
  List<Object> get props => [message];
}
