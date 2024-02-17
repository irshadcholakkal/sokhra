import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:events_emitter/emitters/stream_event_emitter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app_settings_module/domain/entity/models/shipping_address.dart';
import '../../app_settings_module/presentation/feature/app_settings/blocs/app_data/app_data_bloc.dart';
import '../../catalogue_module/presentation/feature/details/blocs/delivery_check_cubit/delivery_check_cubit.dart';

const String ADDRESS = "ADDRESS";
const String CUSTOMER_ID = "CUSTOMERID";
const String NOTIFICATION_COUNT = "NOTIFICATIONCOUNT";
const String LAT = "LAT";
const String LNG = "LNG";
const String PLACE = "PLACE";

const String DEFAULT_SHIPPING_ADDRESS = "DEFAULT_SHIPPING_ADDRESS";

class UserData {
  static final _singleton = UserData._internal();

  factory UserData() {
    return _singleton;
  }

  UserData._internal();

  final _eventEmitter = StreamEventEmitter();
  final _defaultShippingAddressChangeEvent =
      "defaultShippingAddressChangeEvent";

  Stream<Map<String, dynamic>> get onDefaultShippingAddressChange =>
      _eventEmitter.on(_defaultShippingAddressChangeEvent);

  String? _pinCode;
  double? _lat;
  double? _lng;
  String? _place;
  String? _defaultAddress;
  String? _defaultAddressMap;
  String? _customerId;
  num? _notificationCount;
  ShippingAddress? _defaultShippingAddress;

  String get pinCode => 
  //560016.toString();
  _defaultShippingAddress?.pincode ?? "";
  

  // String get pinCode => _pinCode ?? "";

  double get lat => 
 // 13.016593.toDouble();
  _lat ?? 0.0;

  double get lng => 
 //77.680397.toDouble();
  _lng ?? 0.0;

  String get place => 
      _defaultShippingAddress?.landmark?.split(",").firstOrNull?.trim() ?? "";

  // String get place => _place ?? "";

  String get defaultAddress =>
      _defaultShippingAddress?.address ?? _defaultAddress ?? "";

  String get defaultAddressMap => _defaultAddressMap ?? "";

  String get customerId => _customerId ?? "";
  

  num get notificationCount => _notificationCount ?? 0;

  ShippingAddress? get defaultShippingAddress => _defaultShippingAddress;

  Future<void> init() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    _pinCode = sharedPreferences.getString(PINCODE)?.trim() ?? "";
    _lat = sharedPreferences.getDouble(LAT) ?? 0.0;
    _lng = sharedPreferences.getDouble(LNG) ?? 0.0;
    _place = sharedPreferences.getString(PLACE)?.trim() ?? "";
    _defaultAddress = sharedPreferences.getString(ADDRESS)?.trim() ?? "";
    _defaultAddressMap = sharedPreferences.getString(DEFAULT_ADDRESS_MAP) ?? "";
    _customerId = sharedPreferences.getString(CUSTOMER_ID) ?? "";
    _notificationCount = sharedPreferences.getInt(NOTIFICATION_COUNT) ?? 0;

    initDefaultShippingAddress();
    print("getInitData:-${_customerId}===");
  }

  Future setCustomerId({required String customerId}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(CUSTOMER_ID, customerId);
  }

  Future setNotificationCount({required int count}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt(NOTIFICATION_COUNT, count);
  }

  Future<void> getUserData() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    _pinCode = sharedPreferences.getString(PINCODE)?.trim() ?? "";
    _place = sharedPreferences.getString(PLACE)?.trim() ?? "";
    _lat = sharedPreferences.getDouble(LAT) ?? 0.0;
    _lng = sharedPreferences.getDouble(LNG) ?? 0.0;
    _defaultAddress = sharedPreferences.getString(ADDRESS)?.trim() ?? "";
    _defaultAddressMap = sharedPreferences.getString(DEFAULT_ADDRESS_MAP) ?? "";
    _customerId = sharedPreferences.getString(CUSTOMER_ID) ?? "";
    _notificationCount = sharedPreferences.getInt(NOTIFICATION_COUNT) ?? 0;

    initDefaultShippingAddress();
    print("getUserData:-${ _customerId}===");
  }

  Future<void> removeUserData() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(PINCODE);
    await sharedPreferences.remove(LAT);
    await sharedPreferences.remove(LNG);
    await sharedPreferences.remove(PLACE);
    await sharedPreferences.remove(ADDRESS);
    await sharedPreferences.remove(CUSTOMER_ID);
    await sharedPreferences.remove(NOTIFICATION_COUNT);
    _defaultAddressMap = sharedPreferences.getString(DEFAULT_ADDRESS_MAP) ?? "";

    clearDefaultShippingAddress();

    await getUserData();
  }

  Future<void> initDefaultShippingAddress() async {
    try {
      final defaultShippingAddressJsonString =
          (await SharedPreferences.getInstance())
              .getString(DEFAULT_SHIPPING_ADDRESS);

      if (defaultShippingAddressJsonString?.isNotEmpty == true) {
        _defaultShippingAddress = ShippingAddress.fromJson(
          jsonDecode(defaultShippingAddressJsonString!),
        );
      }
    } catch (_) {}
  }

  Future<void> saveDefaultShippingAddress(ShippingAddress shippingAddress,
      {bool emit = true}) async {
    try {
      if (true || _defaultShippingAddress?.id != shippingAddress.id) {
        final shouldEmit = emit && (true || pinCode != shippingAddress.pincode);

        _defaultShippingAddress = shippingAddress;
        await (await SharedPreferences.getInstance()).setString(
          DEFAULT_SHIPPING_ADDRESS,
          jsonEncode(shippingAddress.toJson()),
        );

        if (shouldEmit) {
          _eventEmitter.emit(
            _defaultShippingAddressChangeEvent,
            {"isUpdated": true},
          );
        }
      }
    } catch (_) {
      // print(_);
    }
  }

  Future<void> clearDefaultShippingAddress() async {
    try {
      _defaultShippingAddress = null;
      await (await SharedPreferences.getInstance())
          .remove(DEFAULT_SHIPPING_ADDRESS);

      _eventEmitter.emit(
        _defaultShippingAddressChangeEvent,
        {"isUpdated": true},
      );
    } catch (_) {}
  }
}

final userData = UserData();
