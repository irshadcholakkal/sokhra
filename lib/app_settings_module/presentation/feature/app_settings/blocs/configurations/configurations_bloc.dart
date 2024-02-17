import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../base_module/data/entity/models/data_response.dart';
import '../../../../../data/entity/settings_list.dart';
import '../../../../../data/repositories/app_data_provider.dart';

part 'configurations_event.dart';
part 'configurations_state.dart';

class ConfigurationsBloc
    extends Bloc<ConfigurationsEvent, ConfigurationsState> {
  ConfigurationsBloc() : super(ConfigurationsFetchInitialState());
  final _appDataProvider = AppDataProvider();
  String? _defaultPincode;
  String get defaultPincode => _defaultPincode ?? "";

  @override
  Stream<ConfigurationsState> mapEventToState(
      ConfigurationsEvent event) async* {
    if (event is ConfigurationsFetchEvent) {
      yield ConfigurationsFetchLoadingState();
      try {
        final DataResponse response =
            await _appDataProvider.getConfigurations(reFetch: event.reFetch);

        if (response.hasData) {
          final SettingsList data = SettingsList.fromJson(response.data);
          _defaultPincode = (data.settings ?? []).isNotEmpty
              ? data.settings?.first.defaultPincode
              : "";
          log("defaultPinCOde is $defaultPincode ${response.data}");
          yield ConfigurationsFetchSuccessState(data: data);
        } else {
          yield ConfigurationsFetchFailedState(
              error: response.error?.replaceAll("_", " ") ??
                  "SOMETHING WENT WRONG");
        }
      } catch (e) {
        log("Exception occurred in ConfigurationBloc :$e");
        yield ConfigurationsFetchFailedState(error: "SOMETHING WENT WRONG");
      }
    }
  }
}
