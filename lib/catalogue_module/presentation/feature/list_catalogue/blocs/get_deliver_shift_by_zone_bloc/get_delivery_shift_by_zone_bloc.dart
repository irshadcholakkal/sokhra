import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../../../data/repositories/catalogue_provider.dart';
import '../../../../../domain/models/delivery_shift.dart';



part 'get_delivery_shift_by_zone_event.dart';
part 'get_delivery_shift_by_zone_state.dart';





class GetDeliveryShiftByZoneBloc extends Bloc<GetDeliveryShiftByZoneEvent, GetDeliveryShiftByZoneState> {
  final  _getDeliveryShift = CatalogueProvider(); 

  GetDeliveryShiftByZoneBloc() : super(GetDeliveryShiftByZoneInitial());

  @override
  Stream<GetDeliveryShiftByZoneState> mapEventToState(
    GetDeliveryShiftByZoneEvent event,
  ) async* {
    if (event is GetDeliveryShiftByZoneFetchEvent) {
       yield GetDeliveryShiftByZoneLoading();
      try {
       
         
         final dataResponse = await _getDeliveryShift.getDeliveryShift(zone:event.zone);
         if(dataResponse.hasData){
         final deliveryShiftList =dataResponse.data;
       debugPrint("data is${deliveryShiftList}");

       var resItem =[]; 
       var res = dataResponse.data["getDeliveryShiftsByZone"];

       resItem =res.map((itm){
        return DeliveryShift.fromJson(itm);}).toList();
        final resList = List<DeliveryShift>.from(resItem);

        debugPrint("Loaded");


       

     
     // DeliveryShifts? deliveryShift =DeliveryShifts.fromJson(dataResponse.data);


      // print("=-=-=${deliveryShift}");
        yield GetDeliveryShiftByZoneLoadedSucess(deliveryshift:resList);}
        else{
          print("============================");
        }

      } catch (error) {
        yield GetDeliveryShiftByZoneLoadedFailed(error: error.toString());
        print(error.toString());
      }
    }
  }
}


