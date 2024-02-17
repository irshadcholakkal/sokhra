import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lumiereorganics_app/user_module/data/entity/input_models/get_all_zones.dart';
import 'package:lumiereorganics_app/user_module/data/entity/input_models/zones.dart';

import '../../../../../data/repositories/get_all_available_zone_provider.dart';

part 'get_all_available_zone_event.dart';
part 'get_all_available_zone_state.dart';

class GetAllZoneBloc extends Bloc<GetAllZoneEvent, GetAllZoneState> {
  ZoneProvider _zoneProvider = ZoneProvider();
  GetAllZoneBloc() : super(GetAllZoneInitial()) {
    on<GetAllZoneEvent>((event, emit) async {
      if (event is GetAllZone) {
        emit(GetAllZoneLoading());
        try {
          final dataResponse = await _zoneProvider.getAllZones();
          print("getAllZones==============R${dataResponse.data}");
          if (dataResponse.hasData) {
            final zone = GetAllZones.fromJson(
              dataResponse.data["getAllZones"] as Map<String, dynamic>,
            );
            print("GetAllZoneBloc extends Bloc<GetAllZoneEvent, GetAllZoneState>${zone}");
            if(zone.zones!=null){
              print("Zones =- ${zone.zones}");
              emit(GetAllZoneLoaded(zones:zone.zones ));
            }
          }
        } catch (e) {
          emit(GetAllZoneFailed());
        }
      }
    });
  }
}
