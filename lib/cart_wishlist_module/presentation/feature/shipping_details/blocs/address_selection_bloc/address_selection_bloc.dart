import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../app_settings_module/domain/entity/models/shipping_address.dart';

part 'address_selection_event.dart';
part 'address_selection_state.dart';

class AddressSelectionBloc
    extends Bloc<AddressSelectionEvent, AddressSelectionState> {
  AddressSelectionBloc() : super(AddressSelectionLoading());

  @override
  Stream<AddressSelectionState> mapEventToState(
      AddressSelectionEvent event) async* {
    if (event is AddressSelectionSetEvent) {
      yield AddressSelectionLoading();

      if (event.address != null && event.addressText != null) {
        yield AddressSelectionSuccess(
            address: event.address!, addressText: event.addressText);
      } else {
        yield AddressSelectionFailed();
      }
    }
  }
}
