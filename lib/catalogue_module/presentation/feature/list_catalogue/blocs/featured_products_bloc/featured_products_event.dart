import 'package:equatable/equatable.dart';

abstract class ListFeaturedProductsEvent extends Equatable{
  const ListFeaturedProductsEvent();
}

class FetchFeaturedProducts extends ListFeaturedProductsEvent{
  final String? pincode;
  final double? lat;
  final double? lng;

  FetchFeaturedProducts({this.pincode,this .lat,this.lng});

  @override
  List<Object?> get props => [pincode,lat,lng];
}