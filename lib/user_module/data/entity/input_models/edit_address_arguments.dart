import 'package:equatable/equatable.dart';

import '../../../../app_settings_module/domain/entity/models/shipping_address.dart';

class EditAddressArguments extends Equatable {
  final String? userId;
  final String? addressId;
  final ShippingAddress? address;
  final bool? isEdit;

  EditAddressArguments(
      {this.userId, this.addressId, this.isEdit, this.address});

  @override
  List<Object?> get props => [userId, addressId, isEdit, address];
}
