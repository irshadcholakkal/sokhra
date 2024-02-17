part of 'sub_category_cubit.dart';

abstract class SubCategoryState extends Equatable {
  const SubCategoryState();
  @override
  List<Object?> get props => [];
}

class SubCategoryLoaded extends SubCategoryState {
  final int selectedIndex;

  SubCategoryLoaded({required this.selectedIndex});
  @override
  List<Object?> get props => [selectedIndex];
}
