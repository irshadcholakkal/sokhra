import 'package:flutter/material.dart';

import '../../../base_module/data/entity/graphql_service.dart';
import '../../../base_module/data/entity/models/data_response.dart';
import '../../../base_module/domain/entity/app.dart';
import '../schemas/user_signup_test_schema.dart';

class UserSignUpTestProvider {
  UserSignUpTestSchema _signUpTestSchema = UserSignUpTestSchema();

  Future<DataResponse> signUp(
      {required String phone_no,
      required String user_password,
      required String user_name,
      required String email_id}) async {
    try {
      final mutationOptions = GraphQLService().makeMutationOptions(
        query: _signUpTestSchema.userSignUpTestSchema,
        variables: {
          'input': {
            'phone': "",
            'password': 1,
            'name': 1,
            'email': 1,
            'deviceId': app.deviceId,
          },
        },
      );

      final graphQLResponse = await GraphQLService().performMutation(
        mutationOptions: mutationOptions,
      );

      if (graphQLResponse.hasData) {
        return DataResponse(data: graphQLResponse.data);
      } else {
        return DataResponse(error: graphQLResponse.error?.message);
      }
    } catch (e) {
      debugPrint("addtocartprovider" + e.toString());
    }
    return DataResponse(error: "SOME ERROR");
  }
}
