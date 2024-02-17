import 'package:equatable/equatable.dart';

import '../../../../../data/entity/input_models/add_to_cart_input.dart';

abstract class LoadAddToCartEvent extends Equatable {
  const LoadAddToCartEvent();
}

class AddToCartEvent extends LoadAddToCartEvent {
  final AddToCartInput addToCartInput;
  final String pincode;

  AddToCartEvent({required this.addToCartInput, this.pincode = ""});

  @override
  List<Object> get props => [addToCartInput, pincode];
}
