part of 'address_selection_bloc.dart';

abstract class AddressSelectionState extends Equatable {
  const AddressSelectionState();
  @override
  List<Object?> get props => [];
}

class AddressSelectionLoading extends AddressSelectionState {}

class AddressSelectionSuccess extends AddressSelectionState {
  final ShippingAddress? address;
  final String? addressText;

  AddressSelectionSuccess({required this.address, required this.addressText});
  @override
  List<Object?> get props => [address, addressText];
}

class AddressSelectionFailed extends AddressSelectionState {}
