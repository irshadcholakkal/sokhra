part of 'recent_ordered_products_bloc.dart';

abstract class RecentOrderedProductsEvent extends Equatable {
  const RecentOrderedProductsEvent();

  @override
  List<Object> get props => [];
}

class FetchRecentOrderedProducts extends RecentOrderedProductsEvent {}
