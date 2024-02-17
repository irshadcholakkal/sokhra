part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class UpdateProfileInProgress extends ProfileState {}

class UpdateProfileSuccess extends ProfileState {
  final User user;

  const UpdateProfileSuccess({
    required this.user,
  });

  @override
  List<Object> get props => [user];
}

class UpdateProfileFailed extends ProfileState {
  final String message;

  const UpdateProfileFailed({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class UpdatePasswordInProgress extends ProfileState {}

class UpdatePasswordSuccess extends ProfileState {
  final bool response;

  const UpdatePasswordSuccess({
    required this.response,
  });

  @override
  List<Object> get props => [response];
}

class UpdatePasswordFailed extends ProfileState {
  final String message;

  const UpdatePasswordFailed({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class ForgotPasswordInProgress extends ProfileState {}

class ForgotPasswordSuccess extends ProfileState {
  final String response;

  const ForgotPasswordSuccess({
    required this.response,
  });

  @override
  List<Object> get props => [response];
}

class ForgotPasswordFailed extends ProfileState {
  final String message;

  const ForgotPasswordFailed({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class SendOtpInProgress extends ProfileState {}

class SendOtpSuccess extends ProfileState {
  final String response;

  const SendOtpSuccess({
    required this.response,
  });

  @override
  List<Object> get props => [response];
}

class SendOtpFailed extends ProfileState {
  final String message;

  const SendOtpFailed({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class ProfileCreateAddressSuccess extends ProfileState {}

class ProfileCreateAddressFailed extends ProfileState {
  final String message;

  ProfileCreateAddressFailed({required this.message});

  @override
  List<Object> get props => [message];
}

class ProfileEditAddressSuccess extends ProfileState {
  final ShippingAddress shippingAddress;

  ProfileEditAddressSuccess({required this.shippingAddress});

  @override
  List<Object> get props => [shippingAddress];
}

class ProfileEditAddressFailed extends ProfileState {
  final String message;

  ProfileEditAddressFailed({required this.message});

  @override
  List<Object> get props => [message];
}

class ProfileDeleteAddressSuccess extends ProfileState {}

class ProfileDeleteAddressFailed extends ProfileState {
  final String message;

  ProfileDeleteAddressFailed({required this.message});

  @override
  List<Object> get props => [message];
}
