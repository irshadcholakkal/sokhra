import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_webservice/geolocation.dart';
import 'package:objectid/objectid.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app_settings_module/domain/entity/models/map_location.dart';
import '../../../user_module/domain/entity/models/app_notification.dart';
import 'models/personal_details.dart';

class App {
  static final _singleton = App._internal();

  factory App() {
    return _singleton;
  }

  App._internal();

  final _keyFirstTime = "keyFirstTime";
  bool _isFirstTime = true;

  final _keyDeviceId = "keyDeviceId";
  String? _deviceId;

  final _keyPersonalDetails = "keyPersonalDetails";
  PersonalDetails? _personalDetails;

  // final _keyPickedLocation = "keyPickedLocation";
  // PickedLocation? _pickedLocation;

  final _keyLastNotification = "keyLastNotification";
  AppNotification? _lastNotification;
  final _keyLatLong= "keyLatLong";
  Geometry? _geometry;
  final _keyAddress = "keyAddress";
  String? _address;

  bool get isFirstTime => _isFirstTime;

  String? get deviceId => _deviceId;

  PersonalDetails? get personalDetails => _personalDetails;
  Geometry ? get geometry => _geometry;
  String ?get address => _address;

  // PickedLocation? get pickedLocation => _pickedLocation;

  MapLocation? get mapLocation => _geometry != null
      ? MapLocation(
    latitude: geometry?.location.lat,
    longitude: geometry?.location.lng,
        )
      : null;

  AppNotification? get lastNotification => _lastNotification;

  Future<void> init() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    _isFirstTime = sharedPreferences.getBool(_keyFirstTime) ?? true;
    _deviceId = sharedPreferences.getString(_keyDeviceId)?.trim() ?? "";

    await _initDeviceId();

    _initPersonalDetails(
      sharedPreferences.getString(_keyPersonalDetails)?.trim() ?? "",
    );

    // _initPickedLocation(
    //   sharedPreferences.getString(_keyPickedLocation)?.trim() ?? "",
    // );

    _getPickedLocation();
    _initLastNotification(
      sharedPreferences.getString(_keyLastNotification)?.trim() ?? "",
    );
  }

  Future<void> _initDeviceId() async {
    if (_deviceId!.isEmpty) {
      try {
        if (kIsWeb) {
          _deviceId = ObjectId().hexString;
        } else {
          final deviceInfoPlugin = DeviceInfoPlugin();

          if (Platform.isAndroid) {
            final androidInfo = await deviceInfoPlugin.androidInfo;
            _deviceId = androidInfo.androidId;
          } else if (Platform.isIOS) {
            final iosInfo = await deviceInfoPlugin.iosInfo;
            _deviceId = iosInfo.identifierForVendor;
          }
        }
      } catch (e) {
        debugPrint("App:_initDeviceId:Exception:$e");
      }

      await setDeviceId(deviceId);
    }
  }

  void _initPersonalDetails(String jsonString) {
    try {
      if (jsonString.isNotEmpty) {
        _personalDetails = PersonalDetails.fromJson(
          jsonDecode(jsonString) as Map<String, dynamic>,
        );
      }
    } catch (e) {
      debugPrint("App:_initPersonalDetails:Exception:$e");
    }
  }


  _getPickedLocation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('keyLatLong');
    String? formateAddress = prefs.getString('keyAddress')?.trim();
    if (jsonString != null) {
      Map<String, dynamic> decodedJson = jsonDecode(jsonString);
      Geometry pickedLocations = Geometry.fromJson(decodedJson);
      _geometry = pickedLocations;

    }else{
      prefs.remove("keyLatLong");
    }
    if(formateAddress !=null){
      _address = formateAddress;

    }else{
      prefs.remove("keyAddress");
    }

    // print(pickedLocation);

  }


  // _initPickedLocation(String jsonString)async{
  //   try {
  //     print("tttttttttttt111");
  //     if (jsonString.isNotEmpty) {
  //       LocationPermission permission = await Geolocator.checkPermission();
  //       if (permission == LocationPermission.denied ||
  //           permission == LocationPermission.deniedForever) {
  //         permission = await Geolocator.requestPermission();
  //         if (permission == LocationPermission.denied ||
  //             permission == LocationPermission.deniedForever) {
  //           return;
  //         }
  //       }
  //       print("tttttttttttt113");
  //
  //       // Get the user's current position
  //       Position position = await Geolocator.getCurrentPosition(
  //           desiredAccuracy: LocationAccuracy.high);
  //
  //       // Update the UI with the current location
  //
  //       "Latitude: ${position.latitude}, Longitude: ${position.longitude}";
  //     }
  //   } catch (e) {
  //     print("tttttttttttt112");
  //     debugPrint("location fetch fail${e}");
  //
  //   }
  // }

  // void _initPickedLocation(String jsonString) {
  //   try {
  //     if (jsonString.isNotEmpty) {
  //       _pickedLocation = PickedLocation.fromJson(
  //         jsonDecode(jsonString) as Map<String, dynamic>,
  //       );
  //     }
  //   } catch (e) {
  //     debugPrint("App:_initPickedLocation:Exception:$e");
  //   }
  // }

  void _initLastNotification(String jsonString) {
    try {
      if (jsonString.isNotEmpty) {
        _lastNotification = AppNotification.fromJson(
          jsonDecode(jsonString) as Map<String, dynamic>,
        );
      }
    } catch (e) {
      debugPrint("App:_initLastNotification:Exception:$e");
    }
  }

  Future<void> setFirstTimeLaunch({
    bool value = true,
  }) async {
    try {
      _isFirstTime = value;

      (await SharedPreferences.getInstance()).setBool(_keyFirstTime, value);
    } catch (e) {
      debugPrint("App:setFirstTimeLaunch:Exception:$e");
    }
  }

  Future<void> setDeviceId([String? deviceId]) async {
    try {
      _deviceId = deviceId;

      if (_deviceId != null) {
        (await SharedPreferences.getInstance())
            .setString(_keyDeviceId, _deviceId!);
      } else {
        (await SharedPreferences.getInstance()).remove(_keyDeviceId);
      }
    } catch (e) {
      debugPrint("App:_setDeviceId:Exception:$e");
    }
  }

  Future<void> setPersonalDetails([PersonalDetails? personalDetails]) async {
    try {
      _personalDetails = personalDetails;

      if (_personalDetails != null) {
        (await SharedPreferences.getInstance()).setString(
          _keyPersonalDetails,
          jsonEncode(_personalDetails!.toJson()),
        );
      } else {
        (await SharedPreferences.getInstance()).remove(_keyPersonalDetails);
      }
    } catch (e) {
      debugPrint("App:setPersonalDetails:Exception:$e");
    }
  }

  // Future<void> setPickedLocation([PickedLocation? location]) async {
  //   try {
  //     _pickedLocation = location;
  //
  //     if (_pickedLocation != null) {
  //       (await SharedPreferences.getInstance()).setString(
  //         _keyPickedLocation,
  //         jsonEncode(_pickedLocation!.toJson()),
  //       );
  //     } else {
  //       (await SharedPreferences.getInstance()).remove(_keyPickedLocation);
  //     }
  //   } catch (e) {
  //     debugPrint("App:setPickedLocation:Exception:$e");
  //   }
  // }


  Future <void> setLocation(Geometry? geometry, String ? address, )async{


    try {
      Map<String, dynamic> pickedLocationJson = geometry!.toJson();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String formateAddress = address ?? '';
      _address = formateAddress;
      _geometry = geometry;
      String jsonString = jsonEncode(pickedLocationJson);

      await prefs.setString('keyLatLong', jsonString);

      await prefs.setString('keyAddress', formateAddress);
      // Navigator.pop(context);

    } catch (e) {

      debugPrint("Error storing picked location: $e");
    }







  }

  Future<void> removeLocation() async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('keyLatLong');
    prefs.remove('keyAddress');
  }


  Future<void> setLastNotification([AppNotification? notification]) async {
    try {
      _lastNotification = notification;

      if (_lastNotification != null) {
        (await SharedPreferences.getInstance()).setString(
          _keyLastNotification,
          jsonEncode(_lastNotification!.toJson()),
        );
      } else {
        (await SharedPreferences.getInstance()).remove(_keyLastNotification);
      }
    } catch (e) {
      debugPrint("App:setLastNotification:Exception:$e");
    }
  }
}

final app = App();
