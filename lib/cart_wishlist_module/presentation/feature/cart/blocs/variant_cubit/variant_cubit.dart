import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../../catalogue_module/domain/models/sub_choices.dart';

import '../../../../../../catalogue_module/domain/models/variant.dart';

part 'variant_state.dart';

class VariantCubit extends Cubit<VariantState> {
  VariantCubit() : super(VariantLoadingState());

  Variant? _variant;

  Variant? get variant => _variant;

  SubChoice ? _subChoice;
  SubChoice ? get subChoice => _subChoice;

  setVariant({required Variant? variant, SubChoice ?subChoice}) {
    this._variant = variant;
    // debugPrint("choice id is ${choice?.name}");
    emit(VariantLoadedState(variant: variant,subChoice: subChoice));
  }

  // setSubChoice({required Variant? variant, required SubChoice? subChoice}){
  //   this._variant = variant; this._subChoice =subChoice;
  //   emit(SubChoiceLoadedState(subChoice: subChoice));
  // }

}
