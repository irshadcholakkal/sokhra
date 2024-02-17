part of 'repeat_order_bloc.dart';

abstract class RepeatOrderEvent extends Equatable {
  const RepeatOrderEvent();
}

class RepeatOrderCreateEvent extends RepeatOrderEvent {
  final String orderId;

  // final String pinCode;
  final double? lat;
  final double? lng;

  RepeatOrderCreateEvent({required this.orderId, this.lat, this.lng
      // required this.pinCode,
      });

  @override
  List<Object?> get props => [
        orderId, lat, lng,
        // pinCode,
      ];
}
