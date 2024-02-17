import 'package:equatable/equatable.dart';

import '../../../../../../base_module/data/entity/models/sort_input.dart';

abstract class SubcategoryItemsEvent extends Equatable {
  const SubcategoryItemsEvent();

  @override
  List<Object?> get props => [];
}

class FetchProductsBySubcategory extends SubcategoryItemsEvent {
  final String searchKey;
  final String? subcategoryId;
  final String pincode;
  final String? categoryId;
  final bool? isFromSubCategory;
  final String? SortByPrice;
  final bool? isFilter;
  final String? brand;
 final SortType? sortType;



  FetchProductsBySubcategory(  {
    required this.searchKey,
    this.subcategoryId,
    required this.pincode, 
    this.categoryId,
    this.isFromSubCategory,
    this.SortByPrice, 
    this.isFilter,
    this.sortType,
    this.brand
    
  });

  @override
  List<Object?> get props => [
        searchKey,
        subcategoryId,
        pincode,
        categoryId,
        isFromSubCategory,
        SortByPrice,
        isFilter,
        brand,
        sortType
      ];
}

class ClearProductsBySubcategory extends SubcategoryItemsEvent {}
