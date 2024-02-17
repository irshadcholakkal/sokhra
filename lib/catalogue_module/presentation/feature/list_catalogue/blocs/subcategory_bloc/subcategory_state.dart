import 'package:equatable/equatable.dart';

import '../../../../../domain/models/products_by_subcategory_model.dart';

abstract class SubcategoryItemsState extends Equatable {
  const SubcategoryItemsState();
}

class SubcategoryItemsLoading extends SubcategoryItemsState {
  @override
  List<Object?> get props => [];
}

class SubcategoryItemsLoaded extends SubcategoryItemsState {
  final List<Product> products;

  SubcategoryItemsLoaded({required this.products});

  @override
  List<Object?> get props => [products];
}

class SubcategoryItemsLoadingFailed extends SubcategoryItemsState {
  final String? errorMessage;

  SubcategoryItemsLoadingFailed({this.errorMessage});

  @override
  List<Object?> get props => [
        errorMessage,
      ];
}
