
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../base_module/data/entity/models/data_response.dart';
import '../../../../../../user_module/domain/user_data.dart';
import '../../../../../data/repositories/catalogue_provider.dart';
import '../../../../../domain/models/delivery_check_response.dart';
import '../loctaion_check_cubit/location_check_cubit.dart';

part 'delivery_check_state.dart';

const String PINCODE = "PINCODE";

class DeliveryCheckCubit extends Cubit<DeliveryCheckState> {
  DeliveryCheckCubit() : super(DeliveryCheckInitial()) {
    userData.onDefaultShippingAddressChange.listen((event) {
      checkPinCode(pincode: userData.pinCode, isByEmitter: true);
    });
  }

  final _catalogueProvider = CatalogueProvider();
  String _pinCode = "";

  String get pinCode => _pinCode;
  String _place = "";

  String get place => _place;

  checkPinCode({
    required String pincode,
    double? lat,
    double? lng,
    String? place,
    LocationDetails? locationDetails,
    bool isByEmitter = false,
  }) async {
    emit(DeliveryCheckLoading());

    final DataResponse _dataResponse = await _catalogueProvider.deliveryCheck(
      pincode: pincode,
    );

    if (_dataResponse.hasData) {
      DeliveryCheckResponse response = DeliveryCheckResponse.fromJson(
        _dataResponse.data,
      );

      emit(DeliveryCheckSuccess(
        data: response,
        locationDetails: locationDetails,
        isByEmitter: isByEmitter,
      ));
    } else {
      emit(DeliveryCheckFailed(
        message:
            _dataResponse.error ?? "Service unavailable at selected location",
      ));
    }
  }
}
