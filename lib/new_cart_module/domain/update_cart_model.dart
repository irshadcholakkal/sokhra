import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_cart_model.g.dart';

@JsonSerializable()
class UpdateCart extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final int? quantity;
  final String? deviceId;

  UpdateCart({
    this.id,
    this.deviceId,
    this.quantity,
  });

  @override
  List<Object?> get props => [
        id,
        deviceId,
        quantity,
      ];

  factory UpdateCart.fromJson(Map<String,dynamic> json) => _$UpdateCartFromJson(json);

  Map<String,dynamic> toJson() => _$UpdateCartToJson(this);
}
