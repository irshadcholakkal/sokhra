import 'package:equatable/equatable.dart';

import '../../../../../domain/models/products_by_subcategory_model.dart';

abstract class ListFeaturedProductsState extends Equatable {
  const ListFeaturedProductsState();
}

class FeaturedProductsLoading extends ListFeaturedProductsState {
  @override
  List<Object?> get props => [];
}

class FeaturedProductsLoaded extends ListFeaturedProductsState {
  final List<Product> featuredProducts;

  FeaturedProductsLoaded({required this.featuredProducts});

  @override
  List<Object?> get props => [featuredProducts];
}

class FeaturedProductsLoadingFailed extends ListFeaturedProductsState {
  @override
  List<Object?> get props => [];
}
