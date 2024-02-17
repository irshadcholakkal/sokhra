import 'package:equatable/equatable.dart';

abstract class NewCartEvent extends Equatable{
  const NewCartEvent();
}

class FetchCartItems extends NewCartEvent{
  final String pincode;

  FetchCartItems({required this.pincode,});

  @override
  List<Object?> get props => [pincode];
}