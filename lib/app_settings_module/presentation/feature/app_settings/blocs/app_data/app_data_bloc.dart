import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../base_module/domain/entity/translation.dart';
import '../../../../../../user_module/domain/user_data.dart';
import '../../../../../data/repositories/app_data_provider.dart';
import '../../../../../domain/entity/models/app_data.dart';

part 'app_data_event.dart';
part 'app_data_state.dart';

const String DEFAULT_FIRSTNAME = "DEFAULT_FIRSTNAME";
const String DEFAULT_LASTNAME = "DEFAULT_LASTNAME";
const String DEFAULT_PINCODE = "DEFAULT_PINCODE";
const String DEFAULT_PHONE = "DEFAULT_PHONE";
const String DEFAULT_ADDRESS_MAP = "DEFAULT_ADDRESS_MAP";

class AppDataBloc extends Bloc<AppDataEvent, AppDataState> {
  final _appDataProvider = AppDataProvider();

  AppDataBloc() : super(AppDataInitial());

  @override
  Stream<AppDataState> mapEventToState(AppDataEvent event) async* {
    if (event is FetchAppData) {
      yield* _mapFetchAppDataToState(
        currentState: state,
        reFetch: event.reFetch,
      );
    } else if (event is ClearAppData) {
      yield* _mapClearAppDataToState(
        currentState: state,
      );
    }
  }

  Stream<AppDataState> _mapFetchAppDataToState({
    required AppDataState currentState,
    required bool reFetch,
  }) async* {
    if (reFetch) {
      yield FetchAppDataInProgress();
    }

    final dataResponse = await _appDataProvider.getAppData(
      reFetch: reFetch,
    );
  print("AppDataBloc :-${dataResponse.data}=-=${currentState.data}");

    if (dataResponse.hasData) {
      AppData response = dataResponse.data as AppData;
      String defaultAddress = "";
      String defaultAddressMap = "";

      response.addressDetails?.forEach((element) {
        if (element.isDefault == true) {
          defaultAddressMap = json.encode(element.toJson());
          defaultAddress = ("House/Flat :" +
              (element.house ?? "") +
              "\n" +
              "Street :" +
              (element.street ?? "n/a") +
              "\n" +
              "Post :" +
              (element.post ?? "n/a") +
              "\n" +
              "District :" +
              (element.district ?? "n/a") +
              "\n" +
              "State :" +
              (element.state ?? "n/a") +
              "\n" +
              ("Pincode :" + (element.pincode ?? translation.of("n/a"))) +
              "\n" +
              ("Landmark :" + (element.landmark ?? translation.of("n/a"))) +
              "\n" +
              // "Type :" +
              // "${element.type == null ? translation.of("n/a") : StringModifiers.enumToString(element.type)?.replaceAll("_", " ")}" +
              // "\n"
                  "Phone :" +
              ((element.phone ?? translation.of("n/a"))));
        }
      });
      final _sharedPreference = await SharedPreferences.getInstance();
      _sharedPreference.setString(DEFAULT_ADDRESS_MAP, defaultAddressMap);
      _sharedPreference.setString(ADDRESS, defaultAddress);
      yield FetchAppDataSuccess(
        appData: response,
      );
      await userData.getUserData();
    } else if (reFetch && currentState is FetchAppDataSuccess) {
      yield FetchAppDataFailed(
        message: dataResponse.error?.replaceAll(" ", "_").toUpperCase() ?? "",
      );

      yield currentState;
    } else {
      yield FetchAppDataFailed(
        message: dataResponse.error?.replaceAll(" ", "_").toUpperCase() ?? "",
      );
    }
  }

  Stream<AppDataState> _mapClearAppDataToState({
    required AppDataState currentState,
  }) async* {
    if (currentState is FetchAppDataSuccess) {
      yield FetchAppDataSuccess(
        appData: currentState.appData,
      );
    } else {
      yield currentState;
    }
  }
}
