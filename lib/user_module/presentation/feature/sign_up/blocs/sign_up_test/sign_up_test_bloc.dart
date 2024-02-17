import 'package:bloc/bloc.dart';

import '../../../../../../base_module/data/entity/models/data_response.dart';
import '../../../../../data/repositories/user_signup_test_provider.dart';
import 'sign_up_test_event.dart';
import 'sign_up_test_state.dart';

class AddToCartBloc extends Bloc<LoadSignUpTestEvent, LoadSignUpTestState> {
  UserSignUpTestProvider _signUpTestProvider = UserSignUpTestProvider();
  AddToCartBloc() : super(ListLoading());

  @override
  Stream<LoadSignUpTestState> mapEventToState(
      LoadSignUpTestEvent event) async* {
    if (event is SignUpTest) {
      yield ListLoading();
      final result = await _signUpTestProvider.signUp(
          phone_no: event.phone,
          user_password: event.password,
          user_name: event.name,
          email_id: event.email);

      if (result.hasData) {
        DataResponse(data: "product added");
      }
    }
  }
}
