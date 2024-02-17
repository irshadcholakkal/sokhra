import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:google_place/google_place.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../catalogue_module/presentation/feature/details/blocs/delivery_check_cubit/delivery_check_cubit.dart';
import '../../../../catalogue_module/presentation/feature/details/blocs/google_places_cubit/google_places_cubit.dart';
import '../../../../main.dart';
import '../../../../user_module/domain/user_data.dart';
import '../../../domain/entity/color_scheme.dart';
import '../../../domain/entity/translation.dart';
import '../../core/values/app_constants.dart';
import '../alerts/flash_alert.dart';
import '../padding/app_padding.dart';

void showLocationsDialog(BuildContext context, {String? initialValue}) async {
  if (userData.lat == 0.0 && userData.lng == 0.0) {
    // await BlocProvider.of<LocationCheckCubit>(context).getLocation();
  }

  Future.delayed(Duration(seconds: 1), () async {
    showDialog(context: context, builder: (context) => PinCodeDialog());
  });
}

class PinCodeDialog extends StatefulWidget {
  final String? initialValue;

  const PinCodeDialog({Key? key, this.initialValue}) : super(key: key);

  @override
  State<PinCodeDialog> createState() => _PinCodeDialogState();
}

class _PinCodeDialogState extends State<PinCodeDialog> {
  final TextEditingController? _areaController = TextEditingController();
  FocusNode areaFocusNode = FocusNode();
  var googlePlace = GooglePlace(kGoogleApiKey);
  bool areaSelected = false;
  String place = '';

  OutlineInputBorder get _border => OutlineInputBorder(
    borderRadius: BorderRadius.circular(AppConstants.cornerRadius),
    borderSide: BorderSide(
      color: AppColorScheme.textFieldBorderColor,
      width: 1,
    ),
  );

  List<String> splitByComma(String input) {
    return input.split(',');
  }

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  Widget _placeTextField(context) {
    return Material(
      child: StatefulBuilder(builder: (context, reset) {
        return BlocListener<GooglePlacesCubit, GooglePlacesState>(
          listener: (context, state) {
            if (state is GooglePlacesLoadedState) {
              // _areaController?.text = state.place;
              _areaController?.text = state.place;
              place = state.place;
            }

            if (state is GooglePlacesFailedState) {
              showErrorFlash(context: context, message: state.error);
            }
          },
          child: TypeAheadFormField<AutocompletePrediction>(
              initialValue: widget.initialValue,
              textFieldConfiguration: TextFieldConfiguration(
                focusNode: areaFocusNode,
                decoration: InputDecoration(
                    hintText: "Pin code",
                    hintStyle: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(color: AppColorScheme.onBlack),
                    border: _border,
                    enabledBorder: _border,
                    focusedBorder: _border,
                    disabledBorder: _border,
                    errorBorder: _border.copyWith(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                    focusedErrorBorder: _border.copyWith(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                    prefixIcon: const Icon(
                      MdiIcons.mapMarkerOutline,
                      color: Colors.black,
                    ),
                    suffixIcon: IconButton(
                      icon: areaSelected
                          ? const Icon(
                              Icons.clear,
                              color: Colors.black,
                            )
                          : const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black,
                            ),
                      onPressed: () {
                        if (areaSelected) {
                          _areaController?.clear();
                          // area = null;
                        } else {
                          areaFocusNode.requestFocus();
                        }
                        reset(() {
                          areaSelected = !areaSelected;
                        });
                      },
                    )),
                controller: _areaController,
              ),
              onSuggestionSelected: (value) async {
                // _areaController?.text = util.getAvailabletext(
                //     englishText: value.nameEn, arabicText: value.nameAr);
                // area = value;
                reset(() {
                  areaSelected = true;
                });
                _areaController?.text = value.description ?? "";
                List<String> result = splitByComma(value.description ?? "");
                place = result.first;
                BlocProvider.of<GooglePlacesCubit>(context)
                    .checkPlace(value.placeId, result.first);
              },
              loadingBuilder: (context) {
                return Center(child: const CircularProgressIndicator());
              },
              itemBuilder: (context, area) {
                return ListTile(
                  textColor: Colors.red,
                  title: Text(
                    area.description ?? "",
                    // util.getAvailabletext(
                    //     englishText: area.nameEn, arabicText: area.nameAr),
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(color: AppColorScheme.onBlack),
                  ),
                );
              },
              suggestionsCallback: (value) async {
                if (value != "") {
                  var result =
                      await googlePlace.autocomplete.get(value, components: []);
                  return result?.predictions ?? [];
                } else {
                  return [];
                }

                // List<Area> area =
                //     BlocProvider.of<AreasBloc>(context).response?.areas ?? [];
                // List<Area> finalList = [];
                // if (translation.isArabic) {
                //   for (var element in area) {
                //     if (element.nameAr != null) {
                //       if (element.nameAr!
                //           .toLowerCase()
                //           .contains(value.toLowerCase())) {
                //         finalList.add(element);
                //       }
                //     }
                //   }
                // } else {
                //   for (var element in area) {
                //     if (element.nameEn != null) {
                //       if (element.nameEn!
                //           .toLowerCase()
                //           .contains(value.toLowerCase())) {
                //         finalList.add(element);
                //       }
                //     }
                //   }
                // }
                //
                // return finalList;
              }),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(AppConstants.cornerRadius)),
        padding: const EdgeInsets.all(AppConstants.defaultPadding / 2),
        child: FormBuilder(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Enter your pin code",
                  // translation.of("catalogue.enter_pincode"),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      color: Theme.of(context).colorScheme.primaryContainer),
                ),
                const AppPadding(
                  dividedBy: 2,
                ),
                _placeTextField(context),
                const AppPadding(
                  dividedBy: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          translation.of("catalogue.cancel").toUpperCase(),
                          style: Theme.of(context).textTheme.button?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary),
                        )),
                    BlocListener<DeliveryCheckCubit, DeliveryCheckState>(
                      listener: (context, state) {
                        if (state is DeliveryCheckSuccess) {
                          if (mounted) {
                            Navigator.pop(context);
                          }
                        }

                        if (state is DeliveryCheckFailed) {
                          if (mounted) {
                            showErrorFlash(
                                context: context, message: state.message);
                          }
                        }
                      },
                      child: ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<DeliveryCheckCubit>(context)
                                .checkPinCode(
                                    pincode: BlocProvider.of<GooglePlacesCubit>(
                                            context)
                                        .pin,
                                    lat: BlocProvider.of<GooglePlacesCubit>(
                                            context)
                                        .lat,
                                    lng: BlocProvider.of<GooglePlacesCubit>(
                                            context)
                                        .lng,
                                    place: BlocProvider.of<GooglePlacesCubit>(
                                            context)
                                        .place);
                          },
                          child: Text(
                            translation.of("catalogue.submit").toUpperCase(),
                            style: Theme.of(context).textTheme.button?.copyWith(
                                color: Theme.of(context).colorScheme.onPrimary),
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/////////// code for pin code
// class PinCodeDialog extends StatefulWidget {
//   const PinCodeDialog({Key? key}) : super(key: key);
//
//   @override
//   State<PinCodeDialog> createState() => _PinCodeDialogState();
// }
//
// class _PinCodeDialogState extends State<PinCodeDialog> {
//   final TextEditingController? _areaController = TextEditingController();
//   FocusNode areaFocusNode = FocusNode();
//   var googlePlace = GooglePlace(kGoogleApiKey);
//   bool areaSelected = false;
//   final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
//
//   Widget _placeTextField(context) {
//     return Material(
//       child: StatefulBuilder(builder: (context, reset) {
//         return BlocListener<GooglePlacesCubit, GooglePlacesState>(
//           listener: (context, state) {
//             if (state is GooglePlacesLoadedState) {
//               _areaController?.text = state.pinCode;
//             }
//
//             if (state is GooglePlacesFailedState) {
//               showErrorFlash(context: context, message: state.error);
//             }
//           },
//           child: TypeAheadFormField<AutocompletePrediction>(
//               textFieldConfiguration: TextFieldConfiguration(
//                 focusNode: areaFocusNode,
//                 decoration: InputDecoration(
//                     hintText: "area",
//                     hintStyle: Theme.of(context).textTheme.subtitle1
//                         ?.copyWith(color: AppColorScheme.onBlack),
//                     prefixIcon: const Icon(
//                       MdiIcons.mapMarkerOutline,
//                       color: AppColorScheme.onBlack,
//                     ),
//                     suffixIcon: IconButton(
//                       icon: areaSelected
//                           ? const Icon(
//                               Icons.clear,
//                               color: AppColorScheme.onBlack,
//                             )
//                           : const Icon(
//                               Icons.keyboard_arrow_down,
//                               color: AppColorScheme.onBlack,
//                             ),
//                       onPressed: () {
//                         if (areaSelected) {
//                           _areaController?.clear();
//                           // area = null;
//                         } else {
//                           areaFocusNode.requestFocus();
//                         }
//                         reset(() {
//                           areaSelected = !areaSelected;
//                         });
//                       },
//                     )),
//                 controller: _areaController,
//               ),
//               onSuggestionSelected: (value) async {
//                 // _areaController?.text = util.getAvailabletext(
//                 //     englishText: value.nameEn, arabicText: value.nameAr);
//                 // area = value;
//                 reset(() {
//                   areaSelected = true;
//                 });
//                 _areaController?.text = value.description ?? "";
//                 BlocProvider.of<GooglePlacesCubit>(context)
//                     .checkPlace(value.placeId);
//               },
//               loadingBuilder: (context) {
//                 return const CircularProgressIndicator();
//               },
//               itemBuilder: (context, area) {
//                 return ListTile(
//                   textColor: Colors.red,
//                   title: Text(
//                     area.description ?? "",
//                     // util.getAvailabletext(
//                     //     englishText: area.nameEn, arabicText: area.nameAr),
//                     style: Theme.of(context)
//                         .textTheme
//                         .subtitle1
//                         ?.copyWith(color: AppColorScheme.onBlack),
//                   ),
//                 );
//               },
//               suggestionsCallback: (value) async {
//                 if (value != "") {
//                   var result =
//                       await googlePlace.autocomplete.get(value, components: []);
//                   return result?.predictions ?? [];
//                 } else {
//                   return [];
//                 }
//
//                 // List<Area> area =
//                 //     BlocProvider.of<AreasBloc>(context).response?.areas ?? [];
//                 // List<Area> finalList = [];
//                 // if (translation.isArabic) {
//                 //   for (var element in area) {
//                 //     if (element.nameAr != null) {
//                 //       if (element.nameAr!
//                 //           .toLowerCase()
//                 //           .contains(value.toLowerCase())) {
//                 //         finalList.add(element);
//                 //       }
//                 //     }
//                 //   }
//                 // } else {
//                 //   for (var element in area) {
//                 //     if (element.nameEn != null) {
//                 //       if (element.nameEn!
//                 //           .toLowerCase()
//                 //           .contains(value.toLowerCase())) {
//                 //         finalList.add(element);
//                 //       }
//                 //     }
//                 //   }
//                 // }
//                 //
//                 // return finalList;
//               }),
//         );
//       }),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       backgroundColor: Colors.transparent,
//       child: Container(
//         decoration: BoxDecoration(
//             color: Theme.of(context).colorScheme.background,
//             borderRadius: BorderRadius.circular(AppConstants.cornerRadius)),
//         padding: const EdgeInsets.all(AppConstants.defaultPadding / 2),
//         child: FormBuilder(
//           key: _formKey,
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Text(
//                   translation.of("catalogue.enter_pincode"),
//                   textAlign: TextAlign.center,
//                   style: Theme.of(context).textTheme.subtitle1?.copyWith(
//                       color: Theme.of(context).colorScheme.primaryVariant),
//                 ),
//                 const AppPadding(
//                   dividedBy: 2,
//                 ),
//                 _placeTextField(context),
//                 const AppPadding(
//                   dividedBy: 2,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     ElevatedButton(
//                         onPressed: () => Navigator.pop(context),
//                         child: Text(
//                           translation.of("catalogue.cancel").toUpperCase(),
//                           style: Theme.of(context).textTheme.button?.copyWith(
//                               color: Theme.of(context).colorScheme.onPrimary),
//                         )),
//                     BlocListener<DeliveryCheckCubit, DeliveryCheckState>(
//                       listener: (context, state) {
//                         if (state is DeliveryCheckSuccess) {
//                           if (mounted) {
//                             Navigator.pop(context);
//                           }
//                         }
//
//                         if (state is DeliveryCheckFailed) {
//                           if (mounted) {
//                             showErrorFlash(
//                                 context: context, message: state.error);
//                           }
//                         }
//                       },
//                       child: ElevatedButton(
//                           onPressed: () {
//                             String pinCode = _areaController?.text ?? "";
//                             BlocProvider.of<DeliveryCheckCubit>(context)
//                                 .checkPinCode(pincode: pinCode, lat:  BlocProvider.of<LocationCheckCubit>(context).lat,lng:  BlocProvider.of<LocationCheckCubit>(context).lng);
//                           },
//                           child: Text(
//                             translation.of("catalogue.submit").toUpperCase(),
//                             style: Theme.of(context).textTheme.button?.copyWith(
//                                 color: Theme.of(context).colorScheme.onPrimary),
//                           )),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//////// og code end
