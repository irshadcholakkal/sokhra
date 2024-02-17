import 'package:flutter/material.dart';
import 'package:lumiereorganics_app/base_module/presentation/util/util.dart';

import '../../../base_module/data/entity/graphql_service.dart';
import '../../../base_module/data/entity/models/data_response.dart';
import '../../../base_module/data/entity/models/error_info.dart';
import '../../../base_module/data/entity/models/graphql_response.dart';
import '../../../base_module/domain/entity/app.dart';
import '../../domain/entity/authentication.dart';
import '../../domain/entity/models/authenticated_user.dart';
// import 'package:armino_ecom/firebase_module/data/repositories/flutter_fire_provider.dart';
import '../entity/input_models/otp_input.dart';
import '../entity/input_models/sign_in_input.dart';
import '../entity/input_models/sign_up_input.dart';
import '../schemas/user_schema.dart';

class UserProvider {
  final _userSchema = UserSchema();

  Future<DataResponse> signIn({
    required SignInInput signInInput,
  }) async {
    try {
      final mutationOptions = graphQLService.makeMutationOptions(
        query: _userSchema.signIn,
        variables: {
          'input': {
            "phone": signInInput.username,
            "password": signInInput.password,
            "deviceId": app.deviceId
            // ...signInInput.toJson(),
            //    'deviceId': "123",
            //  'firebaseToken': flutterFireProvider.firebaseToken,
          },
        },
      );

      final graphQLResponse = await graphQLService.performMutation(
        mutationOptions: mutationOptions,
      );

      if (graphQLResponse.hasData) {
        final authenticatedUser = AuthenticatedUser.fromJson(
          graphQLResponse.data["signIn"] as Map<String, dynamic>,
        );

        await authentication.saveAuthenticatedUser(
          authenticatedUser: authenticatedUser,
        );
       print("authenticatedUser :${authenticatedUser}");
        return DataResponse(
          data: authenticatedUser,
        );
        
      } else {
        final errorInfo = graphQLResponse.error!;

        debugPrint(
          "UserProvider.signIn:Error:${errorInfo.message}",
        );

        return DataResponse(
          error: errorInfo.type,
        );
      }
    } catch (e) {
      debugPrint("UserProvider.signIn:Exception:$e");
    }

    return DataResponse(
      error: ErrorType.SOME_ERROR,
    );
  }

  Future<DataResponse> signUp({
    required SignUpInput signUpInput,
  }) async {
    try {
      final mutationOptions = graphQLService.makeMutationOptions(
        query: _userSchema.signUp,
        variables: {
          'input': {
            // ...signUpInput.toJson(),
            "phone": signUpInput.phone,
            "password": signUpInput.password,
            "name": signUpInput.name,
            "lastname": signUpInput.lastName,
            "email": signUpInput.email,
            "deviceId": app.deviceId,
             "avatar":signUpInput.avatar != null
                ? await util.getBase64(signUpInput.avatar!)
                : null,
            // 'firebaseToken': flutterFireProvider.firebaseToken,
            //  "phone": "123456789",
            // "password": "123456",
            //  "name": "firstName",
            //  "email": "signUpInput@email.com",
            // "deviceId":"123",
          },
        },
      );

      final graphQLResponse = await graphQLService.performMutation(
        mutationOptions: mutationOptions,
      );

      if (graphQLResponse.hasData) {
        final authenticatedUser = AuthenticatedUser.fromJson(
          graphQLResponse.data["signUp"] as Map<String, dynamic>,
        );

        await authentication.saveAuthenticatedUser(
          authenticatedUser: authenticatedUser,
        );

        return DataResponse(
          data: authenticatedUser,
        );
      } else {
        final errorInfo = graphQLResponse.error!;

        debugPrint(
          "UserProvider.signUp:Error:${errorInfo.message}",
        );

        return DataResponse(
          error: errorInfo.type,
        );
      }
    } catch (e) {
      debugPrint("UserProvider.signUp:Exception:$e");
    }

    return DataResponse(
      error: ErrorType.SOME_ERROR,
    );
  }

  Future<DataResponse> sendSignUpOtp({
    required OtpInput otpInput,
  }) async {
    try {
      final mutationOptions = graphQLService.makeMutationOptions(
        query: _userSchema.sendSignUpOtp,
        variables: {
          'input': otpInput,
        },
      );

      final graphQLResponse = await graphQLService.performMutation(
        mutationOptions: mutationOptions,
      );

      if (graphQLResponse.hasData) {
        return DataResponse(
          data: graphQLResponse.data["signUpOtp"],
        );
      } else {
        final errorInfo = graphQLResponse.error!;

        debugPrint(
          "UserProvider.sendSignUpOtp:Error:${errorInfo.message}",
        );

        return DataResponse(
          error: errorInfo.type,
        );
      }
    } catch (e) {
      debugPrint("UserProvider.sendSignUpOtp:Exception:$e");
    }

    return DataResponse(
      error: ErrorType.SOME_ERROR,
    );
  }

  Future<DataResponse> signOut() async {
    try {
      final mutationOptions = graphQLService.makeMutationOptions(
        query: _userSchema.signOut,
        variables: {
          'input': {
            'deviceId': app.deviceId,
            // 'firebaseToken': flutterFireProvider.firebaseToken,
          },
        },
      );

      final graphQLResponse = await graphQLService.performMutation(
        mutationOptions: mutationOptions,
      );

      if (graphQLResponse.hasData) {
        await authentication.setAuthenticatedUser();
        graphQLService.resetCache();
        // await flutterFireProvider.resetToken();
        // await app.setPickedLocation();
        await app.setPersonalDetails();
        await app.setLastNotification();

        return DataResponse(
          data: "SUCCESS",
        );
      } else {
        final errorInfo = graphQLResponse.error!;

        debugPrint(
          "UserProvider.signOut:Error:${errorInfo.message}",
        );

        return DataResponse(
          error: errorInfo.type,
        );
      }
    } catch (e) {
      debugPrint("UserProvider.signOut:Exception:$e");
    }

    return DataResponse(
      error: ErrorType.SOME_ERROR,
    );
  }

  Future<DataResponse> sendOtp({
    required String phoneNumber,
  }) async {
    try {
      final mutationOptions = graphQLService
          .makeMutationOptions(query: _userSchema.sendOTP, variables: {
        "phone": phoneNumber,
      });
      final graphQLResponse = await graphQLService.performMutation(
          mutationOptions: mutationOptions);

      if (graphQLResponse.hasData) {
        return DataResponse(
          data: graphQLResponse.data["sendOTP"],
        );
      } else {
        final errorInfo = graphQLResponse.error!;

        debugPrint(
          "UserProvider.sendSignUpOtp:Error:${errorInfo.message}",
        );
        return DataResponse(
          data: errorInfo.type,
        );
      }
    } catch (e) {
      debugPrint("UserProvider.sendSignUpOtp:Exception:$e");
    }
    return DataResponse(
      data: ErrorType.SOME_ERROR,
    );
  }

  Future<DataResponse> verifyOtp({
    required String phoneNumber,
    required String otp,
  }) async {
    try {
      final mutationOptions = graphQLService
          .makeMutationOptions(query: _userSchema.validateOTP, variables: {
        "phone": phoneNumber,
        "otp":otp,
      });
      final graphQLResponse = await graphQLService.performMutation(
          mutationOptions: mutationOptions);

      if (graphQLResponse.hasData) {
        return DataResponse(
          data: graphQLResponse.data["validateOTP"],
        );
      } else {
        final errorInfo = graphQLResponse.error!;

        debugPrint(
          "UserProvider.validateOtp:Error:${errorInfo.message}",
        );
        return DataResponse(
          data: errorInfo.type,
        );
      }
    } catch (e) {
      debugPrint("UserProvider.validateOtp:Exception:$e");
    }
    return DataResponse(
      data: ErrorType.SOME_ERROR,
    );
  }
}
