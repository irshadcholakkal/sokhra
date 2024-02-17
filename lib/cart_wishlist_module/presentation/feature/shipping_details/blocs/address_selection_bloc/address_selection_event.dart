part of 'address_selection_bloc.dart';

abstract class AddressSelectionEvent extends Equatable {
  const AddressSelectionEvent();
}

class AddressSelectionSetEvent extends AddressSelectionEvent {
  final ShippingAddress? address;
  final String? addressText;

  AddressSelectionSetEvent({required this.address, required this.addressText});

  @override
  List<Object?> get props => [address, addressText];
}
