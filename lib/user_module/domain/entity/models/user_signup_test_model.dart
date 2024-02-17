
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_signup_test_model.g.dart';

@JsonSerializable()
class User  extends Equatable{
  @JsonKey(name: '_id')
  final String id;

  User({required this.id});

  @override
  List<Object> get props => [id];
  factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);
  Map<String,dynamic> toJson() => _$UserToJson(this);
}



@JsonSerializable()
class SignUp   extends Equatable{
  final User user;
  final  String token;

  SignUp({required this.user, required this.token});

  @override
  List<Object> get props => [user,token];
  factory SignUp.fromJson(Map<String,dynamic> json) => _$SignUpFromJson(json);
  Map<String,dynamic> toJson() => _$SignUpToJson(this);
}



@JsonSerializable()
class SignUpTestModel   extends Equatable{
  final SignUp signUp;
 
  SignUpTestModel({required this.signUp});

  @override
  List<Object> get props => [signUp];
  factory SignUpTestModel.fromJson(Map<String,dynamic> json) => _$SignUpTestModelFromJson(json);
  Map<String,dynamic> toJson() => _$SignUpTestModelToJson(this);
}
