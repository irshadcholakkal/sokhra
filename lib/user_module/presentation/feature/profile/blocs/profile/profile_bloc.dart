import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../app_settings_module/domain/entity/models/shipping_address.dart';
import '../../../../../data/entity/input_models/otp_input.dart';
import '../../../../../data/entity/input_models/shipping_input.dart';
import '../../../../../data/entity/input_models/user_update_input.dart';
import '../../../../../data/repositories/profile_provider.dart';
import '../../../../../domain/entity/models/user.dart';
import '../../../../../domain/user_data.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final _profileProvider = ProfileProvider();

  ProfileBloc() : super(ProfileInitial());

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is UpdateProfile) {
      print("event is UpdateProfile===================================");
      yield* _mapUpdateProfileToState(
        userUpdateInput: event.userUpdateInput,
      );
    } 
    else if (event is UpdatePassword) {
      yield* _mapUpdatePasswordToState(
        currentPassword: event.currentPassword,
        newPassword: event.newPassword,
      );
     } 
    //else if (event is ForgotPassword) {
    //   yield* _mapForgotPasswordToState(
    //     otpInput: event.otpInput,
    //     otp: event.otp,
    //     password: event.password,
    //   );
    // } 
    // else if (event is SendOtp) {
    //   yield* _mapSendOtpToState(
    //     otpInput: event.otpInput,
    //   );
   // }
    else if (event is ProfileCreateAddress) {
      yield* _mapProfileCreateAddressToState(
        shippingInput: event.shippingInput,
      );
    } 
    else if (event is ProfileEditAddress) {
      yield* _mapProfileEditAddressToState(
        customerId: event.customerId,
        addressId: event.addressId,
        shippingInput: event.shippingInput,
      );
    } 
    // else if (event is ProfileDeleteAddress) {
    //   yield* _mapProfileDeleteAddressToState(
    //     customerId: event.customerId,
    //     address: event.address,
    //   );
    // }
  }

  Stream<ProfileState> _mapUpdateProfileToState({
    required UserUpdateInput userUpdateInput,
  }) async* {
    yield UpdateProfileInProgress();
    final dataResponse = await _profileProvider.updateProfile(
      userUpdateInput: userUpdateInput,
    );

     print("UpdateProfileInProgress :${dataResponse.data}");
    if (dataResponse.hasData) {
      yield UpdateProfileSuccess(
        user: dataResponse.data as User,
      );
    } else {
      print("UpdateProfileFailed: ${dataResponse.error}");
      yield UpdateProfileFailed(
        message: dataResponse.error?.replaceAll(" ", "_").toUpperCase() ?? "",
      );
    }
  }
  Stream<ProfileState> _mapUpdatePasswordToState({
    required String? currentPassword,
    required String? newPassword,
  }) async* {
    yield UpdatePasswordInProgress();
    final dataResponse = await _profileProvider.updatePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
    if (dataResponse.hasData) {
      yield UpdatePasswordSuccess(
        response: dataResponse.data as bool,
      );
    } else {
      yield UpdatePasswordFailed(
        message: dataResponse.error?.replaceAll(" ", "_").toUpperCase() ?? "",
      );
    }
 }
  // Stream<ProfileState> _mapForgotPasswordToState({
  //   required OtpInput? otpInput,
  //   required String? otp,
  //   required String? password,
  // }) async* {
  //   yield ForgotPasswordInProgress();
  //   final dataResponse = await _profileProvider.forgotPassword(
  //     otpInput: otpInput,
  //     otp: otp,
  //     password: password,
  //   );
  //   if (dataResponse.hasData) {
  //     yield ForgotPasswordSuccess(
  //       response: dataResponse.data.toString(),
  //     );
  //   } else {
  //     yield ForgotPasswordFailed(
  //       message: dataResponse.error?.replaceAll(" ", "_").toUpperCase() ?? "",
  //     );
  //   }
  // }
  // Stream<ProfileState> _mapSendOtpToState({
  //   required OtpInput? otpInput,
  // }) async* {
  //   yield SendOtpInProgress();
  //   final dataResponse = await _profileProvider.sendOtp(
  //     otpInput: otpInput,
  //   );
  //   if (dataResponse.hasData) {
  //     yield SendOtpSuccess(
  //       response: dataResponse.data.toString(),
  //     );
  //   } else {
  //     yield SendOtpFailed(
  //       message: dataResponse.error?.replaceAll(" ", "_").toUpperCase() ?? "",
  //     );
  //   }
  // }

  Stream<ProfileState> _mapProfileCreateAddressToState({
    required ShippingInput shippingInput,
  }) async* {
    yield UpdateProfileInProgress();

    final dataResponse = await _profileProvider.createShippingAddress(
      shippingInput: shippingInput,
    );
     print("shipping Adress${dataResponse.data}");
    if (dataResponse.hasData) {
      final shippingAddress = dataResponse.data as ShippingAddress;

      if (shippingAddress.isDefault == true) {
        userData.saveDefaultShippingAddress(shippingAddress);
      }

      yield ProfileCreateAddressSuccess();
    } else {
      yield ProfileCreateAddressFailed(
        message: dataResponse.error?.replaceAll(" ", "_").toUpperCase() ?? "",
      );
    }
  }

  Stream<ProfileState> _mapProfileEditAddressToState({
    required ShippingInput shippingInput,
    required String addressId,
    required String customerId,
  }) async* {
    yield UpdateProfileInProgress();

    final dataResponse = await _profileProvider.editShippingAddress(
      addressId: addressId,
      customerId: customerId,
      shippingInput: shippingInput,
    );

    if (dataResponse.hasData) {
      final shippingAddress = dataResponse.data as ShippingAddress;

      if (shippingAddress.isDefault == true) {
        userData.saveDefaultShippingAddress(shippingAddress);
      }

      yield ProfileEditAddressSuccess(shippingAddress: shippingAddress);
    } else {
      yield ProfileEditAddressFailed(
        message: dataResponse.error?.replaceAll(" ", "_").toUpperCase() ?? "",
      );
    }
  }

  // Stream<ProfileState> _mapProfileDeleteAddressToState({
  //   required ShippingAddress address,
  //   required String customerId,
  // }) async* {
  //   yield UpdateProfileInProgress();

  //   final dataResponse = await _profileProvider.deleteShippingAddress(
  //     addressId: address.id!,
  //     customerId: customerId,
  //   );

  //   if (dataResponse.hasData) {
  //     if (address.isDefault == true) {
  //       userData.removeUserData();
  //     }

  //     yield ProfileDeleteAddressSuccess();
  //   } else {
  //     yield ProfileDeleteAddressFailed(
  //       message: dataResponse.error?.replaceAll(" ", "_").toUpperCase() ?? "",
  //     );
  //   }
  // }
}
