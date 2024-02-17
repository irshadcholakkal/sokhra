import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sub_category_state.dart';

class SubCategoryCubit extends Cubit<SubCategoryState> {
  SubCategoryCubit() : super(SubCategoryLoaded(selectedIndex: 0));

  setIndex({required int index}) =>
      emit(SubCategoryLoaded(selectedIndex: index));
}
