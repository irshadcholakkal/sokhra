part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class UpdateProfile extends ProfileEvent {
  final UserUpdateInput userUpdateInput;

  const UpdateProfile({required this.userUpdateInput});

  @override
  List<Object?> get props => [userUpdateInput];
}

class UpdatePassword extends ProfileEvent {
  final String? currentPassword;
  final String? newPassword;

  const UpdatePassword({
    required this.currentPassword,
    required this.newPassword,
  });

  @override
  List<Object?> get props => [
        currentPassword,
        newPassword,
      ];
}

class ForgotPassword extends ProfileEvent {
  final OtpInput? otpInput;
  final String? otp;
  final String? password;

  const ForgotPassword({
    required this.otpInput,
    required this.otp,
    required this.password,
  });

  @override
  List<Object?> get props => [
        otpInput,
        otp,
        password,
      ];
}

class SendOtp extends ProfileEvent {
  final OtpInput? otpInput;

  const SendOtp({required this.otpInput});

  @override
  List<Object?> get props => [otpInput];
}

class ProfileCreateAddress extends ProfileEvent {
  final ShippingInput shippingInput;

  ProfileCreateAddress({required this.shippingInput});

  @override
  List<Object?> get props => [shippingInput];
}

class ProfileEditAddress extends ProfileEvent {
  final ShippingInput shippingInput;
  final String addressId;
  final String customerId;

  ProfileEditAddress({
    required this.shippingInput,
    required this.addressId,
    required this.customerId,
  });

  @override
  List<Object?> get props => [shippingInput, addressId, customerId];
}

class ProfileDeleteAddress extends ProfileEvent {
  final String customerId;
  final ShippingAddress address;

  ProfileDeleteAddress({
    required this.customerId,
    required this.address,
  });

  @override
  List<Object?> get props => [address, customerId];
}
