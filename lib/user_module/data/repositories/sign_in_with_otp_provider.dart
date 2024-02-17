
import 'package:flutter/material.dart';

import '../../../base_module/data/entity/graphql_service.dart';
import '../../../base_module/data/entity/models/data_response.dart';
import '../../../base_module/data/entity/models/error_info.dart';
import '../../domain/entity/authentication.dart';
import '../../domain/entity/models/authenticated_user.dart';
import '../schemas/sign_in_with_otp_schema.dart';

class SignInWithOTPProvider {
  SignInPasswordSchema _signInWithOTPSchema = SignInPasswordSchema();
  Future<DataResponse> signWithPassword(
      {required String password, required String phone}) async {
    try {
      print("SignInWithOTPProvider${phone}--${password}");
      final mutationOptions = GraphQLService().makeMutationOptions(
        query: _signInWithOTPSchema.userSignIn,
        variables: {
          "phone": phone,
          "password": password,
        },
      );

      final graphQLResponse = await GraphQLService().performMutation(
        mutationOptions: mutationOptions,
      );

      if (graphQLResponse.hasData) {
        final authenticatedUser = AuthenticatedUser.fromJson(
          graphQLResponse.data["userSignIn"] as Map<String, dynamic>,
        );

        await authentication.saveAuthenticatedUser(
          authenticatedUser: authenticatedUser,
        );

        return DataResponse(
          data: 
          //graphQLResponse.data
          authenticatedUser,
        );
      } else {
        final errorInfo = graphQLResponse.error!;

        debugPrint(
          "SignInWithOTPProvider.signIn:Error : ${errorInfo.message}",
        );

        return DataResponse(
          error: errorInfo.type,
        );
      }
    } catch (e) {
      debugPrint("SignInWithOTPProvider.signIn : Exception : $e");
    }
    return DataResponse(
      error: ErrorType.SOME_ERROR,
    );
  }
}
