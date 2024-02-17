
import 'package:equatable/equatable.dart';

abstract class LoadSignUpTestEvent extends Equatable {
  const LoadSignUpTestEvent();
}

class SignUpTest extends LoadSignUpTestEvent {
  final String phone;
  final String password;
  final String name;
  final String email;
  

  SignUpTest({required this.phone,required this.password, required this.name, required this.email});

  @override
  List<Object> get props => [phone,password,name,email];
}
