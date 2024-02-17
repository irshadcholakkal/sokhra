import 'package:flutter/material.dart';

import '../../../base_module/data/entity/graphql_service.dart';
import '../../../base_module/data/entity/models/data_response.dart';
import '../schemas/sign_in_sent_otp_schema.dart';

class SignInSentOTPProvider {
  SignInSentOTPSchema _signInSentOTPSchema = SignInSentOTPSchema();

  Future<DataResponse> sendOTP({required String phone}) async {
    try {
      final mutationOptions = GraphQLService().makeMutationOptions(
        query: _signInSentOTPSchema.sendOTP,
        variables: {
          "phone": phone,
        },
      );

      final graphQLResponse = await GraphQLService().performMutation(
        mutationOptions: mutationOptions,
      );

      if (graphQLResponse.hasData) {
        return DataResponse(
          data: graphQLResponse.data,
        );
      } else {
        return DataResponse(
          error: graphQLResponse.error!.message,
        );
      }
    } catch (e) {
      print("bbbbbbb2");
      debugPrint("SignInSentOTPProvider " + e.toString());
    }
    return DataResponse(error: "SOME ERROR");
  }
}
