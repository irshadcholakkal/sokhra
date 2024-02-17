import 'package:equatable/equatable.dart';

import '../../../../../domain/models/category_model.dart';

abstract class ListAllCategoriesState extends Equatable {
  const ListAllCategoriesState();
}

class AllCategoriesLoading extends ListAllCategoriesState {
  @override
  List<Object?> get props => [];
}

class AllCategoriesLoaded extends ListAllCategoriesState {
  final List<Category> categories;

  AllCategoriesLoaded({required this.categories});

  @override
  List<Object?> get props => [categories];
}

class AllCategoriesLoadingFailed extends ListAllCategoriesState {
  @override
  List<Object?> get props => [];
}
