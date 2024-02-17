part of 'products_list_bloc.dart';

abstract class ProductsListEvent extends Equatable {
  const ProductsListEvent();

  @override
  List<Object?> get props => [];
}

class ProductsListFetchEvent extends ProductsListEvent {
  final String? subCategoryId;
  final bool reFetch;
  final String categoryId;
  final SortInput? sortInput;
  final String pincode;
  final double lat;
  final double lng;


  ProductsListFetchEvent({
    this.subCategoryId = "",
    required this.categoryId,
    this.reFetch = false,
    this.sortInput,
    this.pincode = "",
    required this.lat,
    required this.lng
  });

  @override
  List<Object?> get props =>
      [subCategoryId, reFetch, categoryId, sortInput, pincode];
}
