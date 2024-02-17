import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../base_module/data/entity/models/sort_input.dart';

part 'sort_state.dart';

class SortCubit extends Cubit<SortState> {
  SortCubit() : super(SortLoading());

  setSortType({required SortInput? sortInput}) async {
    emit(SortLoading());
    emit(SortSuccess(sortInput: sortInput));
  }
}
