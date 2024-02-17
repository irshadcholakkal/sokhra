import 'package:flutter/material.dart';

import '../../../app_settings_module/domain/entity/models/shipping_address.dart';
import '../../../app_settings_module/domain/entity/models/type.dart';
import '../../../base_module/data/entity/graphql_service.dart';
import '../../../base_module/data/entity/models/data_response.dart';
import '../../../base_module/data/entity/models/error_info.dart';
import '../../domain/entity/authentication.dart';
import '../../domain/user_data.dart';
import '../entity/input_models/otp_input.dart';
import '../entity/input_models/shipping_input.dart';
import '../entity/input_models/user_update_input.dart';
import '../schemas/profile_schema.dart';

class ProfileProvider {
  final _profileSchema = ProfileSchema();

  Future<DataResponse> updateProfile({
    required UserUpdateInput userUpdateInput ,
  }) async {
    try {
      print("userUpdateInput :${userUpdateInput}");
                      print("ProfileProvider :--------------${userData.customerId}++");

      final mutationOptions = graphQLService.makeMutationOptions(
        query: _profileSchema.updateProfile,
        variables: {'id': userData.customerId, 'input': userUpdateInput},
      );

                print("ProfileProvider :--------------${userData.customerId}++");

      final graphQLResponse = await graphQLService.performMutation(
        mutationOptions: mutationOptions,
      );
          print("ProfileProvider : ${graphQLResponse.data}");

      if (graphQLResponse.hasData) {
        await authentication.saveAuthenticatedUser(
          authenticatedUser: authentication.authenticatedUser?.copyWith(
            user: authentication.user?.copyWith(
              name: userUpdateInput.name,
              lastname: userUpdateInput.lastname,
              phone: userUpdateInput.phone,
              email: userUpdateInput.email,
            ),
          ),
        );

        return DataResponse(
          data: authentication.user,
        );
      } else {
        final errorInfo = graphQLResponse.error!;

        debugPrint("ProfileProvider.updateProfile:Error:${errorInfo.message}");

        return DataResponse(
          error: errorInfo.type,
        );
      }
    } catch (e) {
      debugPrint("ProfileProvider.updateProfile:Exception:$e");
    }

    return DataResponse(
      error: ErrorType.SOME_ERROR,
    );
  }

  Future<DataResponse> updatePassword({
    required String? currentPassword,
    required String? newPassword,
  }) async {
    try {
      final mutationOptions = graphQLService.makeMutationOptions(
        query: _profileSchema.updatePassword,
        variables: {
          'input': {
            'currentPassword': currentPassword,
            'newPassword': newPassword,
          }
        },
      );

      final graphQLResponse = await graphQLService.performMutation(
        mutationOptions: mutationOptions,
      );

      if (graphQLResponse.hasData) {
        return DataResponse(
          data: graphQLResponse.data["updatePassword"],
        );
      } else {
        final errorInfo = graphQLResponse.error!;

        debugPrint(
          "ProfileProvider.updatePassword:Error:${errorInfo.message}",
        );

        return DataResponse(
          error: errorInfo.type,
        );
      }
    } catch (e) {
      debugPrint("ProfileProvider.updatePassword:Exception:$e");
    }

    return DataResponse(
      error: ErrorType.SOME_ERROR,
    );
  }

  Future<DataResponse> forgotPassword({
    required OtpInput? otpInput,
    required String? otp,
    required String? password,
  }) async {
    try {
      final mutationOptions = graphQLService.makeMutationOptions(
        query: _profileSchema.forgotPassword,
        variables: {
          'input': {
            'email': otpInput?.email,
            'otp': otp,
            'password': password,
          }
        },
      );

      final graphQLResponse = await graphQLService.performMutation(
        mutationOptions: mutationOptions,
      );

      if (graphQLResponse.hasData) {
        return DataResponse(
          data: graphQLResponse.data["forgotPassword"],
        );
      } else {
        final errorInfo = graphQLResponse.error!;

        debugPrint(
          "ProfileProvider.forgotPassword:Error:${errorInfo.message}",
        );

        return DataResponse(
          error: errorInfo.type,
        );
      }
    } catch (e) {
      debugPrint("ProfileProvider.forgotPassword:Exception:$e");
    }

    return DataResponse(
      error: ErrorType.SOME_ERROR,
    );
  }

  Future<DataResponse> sendOtp({
    required OtpInput? otpInput,
  }) async {
    try {
      final mutationOptions = graphQLService.makeMutationOptions(
        query: _profileSchema.sendOtp,
        variables: {
          'email': otpInput?.email,
        },
      );

      final graphQLResponse = await graphQLService.performMutation(
        mutationOptions: mutationOptions,
      );

      if (graphQLResponse.hasData) {
        return DataResponse(
          data: graphQLResponse.data["sentOtp"],
        );
      } else {
        final errorInfo = graphQLResponse.error!;

        debugPrint(
          "ProfileProvider.sendOtp:Error:${errorInfo.message}",
        );

        return DataResponse(
          error: errorInfo.type,
        );
      }
    } catch (e) {
      debugPrint("ProfileProvider.sendOtp:Exception:$e");
    }

    return DataResponse(
      error: ErrorType.SOME_ERROR,
    );
  }

  Future<DataResponse> createShippingAddress({
    required ShippingInput shippingInput,
  }) async {
    try {
      final mutationOptions = graphQLService.makeMutationOptions(
        query: _profileSchema.createShippingDetails,
        variables: {
          'input': {
            'type': shippingInput.type.toString().split('.').last,
            'phone': shippingInput.phone,
            'email': shippingInput.email,
            'address': shippingInput.address,
            'firstName': shippingInput.firstName,
            'house': shippingInput.house,
            'pincode': shippingInput.pincode,
            'landmark': shippingInput.landmark,
            'lat': shippingInput.lat?.toString(),
            'lng': shippingInput.lng?.toString(),
            'isDefault': shippingInput.isDefault,
            'note':shippingInput.note,
            'street':shippingInput.street,
            'zone':shippingInput.zone,
          

          },
        },
      );

      final graphQLResponse = await graphQLService.performMutation(
        mutationOptions: mutationOptions,
      );

      if (graphQLResponse.hasData) {
        final shippingAddress = ShippingAddress(
          type: shippingInput.type,
          phone: shippingInput.phone,
          email: shippingInput.email,
          address: shippingInput.address,
          firstName: shippingInput.firstName,
          house: shippingInput.house,
          pincode: shippingInput.pincode,
          landmark: shippingInput.landmark,
          lat: shippingInput.lat?.toString(),
          lng: shippingInput.lng?.toString(),
          zone: shippingInput.zone,
          flatno: shippingInput.flatno,
          floorno: shippingInput.floorno,
          note: shippingInput.note ,
          neighborhoodname: shippingInput.neighborhoodname ,
          isDefault: shippingInput.isDefault,
        );

        return DataResponse(data: shippingAddress);
      } else {
        final errorInfo = graphQLResponse.error!;

        debugPrint(
          "Profile Provider createShippingAddress :Error:${errorInfo.message}",
        );

        return DataResponse(error: errorInfo.type);
      }
    } catch (e) {
      debugPrint("ProfileProvider.createShippingAddress:Exception:$e");
    }

    return DataResponse(error: ErrorType.SOME_ERROR);
  }

  Future<DataResponse> editShippingAddress({
    required ShippingInput shippingInput,
    required String addressId,
    required String customerId,
    
  }) async {
    print(shippingInput.type);
    try {
      final mutationOptions = graphQLService.makeMutationOptions(
        query: _profileSchema.editShippingAddress,
        
        variables: {
          'addressId': addressId,
          'customerId': customerId,
          'input': {
            'type':  shippingInput.type.toString().split('.').last,
            'phone': shippingInput.phone,
            'email': shippingInput.email,
            'address': shippingInput.address,
            'firstName': shippingInput.firstName,
            'house': shippingInput.house,
            'pincode': shippingInput.pincode,
            'landmark': shippingInput.landmark,
            'lat': shippingInput.lat?.toString(),
            'lng': shippingInput.lng?.toString(),
            'zone':shippingInput.zone,
            'note':shippingInput.note,
            'isDefault': shippingInput.isDefault,
            
          },
          
        },
        
      );

      final graphQLResponse = await graphQLService.performMutation(
        mutationOptions: mutationOptions,
      );

      if (graphQLResponse.hasData) {
        final shippingAddress = ShippingAddress(
          id: addressId,
          type: shippingInput.type,
          phone: shippingInput.phone,
          email: shippingInput.email,
          address: shippingInput.address,
          firstName: shippingInput.firstName,
          house: shippingInput.house,
          pincode: shippingInput.pincode,
          landmark: shippingInput.landmark,
          lat: shippingInput.lat?.toString(),
          lng: shippingInput.lng?.toString(),
          flatno: shippingInput.flatno,
          floorno: shippingInput.floorno,
          neighborhoodname:shippingInput.neighborhoodname ,
          note:shippingInput.note ,
          isDefault: shippingInput.isDefault,
        );

        return DataResponse(data: shippingAddress);
      } else {
        final errorInfo = graphQLResponse.error!;

        debugPrint(
          "Profile Provider editShippingAddress :Error:${errorInfo.message}",
        );

        return DataResponse(error: errorInfo.type);
      }
    } catch (e) {
      debugPrint("ProfileProvider.editShippingAddress:Exception:$e");
    }

    return DataResponse(error: ErrorType.SOME_ERROR);
  }

  Future<DataResponse> deleteShippingAddress({
    required String addressId,
    required String customerId,
  }) async {
    try {
      final mutationOptions = graphQLService.makeMutationOptions(
        query: _profileSchema.deleteShippingAddress,
        variables: {
          'addressId': addressId,
          'customerId': customerId,
        },
      );

      final graphQLResponse = await graphQLService.performMutation(
        mutationOptions: mutationOptions,
      );

      if (graphQLResponse.hasData) {
        return DataResponse(data: graphQLResponse.data);
      } else {
        final errorInfo = graphQLResponse.error!;

        debugPrint(
          "Profile Provider deleteShippingAddress :Error:${errorInfo.message}",
        );

        return DataResponse(error: errorInfo.type);
      }
    } catch (e) {
      debugPrint("ProfileProvider.deleteShippingAddress:Exception:$e");
    }

    return DataResponse(error: ErrorType.SOME_ERROR);
  }
}
