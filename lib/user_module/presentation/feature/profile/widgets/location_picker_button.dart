// import 'dart:async';
// import 'dart:io';
// import 'package:app_settings/app_settings.dart';
// import 'package:armino_ecom/base_module/domain/entity/app.dart';
// import 'package:armino_ecom/base_module/domain/entity/translation.dart';
// import 'package:armino_ecom/base_module/presentation/component/alerts/app_alert_dialog.dart';
// import 'package:armino_ecom/base_module/presentation/component/padding/app_padding.dart';;
// import 'package:html/parser.dart' as html_parser;
// import 'package:html/dom.dart' as html;
// import 'package:location/location.dart' as location;
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
// // import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
// import 'package:location/location.dart';
// import 'package:permission_handler/permission_handler.dart';
//
//
//
//
// import '../../../../../base_module/presentation/core/values/app_constants.dart';
//
// class CustomerLocationPickerButton extends StatefulWidget {
//   // final PickedLocation? pickedLocation;
//   // final PickResult? pickedLocation;
//   final void Function(PickResult?)? onPicked;
//   final String ? address;
//   final Geometry geometry;
//
//   const CustomerLocationPickerButton({
//     Key? key,
//     // required this.pickedLocation,
//     this.onPicked,
//     required this.geometry,
//     required this.address
//   }) : super(key: key);
//
//   @override
//   State<CustomerLocationPickerButton> createState() =>
//       _CustomerLocationPickerButtonState();
// }
//
// class _CustomerLocationPickerButtonState
//     extends State<CustomerLocationPickerButton> {
//   LatLng? _initialPosition;
//
//   @override
//   void initState() {
//     super.initState();
//
//
//
//     if((app.geometry?.location.lat ==null || app.geometry?.location ==0.0)||(app.geometry?.location.lat ==null || app.geometry?.location ==0.0)) {
//       Geolocator.getCurrentPosition().then((position) {
//         _initialPosition = LatLng(position.latitude, position.longitude);
//       });
//     }else{
//       _initialPosition = LatLng(app.geometry?.location.lat ??0.0,app.geometry?.location.lng ??0.0);
//     }
//     //
//   }
//
//
//
//   bool isHtmlString(String input) {
//     RegExp htmlTagRegex = RegExp(r"<[^>]*>");
//
//     return htmlTagRegex.hasMatch(input);
//   }
//
//
//
//   String formatHtmlAddressToNormal(String htmlText) {
//
//     final parsedHtml = html_parser.parse(htmlText);
//
//
//     String locality = "";
//     String region = "";
//     String postalCode = "";
//     String country = "";
//
//     final List<html.Element> elements = parsedHtml.getElementsByTagName('span');
//     for (final element in elements) {
//       final classes = element.classes.toList();
//       if (classes.contains("locality")) {
//         locality = element.text.trim();
//       } else if (classes.contains("region")) {
//         region = element.text.trim();
//       } else if (classes.contains("postal-code")) {
//         postalCode = element.text.trim();
//       } else if (classes.contains("country-name")) {
//         country = element.text.trim();
//       }
//     }
//
//     final formattedAddress = "$locality, $region $postalCode, $country";
//
//     return formattedAddress;
//   }
//   @override
//   Widget build(BuildContext context) {
//     // final formattedAddress = formatHtmlAddressToNormal(app.address!);
//     return GestureDetector(
//       onTap: () {
//         // print("sssssss");
//
//         // _selectPlace(context);
//
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) =>
//                 MapLocationPicker(
//                   initialPosition: _initialPosition,
//                   geometry: widget.geometry,
//                   address: widget.address,
//                   // pickedLocation: widget.pickedLocation,
//                   selectTitle: translation.of('customer.delivery_location'),
//                   selectText: translation.of('customer.deliver_here'),
//                 ),
//           ),
//         ).then((value) {
//           if (value != null) {
//             widget.onPicked?.call(value as PickResult);
//           }
//         });
//       },
//       child: Padding(
//         padding: const EdgeInsets.symmetric(
//           horizontal: AppConstants.defaultPadding / 8,
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               translation.of('customer.delivering_to'),
//               style: Theme
//                   .of(context)
//                   .textTheme
//                   .subtitle2!
//                   .copyWith(
//                 color: Theme
//                     .of(context)
//                     .colorScheme
//                     .secondary
//                     .withOpacity(0.5),
//               ),
//             ),
//             // InkWell(
//             //   onTap: ()async{
//             //     print("aaa");
//             //
//             //     // print(app.address);
//             //     // print(app.geometry?.location.lng);
//             //     // print(app.geometry?.location.lat);
//             //
//             //
//             //
//             //
//             //
//             //
//             //   },
//             //   child:
//             ( (app.address == null || app.address =='')|| widget.address == null)?
//             Text(
//
//               translation.of('customer.select_location'),
//               style: Theme
//                   .of(context)
//                   .textTheme
//                   .subtitle2!
//                   .copyWith(
//                 color: Theme
//                     .of(context)
//                     .colorScheme
//                     .primary,
//               ),
//             ):
//
//             (isHtmlString(app.address??"")== false||isHtmlString(widget.address??"")==false)?
//             Text(
//               widget.address ??
//                   app.address??
//                   translation.of('customer.select_location'),
//               style: Theme
//                   .of(context)
//                   .textTheme
//                   .subtitle2!
//                   .copyWith(
//                 color: Theme
//                     .of(context)
//                     .colorScheme
//                     .primary,
//               ),
//             ):  Text(
//
//               formatHtmlAddressToNormal(app.address ??widget.address ??""),
//               style: Theme
//                   .of(context)
//                   .textTheme
//                   .subtitle2!
//                   .copyWith(
//                 color: Theme
//                     .of(context)
//                     .colorScheme
//                     .primary,
//               ),
//             )
//
//
//             // ,
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class MapLocationPicker extends StatefulWidget {
//   final LatLng? initialPosition;
//
//   // final PickedLocation? pickedLocation;
//   // final PickResult? pickedLocation;
//   final String ? address;
//   final Geometry ? geometry;
//   final String? selectTitle;
//   final String? selectText;
//
//   const MapLocationPicker({
//     Key? key,
//     this.initialPosition,
//     required this.address,
//     required this.geometry,
//     // required this.pickedLocation,
//     this.selectTitle,
//     this.selectText,
//   }) : super(key: key);
//
//   @override
//   _MapLocationPickerState createState() => _MapLocationPickerState();
// }
//
// class _MapLocationPickerState extends State<MapLocationPicker> {
//
//
//   final Completer<GoogleMapController> _controller =
//   Completer<GoogleMapController>();
//
//
//   final _googleMapController = Completer<GoogleMapController>();
//
//   LatLng ? _initialPosition;
//   // LatLng _initialPosition = LatLng(11.7531821, 75.5838877);
//
//   // PlaceProvider? _placeProvider;
//   final _location =location.Location();
//   PickResult? selectedPlace;
//
//   // var _selectedLocationSearchingState = SearchingState.Idle;
//
//   @override
//   void initState() {
//     // _initialPosition = widget.initialPosition;
//     super.initState();
//
//     if (widget.initialPosition != null) {
//       _initialPosition = widget.initialPosition!;
//     } else {
//       Geolocator.getCurrentPosition().then((position) {
//         _initialPosition = LatLng(position.latitude, position.longitude);
//
//         if (widget.geometry?.location.lng == null) {
//           _googleMapController.future.then((controller) {
//             controller
//                 .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
//               target: _initialPosition!,
//               zoom: 14.4746,
//             )));
//           });
//         }
//       });
//     }
//
//     // locationPermission.toString();
//     _requestPermission();
//   }
//
//   bool isHtmlString(String input) {
//     RegExp htmlTagRegex = RegExp(r"<[^>]*>");
//
//     return htmlTagRegex.hasMatch(input);
//   }
//
//
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     // final _pickedLocation = widget.pickedLocation;
//
//     return Theme(
//         data: ThemeData(
//           inputDecorationTheme: InputDecorationTheme(
//             fillColor: Theme
//                 .of(context)
//                 .colorScheme
//                 .surface,
//           ),
//           appBarTheme: VendorAppBarTheme.appbarThemeLight(),
//         ),
//         // Note: Zoom level manually set to 20 deep inside the Plugin
//         // file: google_maps_place_picker/lib/src_google_map_place_picker/GoogleMapPlacePicker
//         // line: 159
//         child: BlocListener<ManageLocationBloc, ManageLocationState>(
//           listener: (context, state) {
//             if(state is ChangeLocationSuccess){
//               // Navigator.pop(context, state.pickedLocation);
//
//             }
//           },
//           child: PlacePicker(
//
//             resizeToAvoidBottomInset:
//             false,
//             // only works in page mode, less flickery
//             apiKey:
//             // AppConstants.gmapsApiKey
//             Platform.isAndroid
//
//                 ?  AppConstants.gmapsApiKey
//                 : AppConstants.gmapsApiKey,
//             hintText: "Find a place ...",
//             searchingText: "Please wait ...",
//             selectText: "Select place",
//             outsideOfPickAreaText: "Place not in area",
//             initialPosition: LatLng(
//                 app.geometry?.location.lat ?? 0.0,
//                 app.geometry?.location.lng ?? 0.0),
//             useCurrentLocation: true,
//             selectInitialPosition: true,
//             usePinPointingSearch: true,
//             usePlaceDetailSearch: true,
//             zoomGesturesEnabled: true,
//             zoomControlsEnabled: true,
//             // ignoreLocationPermissionErrors: true,
//             onMapCreated: (GoogleMapController controller) {
//               // controller.getLatLng()
//
//             },
//             onPlacePicked: (PickResult result) async{
//
//
//
//               setState(() {
//                 selectedPlace = result;
//               });
//
//
//
//               Navigator.pop(context);
//
//
//
//
//             },
//
//             onMapTypeChanged: (MapType mapType) {
//
//               print(
//                   "Map type changed to ${mapType.toString()}");
//             },
//             // #region additional stuff
//             // forceSearchOnZoomChanged: true,
//             // automaticallyImplyAppBarLeading: false,
//             // autocompleteLanguage: "ko",
//             // region: 'au',
//             // pickArea: CircleArea(
//             //   center: HomePage.kInitialPosition,
//             //   radius: 300,
//             //   fillColor: Colors.lightGreen
//             //       .withGreen(255)
//             //       .withAlpha(32),
//             //   strokeColor: Colors.lightGreen
//             //       .withGreen(255)
//             //       .withAlpha(192),
//             //   strokeWidth: 2,
//             // ),
//             selectedPlaceWidgetBuilder: (_, selectedPlace, state,
//                 isSearchBarFocused) {
//               print("state: $state, isSearchBarFocused: $isSearchBarFocused");
//               return
//                 // Align(
//                 //   alignment: Alignment.bottomCenter,
//                 //   child:   _buildBottomFloatingCard(state, selectedPlace, context),
//                 // );
//                 isSearchBarFocused
//                     ? Container()
//                     :
//                 FloatingCard(
//                     bottomPosition: 0.0,
//                     // MediaQuery.of(context) will cause rebuild. See MediaQuery document for the information.
//                     leftPosition: 0.0,
//                     rightPosition: 0.0,
//                     width: 500,
//                     borderRadius: BorderRadius.circular(12.0),
//                     child:
//                     state == isSearchBarFocused
//                         ? const Center(child:  CircularProgressIndicator())
//                         : Container(
//                       padding: const EdgeInsets.all(
//                           AppConstants.defaultPadding / 2),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             widget.selectTitle ?? translation.of('location'),
//                             style: Theme
//                                 .of(context)
//                                 .textTheme
//                                 .subtitle2!
//                                 .copyWith(
//                               color: Theme
//                                   .of(context)
//                                   .textTheme
//                                   .subtitle2!
//                                   .color!
//                                   .withOpacity(0.5),
//                             ),
//                           ),
//                           const AppPadding(dividedBy: 2),
//                           Row(
//                             children: [
//                               const Icon(Icons.location_on_outlined),
//                               const AppPadding(dividedBy: 4),
//                               Expanded(
//                                 child: Text(
//                                   selectedPlace?.formattedAddress ?? '',
//                                   // selectedPlace?.formattedAddress ?? "",
//                                   style: Theme
//                                       .of(context)
//                                       .textTheme
//                                       .subtitle2,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const AppPadding(dividedBy: 2),
//                           SizedBox(
//                             width: double.infinity,
//                             child: ElevatedButton(
//                               style: ButtonStyle(
//                                 backgroundColor: MaterialStateProperty.all(
//                                   Theme
//                                       .of(context)
//                                       .colorScheme
//                                       .primary,
//                                 ),
//                                 elevation: MaterialStateProperty.all(0),
//                                 padding: MaterialStateProperty.all(
//                                   const EdgeInsets.symmetric(
//                                     horizontal: AppConstants.defaultPadding,
//                                     vertical: AppConstants.defaultPadding / 2,
//                                   ),
//                                 ),
//                                 shape: MaterialStateProperty.all(
//                                   const RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.all(
//                                       Radius.circular(
//                                         AppConstants.cornerRadius / 2,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               onPressed: () async{
//
//
//
//                                 // print(selectedPlace?.addressComponents?.first.shortName);
//                                 // print("bbbbb");
//                                 // print(selectedPlace?.adrAddress);
//                                 // print("ccccc");
//                                 // print(selectedPlace?.formattedAddress);
//
//                                 if(selectedPlace != null) {
//                                   await app.setLocation(selectedPlace.geometry,
//                                       selectedPlace.adrAddress);
//
//                                   BlocProvider.of<ManageLocationBloc>(context)
//                                       .add(
//                                     ChangeLocation(
//                                         geometry: selectedPlace.geometry ??
//                                             app.geometry,
//                                         address: selectedPlace.formattedAddress ?? app.address
//                                       // pickedLocation: selectedPlace ?? app.pickedLocation,
//                                     ),
//                                   );
//
//
//                                   Navigator.pop(context, selectedPlace);
//                                 }else{
//
//                                 }
//                               },
//                               child: Text(
//                                 widget.selectText ??
//                                     translation.of('customer.select'),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                   // ElevatedButton(
//                   //         child: Text("Pick Here"),
//                   //         onPressed: () {
//                   //          var aa = selectedPlace?.geometry?.location.lat;
//                   //           // IMPORTANT: You MUST manage selectedPlace data yourself as using this build will not invoke onPlacePicker as
//                   //           //            this will override default 'Select here' Button.
//                   //           print("do something with [selectedPlace] data");
//                   //           // Navigator.of(context).pop();
//                   //         },
//                   //       ),
//                 );
//             },
//             // pinBuilder: (context, state) {
//             //   if (state == PinState.Idle) {
//             //     return Icon(Icons.favorite_border);
//             //   } else {
//             //     return Icon(Icons.favorite);
//             //   }
//             // },
//             // introModalWidgetBuilder: (context,  close) {
//             //   return Positioned(
//             //     top: MediaQuery.of(context).size.height * 0.35,
//             //     right: MediaQuery.of(context).size.width * 0.15,
//             //     left: MediaQuery.of(context).size.width * 0.15,
//             //     child: Container(
//             //       width: MediaQuery.of(context).size.width * 0.7,
//             //       child: Material(
//             //         type: MaterialType.canvas,
//             //         color: Theme.of(context).cardColor,
//             //         shape: RoundedRectangleBorder(
//             //             borderRadius: BorderRadius.circular(12.0),
//             //         ),
//             //         elevation: 4.0,
//             //         child: ClipRRect(
//             //           borderRadius: BorderRadius.circular(12.0),
//             //           child: Container(
//             //             padding: EdgeInsets.all(8.0),
//             //             child: Column(
//             //               children: [
//             //                 SizedBox.fromSize(size: new Size(0, 10)),
//             //                 Text("Please select your preferred address.",
//             //                   style: TextStyle(
//             //                     fontWeight: FontWeight.bold,
//             //                   )
//             //                 ),
//             //                 SizedBox.fromSize(size: new Size(0, 10)),
//             //                 SizedBox.fromSize(
//             //                   size: Size(MediaQuery.of(context).size.width * 0.6, 56), // button width and height
//             //                   child: ClipRRect(
//             //                     borderRadius: BorderRadius.circular(10.0),
//             //                     child: Material(
//             //                       child: InkWell(
//             //                         overlayColor: MaterialStateColor.resolveWith(
//             //                           (states) => Colors.blueAccent
//             //                         ),
//             //                         onTap: close,
//             //                         child: Row(
//             //                           mainAxisAlignment: MainAxisAlignment.center,
//             //                           children: [
//             //                             Icon(Icons.check_sharp, color: Colors.blueAccent),
//             //                             SizedBox.fromSize(size: new Size(10, 0)),
//             //                             Text("OK",
//             //                               style: TextStyle(
//             //                                 color: Colors.blueAccent
//             //                               )
//             //                             )
//             //                           ],
//             //                         )
//             //                       ),
//             //                     ),
//             //                   ),
//             //                 )
//             //               ]
//             //             )
//             //           ),
//             //         ),
//             //       ),
//             //     )
//             //   );
//             // },
//             // #endregion
//           ),
//         )
//
//
//       // PlacePicker(
//       //   apiKey: AppConstants.gmapsApiKey,
//       //   initialPosition: LatLng(
//       //     _pickedLocation?.lat ?? _initialPosition.latitude,
//       //     _pickedLocation?.lng ?? _initialPosition.longitude,
//       //   ),
//       //   useCurrentLocation: false,
//       //   selectInitialPosition: true,
//       //   usePlaceDetailSearch: false,
//       //   autocompleteLanguage: translation.isArabic ? "ar" : "en",
//       //   autocompleteTypes: const [],
//       //   autocompleteComponents: [
//       //     geocoding.Component(geocoding.Component.country, "kw")
//       //   ],
//       //   hintText: translation.of('customer.search_address'),
//       //   selectedPlaceWidgetBuilder:
//       //       (context, selectedPlace, state, isSearchBarFocused) {
//       //     // _placeProvider ??= PlaceProvider.of(context, listen: false);
//       //
//       //     // if (!_googleMapController.isCompleted &&
//       //     //     _placeProvider?.mapController != null) {
//       //     //   _googleMapController.complete(_placeProvider!.mapController);
//       //     // }
//       //
//       //     debugPrint(
//       //       "state: $state, isSearchBarFocused: $isSearchBarFocused",
//       //     );
//       //
//       //     if (isSearchBarFocused) {
//       //       return Container();
//       //     } else {
//       //       return _buildBottomFloatingCard(
//       //         state,
//       //         selectedPlace,
//       //         context,
//       //       );
//       //     }
//       //   },
//       // ),
//     );
//   }
//
//   // FloatingCard
//   _buildBottomFloatingCard(SearchingState state,
//       PickResult? selectedPlace,
//       BuildContext context,) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: const BorderRadiusDirectional.only(
//           topStart: Radius.circular(12.0),
//           topEnd: Radius.circular(12.0),
//         ),
//         color: state == SearchingState.Searching
//             ? Colors.transparent
//             : AppColorScheme.onPrimaryLight,
//         // color:
//         // _selectedLocationSearchingState == SearchingState.searching
//         //     ? Colors.transparent
//         //     :
//         // AppColorScheme.onPrimaryLight,
//       ),
//       // color:
//       // state == SearchingState.Searching ? Colors.transparent : AppColorScheme.onPrimaryLight,
//       child: state == SearchingState.Searching
//           ? Container(
//         padding: const EdgeInsets.all(AppConstants.defaultPadding / 2),
//         child: SizedBox(
//           width: double.infinity,
//           child: ElevatedButton.icon(
//             style: ButtonStyle(
//               backgroundColor: MaterialStateProperty.all(
//                 Theme
//                     .of(context)
//                     .colorScheme
//                     .primary,
//               ),
//               elevation: MaterialStateProperty.all(0),
//               padding: MaterialStateProperty.all(
//                 const EdgeInsets.symmetric(
//                   horizontal: AppConstants.defaultPadding,
//                   vertical: AppConstants.defaultPadding / 2,
//                 ),
//               ),
//               shape: MaterialStateProperty.all(
//                 const RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(
//                       AppConstants.cornerRadius / 2,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             onPressed: () {},
//             icon: const SizedBox(
//               height: 20,
//               width: 20,
//               child: CircularProgressIndicator(),
//             ),
//             label: Text(
//               translation.of('customer.detecting_location'),
//             ),
//           ),
//         ),
//       )
//           : Container(
//         padding: const EdgeInsets.all(AppConstants.defaultPadding / 2),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               widget.selectTitle ?? translation.of('location'),
//               style: Theme
//                   .of(context)
//                   .textTheme
//                   .subtitle2!
//                   .copyWith(
//                 color: Theme
//                     .of(context)
//                     .textTheme
//                     .subtitle2!
//                     .color!
//                     .withOpacity(0.5),
//               ),
//             ),
//             const AppPadding(dividedBy: 2),
//             Row(
//               children: [
//                 const Icon(Icons.location_on_outlined),
//                 const AppPadding(dividedBy: 4),
//                 Expanded(
//                   child: Text(
//                     selectedPlace?.formattedAddress ?? '',
//                     // selectedPlace?.formattedAddress ?? "",
//                     style: Theme
//                         .of(context)
//                         .textTheme
//                         .subtitle2,
//                   ),
//                 ),
//               ],
//             ),
//             const AppPadding(dividedBy: 2),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all(
//                     Theme
//                         .of(context)
//                         .colorScheme
//                         .primary,
//                   ),
//                   elevation: MaterialStateProperty.all(0),
//                   padding: MaterialStateProperty.all(
//                     const EdgeInsets.symmetric(
//                       horizontal: AppConstants.defaultPadding,
//                       vertical: AppConstants.defaultPadding / 2,
//                     ),
//                   ),
//                   shape: MaterialStateProperty.all(
//                     const RoundedRectangleBorder(
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(
//                           AppConstants.cornerRadius / 2,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 onPressed: () {
//                   // final pickedLocation = PickedLocation.fromPickResult(
//                   //   selectedPlace,
//                   // );
//                   //
//                   // Navigator.pop(context, pickedLocation);
//                 },
//                 child: Text(
//                   widget.selectText ?? translation.of('customer.select'),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> _requestPermission() async {
//     final permissionStatus = await _location.hasPermission();
//
//     if (permissionStatus == PermissionStatus.denied ||
//         permissionStatus == PermissionStatus.permanentlyDenied) {
//       if (mounted) {
//         showDialog(
//           context: context,
//           barrierDismissible: false,
//           builder: (_) {
//             return AppAlertDialog(
//               title: translation.of('permission_request'),
//               content: translation.of('location_permission'),
//               actions: [
//                 OutlinedButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: Text(translation.of('close')),
//                 ),
//                 ElevatedButton(
//                   onPressed: () async {
//                     await AppSettings.openAppSettings();
//                     if (mounted) Navigator.pop(context);
//                   },
//                   child: Text(translation.of('allow')),
//                 ),
//               ],
//             );
//           },
//         );
//       }
//     }
//   }
// }
//
//
// bool isCustomerPickedLocation(BuildContext context) {
//   if (app.geometry != null || app.address != null) {
//     return true;
//   } else {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) =>
//             MapLocationPicker(
//               geometry: app.geometry,
//               address: app.address,
//               // pickedLocation: app.pickedLocation,
//               selectTitle: translation.of('customer.delivery_location'),
//               selectText: translation.of('customer.deliver_here'),
//             ),
//       ),
//     ).then((value) {
//       if (value != null) {
//         final _value = value as PickResult;
//         BlocProvider.of<ManageLocationBloc>(context).add(
//           ChangeLocation(
//               address: _value.adrAddress,
//               geometry: _value.geometry
//           ),
//         );
//         // BlocProvider.of<ManageLocationBloc>(context).add(
//         //   ChangeLocation(
//         //     pickedLocation: value as PickResult,
//         //   ),
//         // );
//       }
//     });
//
//     return false;
//   }
// }
//
// // enum SearchingState { searching, completed }
//
//
// /////////// og code beleow
//
//
// // import 'dart:async';
// //
// // import 'package:app_settings/app_settings.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:geolocator/geolocator.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';
// // import 'package:google_maps_place_picker/google_maps_place_picker.dart';
// // import 'package:google_maps_place_picker/providers/place_provider.dart';
// // import 'package:google_maps_webservice/geocoding.dart' as geocoding;
// // import 'package:homey/base_module/domain/entity/app.dart';
// // import 'package:homey/base_module/domain/entity/appbar_theme.dart';
// // import 'package:homey/base_module/domain/entity/translation.dart';
// // import 'package:homey/base_module/presentation/component/alerts/app_alert_dialog.dart';
// // import 'package:homey/base_module/presentation/component/padding/app_padding.dart';
// // import 'package:homey/customer_module/domain/entity/models/picked_location.dart';
// // import 'package:homey/customer_module/presentation/feature/choose_location/blocs/manage_location/manage_location_bloc.dart';
// // import 'package:location/location.dart';
// //
// // import '../../../../../base_module/presentation/core/values/app_constants.dart';
// //
// // class CustomerLocationPickerButton extends StatefulWidget {
// //   final PickedLocation? pickedLocation;
// //   final void Function(PickedLocation?)? onPicked;
// //
// //   const CustomerLocationPickerButton({
// //     Key? key,
// //     required this.pickedLocation,
// //     this.onPicked,
// //   }) : super(key: key);
// //
// //   @override
// //   State<CustomerLocationPickerButton> createState() =>
// //       _CustomerLocationPickerButtonState();
// // }
// //
// // class _CustomerLocationPickerButtonState
// //     extends State<CustomerLocationPickerButton> {
// //   LatLng? _initialPosition;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //
// //     Geolocator.getCurrentPosition().then((position) {
// //       _initialPosition = LatLng(position.latitude, position.longitude);
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return GestureDetector(
// //       onTap: () {
// //         Navigator.push(
// //           context,
// //           MaterialPageRoute(
// //             builder: (context) => MapLocationPicker(
// //               initialPosition: _initialPosition,
// //               pickedLocation: widget.pickedLocation,
// //               selectTitle: translation.of('customer.delivery_location'),
// //               selectText: translation.of('customer.deliver_here'),
// //             ),
// //           ),
// //         ).then((value) {
// //           if (value != null) {
// //             widget.onPicked?.call(value as PickedLocation);
// //           }
// //         });
// //       },
// //       child: Padding(
// //         padding: const EdgeInsets.symmetric(
// //           horizontal: AppConstants.defaultPadding / 8,
// //         ),
// //         child: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Text(
// //               translation.of('customer.delivering_to'),
// //               style: Theme.of(context).textTheme.subtitle2!.copyWith(
// //                     color: Theme.of(context)
// //                         .colorScheme
// //                         .secondary
// //                         .withOpacity(0.5),
// //                   ),
// //             ),
// //             Text(
// //               widget.pickedLocation?.formattedAddress ??
// //                   translation.of('customer.select_location'),
// //               style: Theme.of(context).textTheme.subtitle2!.copyWith(
// //                     color: Theme.of(context).colorScheme.primary,
// //                   ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // class MapLocationPicker extends StatefulWidget {
// //   final LatLng? initialPosition;
// //   final PickedLocation? pickedLocation;
// //   final String? selectTitle;
// //   final String? selectText;
// //
// //   const MapLocationPicker({
// //     Key? key,
// //     this.initialPosition,
// //     required this.pickedLocation,
// //     this.selectTitle,
// //     this.selectText,
// //   }) : super(key: key);
// //
// //   @override
// //   _MapLocationPickerState createState() => _MapLocationPickerState();
// // }
// //
// // class _MapLocationPickerState extends State<MapLocationPicker> {
// //   final _googleMapController = Completer<GoogleMapController>();
// //   LatLng _initialPosition = const LatLng(29.378586, 47.990341);
// //   PlaceProvider? _placeProvider;
// //   final _location = Location();
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //
// //     if (widget.initialPosition != null) {
// //       _initialPosition = widget.initialPosition!;
// //     } else {
// //       Geolocator.getCurrentPosition().then((position) {
// //         _initialPosition = LatLng(position.latitude, position.longitude);
// //
// //         if (widget.pickedLocation?.lat == null) {
// //           _googleMapController.future.then((controller) {
// //             controller
// //                 .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
// //               target: _initialPosition,
// //               zoom: 14.4746,
// //             )));
// //           });
// //         }
// //       });
// //     }
// //
// //     _requestPermission();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final _pickedLocation = widget.pickedLocation;
// //
// //     return Theme(
// //       data: ThemeData(
// //         inputDecorationTheme: InputDecorationTheme(
// //           fillColor: Theme.of(context).colorScheme.surface,
// //         ),
// //         appBarTheme: VendorAppBarTheme.appbarThemeLight(),
// //       ),
// //       // Note: Zoom level manually set to 20 deep inside the Plugin
// //       // file: google_maps_place_picker/lib/src_google_map_place_picker/GoogleMapPlacePicker
// //       // line: 159
// //       child: PlacePicker(
// //         apiKey: AppConstants.gmapsApiKey,
// //         initialPosition: LatLng(
// //           _pickedLocation?.lat ?? _initialPosition.latitude,
// //           _pickedLocation?.lng ?? _initialPosition.longitude,
// //         ),
// //         useCurrentLocation: false,
// //         selectInitialPosition: true,
// //         usePlaceDetailSearch: false,
// //         autocompleteLanguage: translation.isArabic ? "ar" : "en",
// //         autocompleteTypes: const [],
// //         autocompleteComponents: [
// //           geocoding.Component(geocoding.Component.country, "kw")
// //         ],
// //         hintText: translation.of('customer.search_address'),
// //         selectedPlaceWidgetBuilder:
// //             (context, selectedPlace, state, isSearchBarFocused) {
// //           _placeProvider ??= PlaceProvider.of(context, listen: false);
// //
// //           if (!_googleMapController.isCompleted &&
// //               _placeProvider?.mapController != null) {
// //             _googleMapController.complete(_placeProvider!.mapController);
// //           }
// //
// //           debugPrint(
// //             "state: $state, isSearchBarFocused: $isSearchBarFocused",
// //           );
// //
// //           if (isSearchBarFocused) {
// //             return Container();
// //           } else {
// //             return _buildBottomFloatingCard(
// //               state,
// //               selectedPlace,
// //               context,
// //             );
// //           }
// //         },
// //       ),
// //     );
// //   }
// //
// //   FloatingCard _buildBottomFloatingCard(
// //     SearchingState state,
// //     PickResult? selectedPlace,
// //     BuildContext context,
// //   ) {
// //     return FloatingCard(
// //       bottomPosition: 0,
// //       leftPosition: 0,
// //       rightPosition: 0,
// //       borderRadius: const BorderRadius.only(
// //         topLeft: Radius.circular(12.0),
// //         topRight: Radius.circular(12.0),
// //       ),
// //       color:
// //           state == SearchingState.Searching ? Colors.transparent : AppColorScheme.onPrimaryLight,
// //       child: state == SearchingState.Searching
// //           ? Container(
// //               padding: const EdgeInsets.all(AppConstants.defaultPadding / 2),
// //               child: SizedBox(
// //                 width: double.infinity,
// //                 child: ElevatedButton.icon(
// //                   style: ButtonStyle(
// //                     backgroundColor: MaterialStateProperty.all(
// //                       Theme.of(context).colorScheme.primary,
// //                     ),
// //                     elevation: MaterialStateProperty.all(0),
// //                     padding: MaterialStateProperty.all(
// //                       const EdgeInsets.symmetric(
// //                         horizontal: AppConstants.defaultPadding,
// //                         vertical: AppConstants.defaultPadding / 2,
// //                       ),
// //                     ),
// //                     shape: MaterialStateProperty.all(
// //                       const RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.all(
// //                           Radius.circular(
// //                             AppConstants.cornerRadius / 2,
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                   onPressed: () {},
// //                   icon: const SizedBox(
// //                     height: 20,
// //                     width: 20,
// //                     child: CircularProgressIndicator(),
// //                   ),
// //                   label: Text(
// //                     translation.of('customer.detecting_location'),
// //                   ),
// //                 ),
// //               ),
// //             )
// //           : Container(
// //               padding: const EdgeInsets.all(AppConstants.defaultPadding / 2),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Text(
// //                     widget.selectTitle ?? translation.of('location'),
// //                     style: Theme.of(context).textTheme.subtitle2!.copyWith(
// //                           color: Theme.of(context)
// //                               .textTheme
// //                               .subtitle2!
// //                               .color!
// //                               .withOpacity(0.5),
// //                         ),
// //                   ),
// //                   const AppPadding(dividedBy: 2),
// //                   Row(
// //                     children: [
// //                       const Icon(Icons.location_on_outlined),
// //                       const AppPadding(dividedBy: 4),
// //                       Expanded(
// //                         child: Text(
// //                           selectedPlace?.formattedAddress ?? "",
// //                           style: Theme.of(context).textTheme.subtitle2,
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                   const AppPadding(dividedBy: 2),
// //                   SizedBox(
// //                     width: double.infinity,
// //                     child: ElevatedButton(
// //                       style: ButtonStyle(
// //                         backgroundColor: MaterialStateProperty.all(
// //                           Theme.of(context).colorScheme.primary,
// //                         ),
// //                         elevation: MaterialStateProperty.all(0),
// //                         padding: MaterialStateProperty.all(
// //                           const EdgeInsets.symmetric(
// //                             horizontal: AppConstants.defaultPadding,
// //                             vertical: AppConstants.defaultPadding / 2,
// //                           ),
// //                         ),
// //                         shape: MaterialStateProperty.all(
// //                           const RoundedRectangleBorder(
// //                             borderRadius: BorderRadius.all(
// //                               Radius.circular(
// //                                 AppConstants.cornerRadius / 2,
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                       onPressed: () {
// //                         final pickedLocation = PickedLocation.fromPickResult(
// //                           selectedPlace,
// //                         );
// //
// //                         Navigator.pop(context, pickedLocation);
// //                       },
// //                       child: Text(
// //                         widget.selectText ?? translation.of('customer.select'),
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //     );
// //   }
// //
// //   Future<void> _requestPermission() async {
// //     final permissionStatus = await _location.hasPermission();
// //
// //     if (permissionStatus == PermissionStatus.denied ||
// //         permissionStatus == PermissionStatus.deniedForever) {
// //       if (mounted) {
// //         showDialog(
// //           context: context,
// //           barrierDismissible: false,
// //           builder: (_) {
// //             return AppAlertDialog(
// //               title: translation.of('permission_request'),
// //               content: translation.of('location_permission'),
// //               actions: [
// //                 OutlinedButton(
// //                   onPressed: () {
// //                     Navigator.pop(context);
// //                   },
// //                   child: Text(translation.of('close')),
// //                 ),
// //                 ElevatedButton(
// //                   onPressed: () async {
// //                     await AppSettings.openAppSettings();
// //                     if (mounted) Navigator.pop(context);
// //                   },
// //                   child: Text(translation.of('allow')),
// //                 ),
// //               ],
// //             );
// //           },
// //         );
// //       }
// //     }
// //   }
// // }
// //
// // bool isCustomerPickedLocation(BuildContext context) {
// //   if (app.pickedLocation != null) {
// //     return true;
// //   } else {
// //     Navigator.push(
// //       context,
// //       MaterialPageRoute(
// //         builder: (context) => MapLocationPicker(
// //           pickedLocation: app.pickedLocation,
// //           selectTitle: translation.of('customer.delivery_location'),
// //           selectText: translation.of('customer.deliver_here'),
// //         ),
// //       ),
// //     ).then((value) {
// //       if (value != null) {
// //         BlocProvider.of<ManageLocationBloc>(context).add(
// //           ChangeLocation(
// //             pickedLocation: value as PickedLocation,
// //           ),
// //         );
// //       }
// //     });
// //
// //     return false;
// //   }
// // }
