// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../../../../../user_module/domain/user_data.dart';
//
//
// part 'get_current_location_state.dart';
//
//
// class GetCurrentLocationCubit extends Cubit<GetCurrentLocationState> {
//   GetCurrentLocationCubit() : super(GetCurrentLocationInitial());
//   String _currentLocation = "";
//   String get currentLocation => _currentLocation;
//
//
//   getLocationName(double latitude, double longitude) async {
//
//     emit(GetCurrentLocationInitial());
//     try {
//       List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
//
//       if (placemarks != null && placemarks.isNotEmpty) {
//         Placemark place = placemarks[0];
//         // String locationName = "${place.thoroughfare}, ${place.locality}, ${place.administrativeArea}";
//
//
//         String locationName = place.thoroughfare ??"${place.locality}, ${place.administrativeArea}";
//
//         _currentLocation = locationName;
//         if(userData.place ==''|| userData.place == null){
//           (await SharedPreferences.getInstance()).setString(
//             PLACE,
//             locationName,
//           );
//
//         }
//
//         print("sssssssss");
//         print(_currentLocation);
//         print(place);
//         emit(GetCurrentLocationLoad(
//           currentLocation: locationName
//         ));
//       }
//     } catch (e) {
//       print("Error: $e");
//     }
//
//   }
//
// }
//
//
//
